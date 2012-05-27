Feature: display an authors expressions

  In order to see expressions added by an user
  As a visitor
  I want to see a list of expressions on their author's page

  Background:
    Given 2 english expressions by John
    And   3 french  expressions by John

  Scenario: See the author's page of an expression
    When I go to the homepage
    And  I click on author link within an expression added by John
    Then I should see the page of John
    And I should see 2 english expressions added by John
    And I should see 3 french  expressions added by John

  Scenario: See an authors expressions on his page, grouped by language
    When I go to John's page

    When I set language to english
    Then I should see "2 expressions added by John in english"
    Then I should see "3 expressions added by John in french"

    When I set language to french
    Then I should see "2 expressions en Anglais ajoutées par John"
    Then I should see "3 expressions en Français ajoutées par John"