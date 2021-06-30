#@powerapps @noauth @regression @meme

Feature: CATSLAB - GCKey Login
    Background:
    Backgrounds: powerapps, env/browser, test, default-browser
        When I open the PowerApps page
        Then the URI should include en-CA

    Scenario: Back button @noauth
        When the PowerApps NavBar is expanded with the NavBar toggle
        When I click "Sign in"
        And I start step delay of 2000
#        When I click the button "Sign In Canada - CATE"
        # Then I should be on the Test GCKey signin page

        When I press the back button
        Then I should be on the PowerApps page
