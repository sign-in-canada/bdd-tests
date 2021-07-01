Feature: Create CATSLAB - GCKey Sign Up
    Scenario: Successful create account
        When I click the checkbox Level 2
        When I click the checkbox ForceAuthn
        When I click "Login"
        Then the URI should match https://rp1.tbstest.catslab.ca/RPSimulator/choose-eng.jsp

        When I open the csp page
        Then I should see "Terms and conditions"
        When I click "English"
        Then I should see "Please choose an option to sign in"

        # This is the Sign In Canada Acceptance Platform tailored for the ATIP application with the integration of the 2 current Credential Service Providers (GCKey and Sign-in Partner) links to their real Test Environments.
        When I click the button "Sign in with GCKey"
        ## GCKey Welcome Page
        Then I should see "Welcome to GCKey"

        ## GCKey Terms and Conditions page
        When I click `Sign Up`

        ## GCKey Create Your Username page.
        Then I should see "1 of 4"

        When I click `I accept`
        Then I should see "2 of 4"

        When I have a valid random username <testuser>
        # "Create Your Username"
        And I input <testuser> for Create Your Username
        When I click `Continue`
        Then I should see "3 of 4"

        # GCKey Create a Password page
        When I have a valid random password <testpassword>
        And I input <testpassword> for Create Your Password
        And I input <testpassword> for Confirm Your Password
        When I click `Continue`
        Then I should see "4 of 4"

        ## GCKey Create Your Recovery Questions, Answers and Hints page

        When I select "What was my first pet's name?" for Select a Recovery Question
        And I input "Fido" for My Recovery Answer
        And I input "Also Fido" for My Memorable Person
        And I input "dogsRpeople" for My Memorable Person Hint
        And I input "2000-01-01" for My Memorable Date
        And I input "Fido Day" for My Memorable Date Hint
        When I click `Continue`
        Then I should see "You have successfully created your GCKey."

        When I click `Continue`




