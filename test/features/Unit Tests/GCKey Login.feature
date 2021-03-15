@saved @auth @units @GCKey

Feature: CATSLAB - GCKey Login via the OpenID Connect client
    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the OpenID Connect client page

    Scenario: GCKey login via the OpenID Connect client

        When the element "Sign in with GCKey" is displayed
        And I click on the button "Sign in with GCKey"
        And I should see "Welcome to GCKey"
        And I set the inputfield "Username" to <gckey user>
        And I set the inputfield "Password" to <gckey password>
        And I should see "Sign In"
        And I should have the cookie "JSESSIONID"
        And I click on the button "Sign In"
        #And I pause for 30s
        #And I should see "Continue"
        #And the element "Continue" is displayed
        #And I click on the button "_eventId_continue"
        #Then the url should contain "canada.ca"
        #And the url should contain "code="