
@auth @saved @GCKey @login @no-sso
Feature: CATSLAB - GCKey Login
    As a user
    I want to log in to GCKey via the Relying Party simulator

    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the Relying Party simulator page
        And I click on the button "English"

    Scenario: GCKey login via the Relying Party simulator
        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        And I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the GCKey CSP
        ## GCKey Welcome Page
        And I should see "Welcome to GCKey"
        And I set the inputfield "Username" to <gckey user>
        And I set the inputfield "Password" to <gckey password>
        And I click on the button "Sign In"
        And the element "Continue" is displayed
        And I click on the button "Continue"
        And I should be on the RP simulator response page
        Then I should see "urn:oasis:names:tc:SAML:2.0:status:Success"
