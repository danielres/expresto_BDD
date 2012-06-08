Feature: manage expressions

  In order to manage the expressions added by different authors
  As an administrator
  I want to be able to edit and remove expressions

  Background:
    Given language English is available

  Scenario: Remove an expression as an administrator

    Given an expression in english with body "Appropriate expression."
    Given an expression in english with body "Inappropriate expression."

    When  I go to the homepage
    And   I set language to english

    Then  I should see "Appropriate expression."
    And   I should see "Inappropriate expression."
    When  I click on "Inappropriate expression."
    Then  I should not see a "destroy-expression" link

    Given I am logged in as an administrator
    When  I go to the homepage
    And   I click on "Inappropriate expression."
    And   I click on the "destroy-expression" link
    Then  I should see "Appropriate expression."
    But   I should not see "Inappropriate expression."



