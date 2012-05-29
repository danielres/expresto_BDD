Feature: display recent expressions

  In order to learn cool idiomatic expressions
  As a visitor
  I want to visit the homepage and read recently added expressions

  Background:
    Given languages French, English are available
    Given 12 english expressions by Mike
    And   13 french  expressions by Mike

  Scenario: See most recent expressions on homepage

    When I go to the homepage
    Then I should see language menu with English, French

    When I set language to english
    Then I should see "Recent expressions"
    And  I should see a link list with 10 expressions in English with most recent on top
    And  I should see a "More" link to the page "expressions index"

    When I set language to french
    Then I should see "Expressions récentes"
    And  I should see a link list with 10 expressions in French with most recent on top
    And  I should see a "More" link to the page "expressions index"

  Scenario: Display expressions details

    When I go to the homepage
    And  I click on the first recent expression
    Then I should see the expression page with details and Mike as author


