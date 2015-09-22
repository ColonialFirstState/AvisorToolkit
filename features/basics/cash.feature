Feature: Explain asset class cash
  Background:
    Given I logged in
    And I am on the explain cash page


  Scenario: display cash
    Then I see the heading "How investing in cash works"
    And I see that it has a risk rating of 1
    And I see Asset Classes is selected on top level menu
    And I see Cash is selected on second level menu
