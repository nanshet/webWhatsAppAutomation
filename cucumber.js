// module.exports = {
//   default: `--require-module ts-node/register --require tests/steps/**/*.ts --format json:reports/report.json tests/features/**/*.feature`
// };

// cucumber.js or cucumber.conf.js (at project root)
module.exports = {
  default: {
    require: [
      'ts-node/register',
      'tests/steps/**/*.ts',
      'tests/support/**/*.ts'
    ],
    format: [
      'json:reports/report.json',   // cucumber json for multiple-cucumber-html-reporter
      './reporter-allure.js'        // Allure adapter -> writes to allure-results
    ],
    formatOptions: {
      resultsDir: 'allure-results'
    },
    publishQuiet: true
  }
};

