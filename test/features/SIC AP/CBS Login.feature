
@auth @CBS @login @no-sso
Feature: CATSLAB - CBS Login
    As a user
    I want to log in to CBS via the Relying Party simulator

    Background:
        Given I open the Relying Party simulator page
        And I click on the button "English"

    Scenario: CBS login via the Relying Party simulator
        When I click on the checkbox "Level 2"
        And I click on the checkbox "Force Authn"
        And I click on the link "Login"
        Then I should be on the RP simulator English chooser page

        When I choose the CBS CSP
        # CBS Welcome Page
        And I should see "Select Sign-In Partner"
        And I click on the link "CBSTest1"
        Then the element "test-login" is displayed

        When I click on the link "test-login"
        And I should be on the RP simulator response page
        Then I should see "urn:oasis:names:tc:SAML:2.0:status:Success"
