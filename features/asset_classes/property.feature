Feature: Explain asset class property
  Background:
    Given I logged in
    And I am on the explain property page


  Scenario: display property
    Then I see explaination for "Investing in property"
    And I see Asset Classes selected on top level menu
    And I see Property selected on second level menu

  Scenario: clicking previous
    Given I click on previous
    Then I see explaination for "Investing in fixed interest"

  Scenario: clicking next
    Given I click on next
    Then I see explaination for "Investing in shares"
