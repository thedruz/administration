Feature: Testing the update scenario of releases on the daily channel
##### Please always order by version number descending #####

  ##### Tests 10.0 should go below #####
  Scenario: Updating an outdated-dated ownCloud 10.0 daily
    Given There is a release with channel "daily"
    And The received version is "10.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-daily-master.zip"
    And URL to documentation is "https://doc.owncloud.org/server/10.0/admin_manual/maintenance/upgrade.html"
    
    Given There is a release with channel "daily"
    And The received version is "10.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-daily-master.zip"
    And URL to documentation is "https://doc.owncloud.org/server/10.0/admin_manual/maintenance/upgrade.html"

  ##### Tests for 9.2.x (changed to 10.0) should go below #####
    Given There is a release with channel "daily"
    And The received version is "9.2.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-10.0.10.zip"
    And URL to documentation is "https://doc.owncloud.org/server/10.0/admin_manual/maintenance/upgrade.html"

  ##### Tests for 9.1.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 9.1 daily
    Given There is a release with channel "daily"
    And The received version is "9.1.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-10.0.10.zip"
    And URL to documentation is "https://doc.owncloud.org/server/10.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 9.1 daily
    Given There is a release with channel "daily"
    And The received version is "9.1.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-10.0.10.zip"
    And URL to documentation is "https://doc.owncloud.org/server/10.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 9.1 daily
    Given There is a release with channel "daily"
    And The received version is "9.1.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 9.0.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 9.0 daily
    Given There is a release with channel "daily"
    And The received version is "9.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-9.1.8.zip"
    And URL to documentation is "https://doc.owncloud.org/server/9.1/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 9.0 daily
    Given There is a release with channel "daily"
    And The received version is "9.0.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-9.1.8.zip"
    And URL to documentation is "https://doc.owncloud.org/server/9.1/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 9.0 daily
    Given There is a release with channel "daily"
    And The received version is "9.0.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 8.2.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 8.2 daily
    Given There is a release with channel "daily"
    And The received version is "8.2.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-9.0.11.zip"
    And URL to documentation is "https://doc.owncloud.org/server/9.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 8.2 daily
    Given There is a release with channel "daily"
    And The received version is "8.2.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-9.0.11.zip"
    And URL to documentation is "https://doc.owncloud.org/server/9.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 8.2 daily
    Given There is a release with channel "daily"
    And The received version is "8.2.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 8.1.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 8.1 daily
    Given There is a release with channel "daily"
    And The received version is "8.1.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.2.11.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.2/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 8.1 daily
    Given There is a release with channel "daily"
    And The received version is "8.1.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.2.11.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.2/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 8.1 daily
    Given There is a release with channel "daily"
    And The received version is "8.1.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 8.0.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 8 daily
    Given There is a release with channel "daily"
    And The received version is "8.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.1.12.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.1/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 8 daily
    Given There is a release with channel "daily"
    And The received version is "8.0.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.1.12.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.1/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 8 daily
    Given There is a release with channel "daily"
    And The received version is "8.0.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 7.0.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 7 daily
    Given There is a release with channel "daily"
    And The received version is "7.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.0.16.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 7 daily
    Given There is a release with channel "daily"
    And The received version is "7.0.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-8.0.16.zip"
    And URL to documentation is "https://doc.owncloud.org/server/8.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 7 daily
    Given There is a release with channel "daily"
    And The received version is "7.0.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty

  ##### Tests for 6.0.x should go below #####
  Scenario: Updating an outdated-dated ownCloud 6 daily
    Given There is a release with channel "daily"
    And The received version is "6.0.100"
    And the received build is "2015-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-7.0.15.zip"
    And URL to documentation is "https://doc.owncloud.org/server/7.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an outdated-dated ownCloud 6 daily
    Given There is a release with channel "daily"
    And The received version is "6.0.100"
    And the received build is "2012-10-19T18:44:30+00:00%208ee2009de36e01a9866404f07722892f84c16e3e"
    When The request is sent
    Then The response is non-empty
    And Update to version "100.0.0.0" is available
    And URL to download is "https://download.owncloud.org/community/owncloud-7.0.15.zip"
    And URL to documentation is "https://doc.owncloud.org/server/7.0/admin_manual/maintenance/upgrade.html"

  Scenario: Updating an up-to-date ownCloud 6 daily
    Given There is a release with channel "daily"
    And The received version is "6.0.100"
    And the received build is "2019-10-19T18:44:30+00:00"
    When The request is sent
    Then The response is empty
