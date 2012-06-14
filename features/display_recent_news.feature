Feature: display recent expressions

  In order to know what's new on expresto
  As a visitor
  I want to visit the homepage and read the recent news

  Background:
    Given languages French, English are available
    Given 1 english expressions by Mike
    And   1 french  expressions by Mike
    And   1 published news by Daniel with english body "Yeah, Expresto is online !" and french body "Yeah, Expresto est en ligne !"
    And   1 published news by Daniel with english body "Just added the news system !" and french body "Système de news tout juste ajouté !"
    And   1 unpublished news by Daniel with english body "Unpublished" and french body "Pas encore publié"

  Scenario: See most recent news on homepage

    When I go to the homepage
    And  I set language to english
    Then I should see "What's new on Expresto ?"
    And  I should see "Yeah, Expresto is online !"
    And  I should see "Just added the news system !"
    But  I should not see "Yeah, Expresto est en ligne !"
    And  I should not see "Système de news tout juste ajouté !"
    And  I should not see "Unpublished"
    And  I should not see "Pas encore publié"

    When I go to the homepage
    And  I set language to french
    Then I should see "Quoi de neuf sur Expresto ?"
    And  I should see "Yeah, Expresto est en ligne !"
    And  I should see "Système de news tout juste ajouté !"
    But  I should not see "Yeah, Expresto is online !"
    And  I should not see "Just added the news system !"
    And  I should not see "Unpublished"
    And  I should not see "Pas encore publié"

