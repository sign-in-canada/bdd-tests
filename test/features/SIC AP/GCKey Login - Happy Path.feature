
@auth @saved @GCKey @login @no-sso @mustapha
Feature: CATSLAB - GCKey Login
    As a user
    I want to log in to GCKey via the Relying Party simulator

    Background:
        Given I have a saved username <gckey user>
        And I have a saved password <gckey password>

    Scenario: GCKey login via the Relying Party simulator
        When I open the Relying Party simulator page
        And I click on the button "English"

