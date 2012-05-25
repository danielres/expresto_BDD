Feature: homepage

  In order to see last idiomatic expressions
  As a visitor
  I want to visit the homepage

  Background:
    Given languages French, English are available

  Scenario: See most recent expressions on homepage
    Given 2 english expressions have been added
    And   3 french  expressions have been added
    When I go to the homepage
    Then I should see language menu with English, French

    When I set language to english
    Then I should see "Recent expressions"
    And  I should see 2 expressions in English

    When I set language to french
    Then I should see "Expressions récentes"
    And  I should see 3 expressions in French