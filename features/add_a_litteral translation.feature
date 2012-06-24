Feature: Litteral and semantic translations

  In order allow people to learn about idiomatic expressions in various languages
  As a member of expresto
  I want to add litteral and semantic translations to an expression

  Background:
    Given languages English, French are available
    Given an expression in french with body "C'est le bouquet"
    Given I am logged in as 'Jack'

  Scenario: Add litteral and semantic translations in english for a french expression
    When  I go to the last expression page
    Then  I should see "C'est le bouquet"

    When  I set language to english
    And   I click on "Add english translation"
    And   I fill in "Litteral translation" with "That's the bouquet"
    And   I fill in "Semantic translation" with "That's the limit"
    And   I click on "Add my translation"

    Then I should see "C'est le bouquet"
    And  I should see "That's the bouquet"
    And  I should see "That's the limit"






