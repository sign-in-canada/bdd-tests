#!/usr/bin/env node

const { Workers, event } = require("codeceptjs");
const assert = require("assert");

const workerConfig = {
  testConfig: "./codecept.conf.js",
};

// don't initialize workers in constructor
const workers = new Workers(null, workerConfig);
// split tests by suites in 2 groups
const testGroups = workers.createGroupsOfSuites(2);

const browsers = ["firefox", "chromium"];

const configs = browsers.map((browser) => {
  return {
    helpers: {
      Playwright: { browser },
    },
    plugins: {
        pauseOnFail: {
            enabled: false
        }
    }
  };
});

for (const config of configs) {
  for (group of testGroups) {
    const worker = workers.spawn();
    worker.addTests(group);
    worker.addConfig(config);
  }
}

workers.on(event.suite.before, (suite) => {
  console.log("suite : ", suite);
  assert.fail();
});

workers.on(event.test.before, (test) => {
  console.log("test : ", test);
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
