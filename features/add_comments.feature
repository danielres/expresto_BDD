Feature: add comments

  As a registered user
  I want to add comments to expressions
  In order to interact with other users

  Background:
    Given 1 english expression

  Scenario: Add a comment to an expression then see it on the expression page, homepage and user's page

    Given I am logged in

    When  I add a comment to the expression
    Then  I should see my comment

    When  I go to the homepage
    Then  I should see my comment


  Scenario: Attempt to add a comment to an expression when not logged in

    Given I am not logged in

    When  I visit the expression
    Then  I should see a suggestion to login to comment