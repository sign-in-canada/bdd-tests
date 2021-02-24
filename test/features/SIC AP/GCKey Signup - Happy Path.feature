
@live @signup @mocked
Feature: CATSLAB - GCKey Sign Up
    As a user
    I want to sign up to GCKey via the Relying Party simulator

    Background:
        Given I open the Relying Party simulator page

    Scenario: Successful create credentials

        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        When I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the GCKey CSP
        Then the element "Sign up with GCKey" is displayed
        When I click on the button "Sign up with GCKey"

        ## GCKey Welcome Page
        Then I should see "Welcome to GCKey"

        ## GCKey Terms and Conditions page
        When I click on the button "Sign Up"

        ## GCKey Create Your Username page.
        Then I should see "1 of 4"

        When I click on the button "I accept"
        Then I should see "2 of 4"

        When I have a valid random GCKey username <testuser>
        And I set the inputfield "Create Your Username" to <testuser>
        And I click on the button "Continue"
        And I pause for 1000ms
        Then I should see "3 of 4"

        # GCKey Create a Password page
        When I have a valid random GCKey password <testpassword>
        And I set the inputfield "Create Your Password" to <testpassword>
        And I set the inputfield "Confirm Your Password" to <testpassword>
        And I pause for 1000ms
        And I click on the button "Continue"
        Then I should see "4 of 4"

        ## GCKey Create Your Recovery Questions, Answers and Hints page

        When I select the option with the text "What was my first pet's name?" for the element "Select a Recovery Question"
        And I set the inputfield "My Recovery Answer" to "Fido"
        And I set the inputfield "My Memorable Person" to "Also Fido"
        And I set the inputfield "My Memorable Person Hint" to "dogsRpeople"
        And I set the inputfield "My Memorable Date" to "2000-01-01"
        And I set the inputfield "My Memorable Date Hint" to "Fido Day"
        And I click on the button "Continue"
        Then I should see "GCKey Sign Up Complete"

        When I click on the button "Sign Up Complete Continue"
#        Then the browser error log should be clear
# Then I should receive a CATS 2.0 cookie

