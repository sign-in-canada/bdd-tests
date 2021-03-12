@saved @auth @unit @GCKey

Feature: CATSLAB - GCKey Login
    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the Dev1 client page

    Scenario: GCKey login via the client

        When the element "Sign in with GCKey" is displayed
        And I click on the button "Sign in with GCKey"
        And I should see "Welcome to GCKey"
        And I set the inputfield "Username" to <gckey user>
        And I set the inputfield "Password" to <gckey password>
        And I click on the button "Sign In"
        And the element "Continue" is displayed
        And I click on the button "Continue"
        Then the url should contain "canada.ca"
        And the url should contain "code="