@client_wd @noauth @regression

Feature: CATSLAB - GCKey Login
    Background:
        Given I open the WD page

    Scenario: Back button @noauth
        When I click on the button "Sign In"
        Then I click on the button "Sign In Canada"
        Then I should be on the Client production chooser page

        When I click on the button "Sign in with GCKey"
        Then I should be on the GCKey signin page

        When I press the back button
        Then I should be on the Client production chooser page

        When I press the back button
        Then I should be on the WD page