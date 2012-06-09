Feature: Correct own expressions

  In order to correct a mistake in my expression contributions
  As an authenticated user
  I should be able to edit and remove my expressions during a limited time

  Background:
    Given language English is available

  Scenario: Edit my expressions only as a logged user

    Given I am logged in as 'Jack'

    Given an expression in english by Jack with body "First expression by Jack."
    And   an expression in english by Jack with body "Second experssion by Jack, with a typo."
    And   an expression in english by Jack with body "Not an expression, should be removed by Jack."
    Given an expression in english by Jane with body "First expression by Jane."
    And   an expression in english by Jane with body "Second experssion by Jane, with a typo."
    And   an expression in english by Jane with body "Not an expression, should be removed by Jane."

    When  I go to the homepage
    And   I set language to english

    Then  I should see "First expression by Jack."
    And   I should see "Second experssion by Jack, with a typo."
    And   I should see "Not an expression, should be removed by Jack."
    And   I should see "First expression by Jane."
    And   I should see "Second experssion by Jane, with a typo."
    And   I should see "Not an expression, should be removed by Jane."

    When  I click on "Not an expression, should be removed by Jack."
    And   I click on the "destroy-expression" link
    Then  I should see "First expression by Jack."
    And   I should see "First expression by Jane."
    But   I should not see "Not an expression, should be removed by Jack."

    When  I click on "Second experssion by Jack, with a typo."
    And   I click on the "update-expression" link
    And   I fill in "expression_body" with "Second expression by Jack, typo corrected."
    And   I click on "Update Expression"
    Then  I should see "Second expression by Jack, typo corrected."

    When  I go to the homepage
    And   I click on "First expression by Jane."
    Then  I should not see a "update-expression" link
    And   I should not see a "destroy-expression" link