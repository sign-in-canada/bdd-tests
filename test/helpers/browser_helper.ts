const Helper = require("@codeceptjs/helper");

class BrowserHelper extends Helper {
  getElements(loc) {
    return this.helpers.Playwright._locateClickable(loc);
  }
}

module.exports = BrowserHelper;
export {};
