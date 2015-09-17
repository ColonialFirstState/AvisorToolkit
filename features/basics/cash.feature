Feature: cash

  Scenario: display cash
    Given I logged in
    And I am on the explain cash page
    Then I see the heading "How investing in cash works"
