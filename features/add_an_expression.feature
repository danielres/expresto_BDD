Feature: add an expression

  In order to contribute to the expressions database
  I want to add a new expression I know

  Background:
    Given languages French, English are available

  Scenario: Add an expression as a logged user

    Given I am logged in as 'Charlie'
    When  I go to the homepage
    And   I set language to english
    And   I click on the link to add an expression

    When  I fill in "Body" with "This is my cool new expression"
    And   I fill in "Meaning" with "It means that it's cool"
    And   I click the submit button

    Then  I should see the created expression page
    And   I should see "This is my cool new expression"
    And   I should see "It means that it's cool"
    And   I should see "by Charlie"

    When  I go to my user page
    Then  I should see "This is my cool new expression"
    But   I should not see "It means that it's cool"

