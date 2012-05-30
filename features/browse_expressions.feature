
Feature: browse expressions

  In order to discover cool expressions
  I want to be able to browse them in various ways

  Background:
    Given languages French, English are available
    Given 15 english expressions by John
    Given 8 french expressions by John
    Given 25 english expressions by Jane
    Given 32 french expressions by Françoise

  Scenario: See all expressions with pagination on expressions page

    Given I am not logged in
    When  I go to the homepage
    And   I set language to english
    And   I click on the "expressions_index" link
    Then  I should see the "expressions index" page
    Then  I should see "40 expressions in english"
    And   I should see 1 paginator