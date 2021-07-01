Tests connecting to the test relying party RP1, and mock creation of an account on GCKey.

  Background:
  Backgrounds: env/browser, gckey-create, rp1, mock csp, default-browser
    When I open the rp1 page
    
  Scenarios: gckey/signup
  Take a screenshot

Run this test on its own using `node node_modules/haibun/build/cli test/sic/ gckey/mock`.

You can override the default browser (Chromium), or use multiple browsers by prepending `HAIBUN_SPLIT_SHARED=a-browser=webkit,firefox`.