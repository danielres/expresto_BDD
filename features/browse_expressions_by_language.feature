
Feature: browse expressions by language

  As a simple visitor
  I want to browse expressions in different languages
  In order to discover cool expressions

  Background:
    Given available languages: French, English
    And 1 english expression by John
    And 2 english expressions by Jane
    And 3 french expressions by Françoise
    And 5 french expressions by John

  Scenario: browse to the english expressions page

    When I visit the english homepage
    Then I should see "Most recent expressions in english"

    When I click the "expressions-index" link
    Then I should see "3 expressions in english"