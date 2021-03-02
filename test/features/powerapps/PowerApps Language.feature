@auth @saved @powerapps

Feature: CATSLAB - GCKey Login
    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the PowerApps page
        Then the url should contain "en-CA"

    Scenario: Keeps French language @language @nowebkit
        When I click on the link "English"
        And I click on the link "Français"
        Then the url should contain "fr-CA"
        And I should see "Se connecter"
        When I click on the link "Se connecter"
        Then I should see "Authenti-Canada"
        When I click on the button "Ouvrez une séance au moyen de votre cléGC"
        Then I should see "Bienvenue au service CléGC"
        When I set the inputfield "Nom d'utilisateur" to <gckey user>
        And I set the inputfield "Mot de passe" to <gckey password>
        And I click on the button "Se connecter"
        And the element "Continue" is displayed
        And I click on the button "Continue"
        Then I should be on the PowerApps page
        And the url should contain "fr-CA"

