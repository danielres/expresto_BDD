Feature: homepage

  In order to see last idiomatic expressions
  As a visitor
  I want to visit the homepage

  Background:
    Given languages French, English are available
    Given 2 english expressions have been added
    And   3 french  expressions have been added

  Scenario: See most recent expressions on homepage

    When I go to the homepage
    Then I should see language menu with English, French

    When I set language to english
    Then I should see "Recent expressions"
    And  I should see a link list with 2 expressions in English

    When I set language to french
    Then I should see "Expressions récentes"
    And  I should see a link list with 3 expressions in French

  Scenario: Display expressions details
    When I go to the homepage
    And  I set language to english
    And  I click on the first recent expression
    Then I should see the expression page with details


