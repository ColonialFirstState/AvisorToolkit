Feature: Explain asset class cash
  Background:
    Given I logged in
    And I am on the explain cash page


  Scenario: display cash
    Then I see explaination for "How investing in cash works"
    And I see that it has a risk rating of 1
    And I see Asset Classes selected on top level menu
    And I see Cash selected on second level menu

  Scenario: clicking next
    Given I click on next
    Then I see explaination for "How investing in fixed income works"
