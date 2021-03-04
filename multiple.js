#!/usr/bin/env node

const { Workers, event } = require("codeceptjs");
const { devices } = require("playwright");

// const assert = require("assert");

const workerConfig = {
  testConfig: "./codecept.conf.js",
};

// don't initialize workers in constructor
const workers = new Workers(null, workerConfig);
// split tests by suites in 2 groups
const testGroups = workers.createGroupsOfSuites(1);

const firefox = { browser: "firefox" };
const chromium = { browser: "chromium" };
const ublockPath = require('path').join(__dirname, 'extensions/ublock-origin/1.33.2_45');
console.log(ublockPath);

// https://github.com/microsoft/playwright/blob/17e953c2d8bd19ace20059ffaaa85f3f23cfb19d/src/server/deviceDescriptors.js
const browsers = [
  firefox,
  chromium,
  { ...chromium, emulate: devices["iPhone 6"] },
  { ...chromium, emulate: devices["iPad (gen 7) landscape"] },
  //{ ...chromium, emulate: devices["iPad (gen 7)"] },
  { ...chromium, emulate: devices["Pixel 2"] },
  // FIXME
  // { ...chromium, args: [`--disable-extensions-except=${ublockPath}`, `--load-extension=${ublockPath}`] },
  //Extensions in Chrome / Chromium currently only work in non-headless mode
  { ...chromium, chromium: { headless: false, args: [`--disable-extensions-except=${ublockPath}`, `--load-extension=${ublockPath}`] } }
];

const configs = browsers.map((config) => {
  return {
    helpers: {
      Playwright: { ...config },
    },
    plugins: {
      pauseOnFail: {
        enabled: false,
      },
    },
  };
});

for (const config of configs) {
  for (const group of testGroups) {
    const worker = workers.spawn();
    worker.addTests(group);
    worker.addConfig(config);
  }
}

workers.on(event.suite.before, (suite) => {
  console.log("suite : ", suite.title);
  // assert.fail();
});

workers.on(event.test.before, (test) => {
  console.log("test : ", test.title);
});

workers.on(event.test.failed, (failedTest) => {
  console.log("Failed : ", failedTest.title);
});

// Listen events for passed test
workers.on(event.test.passed, (successTest) => {
  console.log("Passed : ", successTest.title);
});

workers.on(event.all.result, (status, completedTests, workerStats) => {
  // print output
  console.log("Test status : ", status ? "Passes" : "Failed ");

  // print stats
  console.log(`Total tests : ${workerStats.tests}`);
  console.log(`Passed tests : ${workerStats.passes}`);
  console.log(`Failed test tests : ${workerStats.failures}`);

  // If you don't want to listen for failed and passed test separately, use completedTests object
  for (const test of Object.values(completedTests)) {
    console.log(`Test status: ${test.err === null}, `, `Test : ${test.title}`);
  }
});

// test run status will also be available in event
workers.on(event.all.result, () => {
  // Use printResults() to display result with standard style
  workers.printResults();
});

// run workers as async function
runWorkers();

async function runWorkers() {
  try {
    await workers.bootstrapAll();
    // run tests
    await workers.run();
  } finally {
    // run teardown All
    await workers.teardownAll();
  }
}
