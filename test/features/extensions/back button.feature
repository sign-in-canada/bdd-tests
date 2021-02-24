@powerapps @noauth @regression

Feature: CATSLAB - GCKey Login
    Background:
        Given I open the PowerApps page
        Then the url should contain "en-CA"

    Scenario: Back button @noauth
        When I click on the link "Sign in"
        Then I should be on the QA chooser page
        Then I should see "Sign In Canada"

        When I press the back button
        Then I should be on the PowerApps page