exports.config = {
  output: './output',
  helpers: {
    Playwright: {
      url: 'http://localhost',
      show: true,
      browser: 'chromium',
    },
    CredentialHelper: {
      require: './test/helpers/credential_helper'
    },
  },
  include: {
    I: './test/steps_file',
    SIC: './test/pages/SIC'
  },
  mocha: {},
  bootstrap: null,
  teardown: null,
  hooks: [],
  gherkin: {
    features: './test/features/*.feature',
    steps: ['./test/step_definitions/steps.ts']
  },
  plugins: {
    // screenshotOnFail: {
    //   enabled: true
    // },
    retryFailedStep: {
      enabled: true
    },
    pauseOnFail: {
      enabled: true
    },

  },
  tests: './tests/*.js',
  name: 'sign-in-canada-bdd',
  require: ["ts-node/register"]
}
