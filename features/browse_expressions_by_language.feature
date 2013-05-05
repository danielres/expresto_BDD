
Feature: browse expressions by language

  As a simple visitor
  I want to browse expressions in different languages
  In order to discover cool expressions from various cultures

  Background:
    Given languages: French, English
    And 2 english expression
    And 3 french expressions
    And I visit the expressions page

  Scenario: browse to the english expressions page
    And  I set language to English
    Then show me the page
    Then I should see "2 expressions in english"

  Scenario: browse to the french expressions page
    And  I set language to French
    Then I should see "3 expressions en français"