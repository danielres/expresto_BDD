Feature: add comments

  As a registered user of expresto
  I want to add comments to expressions
  In order to interact with other registered users

  Background:
    Given language English is available
    Given 1 english expressions by John

  Scenario: Add a comment to an expression as a logged user, and see it on the expression page, the homepage and the user's page

    Given I am logged in as 'Talky'
    When  I go to the homepage
    And   I set language to english
    And   I click on the first recent expression
    And   I click on the "add_comment" link
    And   I fill in "comment_body" with "Supa cool !!"
    And   I click on "Add"
    Then  I should see "Supa cool !!"

    When  I go to the homepage
    Then  I should see "Supa cool !!"
    And   I should see "Added by Talky less than a minute ago"
    And   I should see "1 comment"
    When  I click on "Talky"
    Then  I should see "Supa cool !!"

  Scenario: Attempt to add a comment to an expression as an anonymous user
    When  I go to the homepage
    And   I click on the first recent expression
    Then  I should see "You have to sign in first to add your comments"