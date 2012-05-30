Feature: display an authors expressions

  In order to see expressions added by an user
  As a visitor
  I want to see a list of expressions on their author's page

  Background:
    Given 27 english expressions by John
    And   5 french  expressions by John

  Scenario: See the author's page of an expression with pagination
    When I go to the homepage
    And  I click on author link within an expression added by John
    Then I should see the page of John
    And  I should see 10 english expressions added by John
    And  I should see 5 french  expressions added by John
    And  I should see 1 paginator

  Scenario: See an authors expressions on his page, grouped by language and paginated
    When I go to John's page

    When I set language to english
    Then I should see "27 expressions added by John in english"
    Then I should see "5 expressions added by John in french"

    When I set language to french
    Then I should see "27 expressions en Anglais ajoutées par John"
    Then I should see "5 expressions en Français ajoutées par John"