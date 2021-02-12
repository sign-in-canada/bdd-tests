@live @saved 
Feature: CATSLAB - GCKey Login
    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the Relying Party simulator

    Scenario: Login persisted between RPs