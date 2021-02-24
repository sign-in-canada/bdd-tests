
@auth @saved  @GCKey @login
Feature: CATSLAB - GCKey Login
    As a user
    I want to log in to GCKey via the Relying Party simulator

    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the Relying Party simulator page

    Scenario: Successful create account
        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        When I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the GCKey CSP
        Then the element "Sign in with GCKey" is displayed
        When I click on the button "Sign in with GCKey"

        ## GCKey Welcome Page
        Then I should see "Welcome to GCKey"

        And I set the inputfield "Username" to <gckey user>
        And I set the inputfield "Password" to <gckey password>
        And I click on the button "Sign In"
        Then I should be on the RP simulator English chooser page

