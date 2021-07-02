Tests that mock-csp can be served locally.

  Background:
  Backgrounds: env/browser, rp1, mock csp, default-browser

  Scenario: Test mock-csp page
    When I open the csp page
    