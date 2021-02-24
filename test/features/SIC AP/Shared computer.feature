@live @saved @multiple

Feature: CATSLAB - GCKey Login
    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>
        And I open the Relying Party simulator page

    Scenario: Shared computer auto logout from first credentials when logging into different Relying Party with different credentials
        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        When I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the GCKey CSP
        Then the element "Sign in with GCKey" is displayed
        When I click on the button "Sign in with GCKey"

        Then I should see "Welcome to GCKey"

        And I set the inputfield "Username" to <gckey user>
        And I set the inputfield "Password" to <gckey password>
        And I click on the button "Sign In"
        Then I should be on the RP simulator English chooser page

        # second RP

        When I open a new tab
        And I open the Relying Party 2 simulator page
        And I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        When I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the GCKey CSP
        Then the element "Sign in with GCKey" is displayed
        When I click on the button "Sign in with GCKey"

        Then I should see "Welcome to GCKey"

        And I set the inputfield "Username" to <gckey user 2>
        And I set the inputfield "Password" to <gckey password 2>
        And I click on the button "Sign In"
        Then I should be on the RP simulator English chooser page


