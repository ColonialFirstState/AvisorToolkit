Feature: Explain asset class fixed income
  Background:
    Given I logged in
    And I am on the explain fixed income page


  Scenario: display fixed income
    Then I see explaination for "How investing in fixed income works"
    And I see Asset Classes selected on top level menu
    And I see Fixed Income selected on second level menu

  Scenario: clicking previous
    Given I click on previous
    Then I see explaination for "How investing in cash works"

  Scenario: clicking next
    Given I click on next
    Then I see explaination for "How investing in property works"
