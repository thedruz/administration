#! /bin/sh
#
# check_package.sh -- test consistency of the owncloud server package
#
# The top part is owncloud specific apps handling.
# The remainder should be generic consistency test.
# 
# 2015-01-19, jw@owncloud.com, intial draught with automattic apps splitting.
# 2015-01-26, jw@owncloud.com, added generic debian.* vs *.spec checks.
# 2015-04-21, jw@owncloud.com, added dependency test. Easy to fool but better than nothing.
# 2015-05-13, jw@owncloud.com, handle critical=all and ignore owncloud-server-scl-php54 for debian.
# 2015-08-05, jw@owncloud.com, merged apps back into owncloud-server. This obsoletes most of this script.
# 
#### Dependencies:
# Requires: /usr/bin/rpmspec	# from rpm-4.x
####

critical=$1	# 'deb' or 'rpm' or 'all', default: 'rpm'

deb_error=0
rpm_error=0
# set -x

tar_file=*.tar.bz2
tar_top=owncloud

if [ ! -d "$tar_top/apps" ]; then
  tar xf $tar_file		# only works if there is exactly one tar ball.
  tar_top=$(tar tf $tar_file | head -1)
fi

srcdir=$(dirname $0)
specfile=$srcdir/*.spec
debian_control=$srcdir/debian.control
pkgname=$(basename $specfile .spec)

for app in $(ls $tar_top/apps); do
  if [ x"$app" = x"updater" ]; then
    continue
  fi

  if ! grep -q "^%oc_app_package $app\\b" $specfile; then
    echo "TODO: Please add to $pkgname.spec: %oc_app_package $app"
    rpm_error=1
  fi

  ## FIXME: with https://github.com/owncloud/core/issues/18043
  ## we have a valid reason for two way dependencies between server and apps.
  ## This makes seperate app packages questionable.
  if ! grep -q "^PreReq:.*-app-$app\\b" $specfile; then
    echo "TODO: Please add to $pkgname.spec: PreReq: %{name}-app-$app = %{version}"
    rpm_error=1
  fi

  app_pkg=$(echo $pkgname-app-$app | tr _ -)
  if [ ! -f $srcdir/debian.$app_pkg.install ]; then
    echo "TODO: Please add file debian.$app_pkg.install (auto-created)"
    echo "apps/$app/* /var/www/owncloud/apps/$app/" > $srcdir/debian.$app_pkg.install
    deb_error=1
  fi
done

rpmspec --parse $specfile > /tmp/_$$_spec
## will see all app-* packages as we are after macro expansion. 
## HACK: the auto-creation above prevents duplicate messages.
##
while read a b c; do
  test "$a" = '%package' || continue
  if [ "$b" = '-n' ]; then
    sub_pkg=$(echo $c | tr _ -)
  else
    sub_pkg=$(echo $pkgname-$b | tr _ -)
  fi

  test "$sub_pkg" = 'owncloud-server-scl-php54' && continue
  test "$sub_pkg" = 'owncloud-app-updater' && continue

  if [ ! -f $srcdir/debian.$sub_pkg.install ]; then
    echo "TODO: Please add file debian.$sub_pkg.install (missing, $sub_pkg seen in $specfile)"
    deb_error=1
  fi

  # https://www.debian.org/doc/debian-policy/ch-relationships.html#s-replaces

  # have all sub packages declared in the control file
  if ! grep -q "^Package:.*\\b$sub_pkg\\b" $debian_control; then
    # use 'Architecture: all' for noarch packages.
    # use 'Architecture: any' for arch specific packages.
    echo "Package $sub_pkg not found in debian.control (Entry appended)"
    cat <<EOF>>$debian_control

## REMOVE-THIS-LINE-AFTER-REVIEWING-BELOW
Package: $sub_pkg
Architecture: all
Depends: $pkgname-server (= \${binary:Version})
Replaces: owncloud (<< 8.0.0)
Break: owncloud (<< 8.0.0)
Description: The $pkgname subpackage $sub_pkg
 .
 requires owncloud-server
EOF
    deb_error=1
  fi
  # have a versioned dependency to each sub package in the control file
  if [ "$sub_pkg" != "owncloud-server"           -a \
       "$sub_pkg" != "owncloud-server-scl-php54" -a \
       "$sub_pkg" != "owncloud-config-apache"    -a \
       "$sub_pkg" != "owncloud-app-updater" ]; then
  if ! egrep -q "^\s+$sub_pkg\s+\(=" $debian_control; then
    echo "No indented line (Dependency) found for $sub_pkg"
    deb_error=1
  fi
  fi
done < /tmp/_$$_spec
rm -f  /tmp/_$$_spec

if grep -q "REMOVE-THIS" $debian_control; then
  echo "TODO: debian.control needs review. Autogenerated contents near the end with dummy 'Depends:' entry!"
  deb_error=1
fi

## reverse check, all that is listed in debian.control should have a debian.*.install file
cat $debian_control > /tmp/_$$_control
while read a sub_pkg; do
  test "$a" = 'Package:' || continue
  test "$sub_pkg" = 'owncloud-server-scl-php54' && continue
  if [ ! -f $srcdir/debian.$sub_pkg.install ]; then
    echo "TODO: Please add file debian.$sub_pkg.install (missing, $sub_pkg seen in $debian_control)"
    deb_error=1
  fi
done < /tmp/_$$_control
rm -f  /tmp/_$$_control

test "$critical" = 'all' && exit $deb_error$rpm_error
test "$critical" = 'deb' && exit $deb_error
test "$critical" = 'rpm' && exit $rpm_error
exit 0
