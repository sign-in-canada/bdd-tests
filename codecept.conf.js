const { setHeadlessWhen } = require("@codeceptjs/configure");
const { devices } = require("playwright");

setHeadlessWhen(process.env.CI);
const firefox = { browser: "firefox" };
const chromium = { browser: "chromium" };
const webkit = { browser: "webkit" };
const ublockPath = require("path").join(__dirname, "extensions/ublock-origin/1.33.2_45");

exports.config = {
  output: "./output",
  timeout: 20000,
  multiple: {
    extensions: {
      browsers: [chromium],
    },
  },
  helpers: {
    Playwright: {
      url: "http://localhost",
      show: true,
      // chromium: { headless: false, args: [`--disable-extensions-except=${ublockPath}`, `--load-extension=${ublockPath}`] }
    },
    CredentialHelper: {
      require: "./test/helpers/credential_helper",
    },
    BrowserHelper: {
      require: "./test/helpers/browser_helper",
    },
  },
  include: {
    I: "./test/steps_file",
    SIC: "./test/pages/SIC",
  },
  mocha: {
    reporterOptions: {
      mochaFile: "output/test-results.xml",
    },
  },
  bootstrap: null,
  teardown: null,
  hooks: [],
  gherkin: {
    features: "./test/features/**/*.feature",
    steps: ["./test/step_definitions/steps.ts"],
  },
  plugins: {
    screenshotOnFail: {
      enabled: true,
    },
    retryFailedStep: {
      enabled: true,
    },
    pauseOnFail: {
      enabled: true,
    },
    tryTo: {
      enabled: true,
    },
  },
  tests: "./tests/*.js",
  name: "sign-in-canada-bdd",
  require: ["ts-node/register"],
};
