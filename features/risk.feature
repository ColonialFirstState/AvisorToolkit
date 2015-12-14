Feature: Explain risk
  Background:
    Given I logged in
    And I am on the risk page

  Scenario: display risk
    Then I see explaination for "Conservative portfolio"
    And I see Risk selected on top level menu
    And I see that it has a risk rating of 1

  Scenario: clicking next
    Given I click on next
    Then I see explaination for "An example of investing in cash"
