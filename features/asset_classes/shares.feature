Feature: Explain asset class property
  Background:
    Given I logged in
    And I am on the explain shares page


  Scenario: display property
    Then I see explaination for "How investing in shares works"
    And I see Asset Classes selected on top level menu
    And I see Shares selected on second level menu

  Scenario: clicking previous
    Given I click on previous
    Then I see explaination for "How investing in property works"
