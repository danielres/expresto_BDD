Feature: add an expression

  In order to contribute to Expresto
  I want to add one of my expressions

  Background:
    Given language English is available

  Scenario: Add an expression as a logged user

    Given I am logged in

    When  I add my expression
    Then  I should see my expression with its details and a link to my public profile

    When  I visit my public profile
    Then  I should see a link to my expression

  Scenario: Attempt to add an expression as an anonymous user

    Given I am not logged in
    Then  I should see a way to log in

    When  I attempt to add an expression
    Then  I should be offered an obvious way to authenticate
