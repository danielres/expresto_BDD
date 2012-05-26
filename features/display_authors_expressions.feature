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
