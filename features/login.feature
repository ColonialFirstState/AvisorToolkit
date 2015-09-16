Feature: login

  Scenario: correct login
    Given I am on the login page
    And I enter the correct passphrase
    When I login
    Then I am logged in

  Scenario: invalid login
    Given I am on the login page
    And I enter the wrong passphrase
    When I login
    Then I am not logged in
