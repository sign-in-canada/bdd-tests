exports.config = {
  output: './output',
  helpers: {
    Playwright: {
      url: 'http://localhost',
      show: true,
      browser: 'chromium',
    },
    CredentialHelper: {
      require: './credential_helper'
    },
    IntrospectHelper: {
      require: './introspect_helper'

    }
  },
  include: {
    I: './steps_file.js',
    SIC: './pages/SIC.js'
  },
  mocha: {},
  bootstrap: null,
  teardown: null,
  hooks: [],
  gherkin: {
    features: './features/*.feature',
    steps: ['./step_definitions/steps.js']
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
