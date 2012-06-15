Feature: add comments

  In order to interact with other members
  I want to add comments expressions

  Background:
    Given language English is available
    Given 2 english expressions by John

  Scenario: Add a comment as a logged user

    Given I am logged in as 'Talky'
    When  I go to the homepage
    And   I set language to english
    And   I click on the first recent expression
    And   I click on the "add_comment" link
    And   I fill in "comment_body" with "Supa cool !!"
    And   I click on "Create Comment"
    Then  I should see "Supa cool !!"
