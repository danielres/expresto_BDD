Feature: add an expression

  In order to share an idiomatic expression
  I want to add one of my expressions on Expresto

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
    Then  I should see how to log in

    When  I attempt to add an expression
    Then  I should see in an obvious way how to log in
