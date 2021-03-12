@saved @auth @unit @CBS

Feature: CATSLAB - CBS Login
    Background:
        Given I open the OpenID Connect client page

    Scenario: CBS login via the OpenID Connect client

        And the element "Sign in with Sign-In Partner" is displayed
        And I click on the button "Sign in with Sign-In Partner"
        And I click on the link "CBSTest1"
        Then the element "test-login" is displayed

        When I click on the link "test-login"
        Then the url should contain "canada.ca"
        And the url should contain "code="