
const reporter = require('multiple-cucumber-html-reporter');


reporter.generate({
  jsonDir: 'reports',              // Folder containing report.json
  reportPath: 'reports/html',      // Output folder for HTML report
  metadata:{
    browser: {
      name: 'chrome',
      version: '117'
    },
    device: 'Local test machine',
    platform: {
      name: 'Windows',
      version: '10'
    }
  },
  customData: {
    title: 'Run Info',
    data: [
      { label: 'Project', value: 'WhatsApp Playwright BDD' },
      { label: 'Release', value: '1.0.0' },
      { label: 'Execution Start Time', value: new Date().toLocaleString() },
      { label: 'Executed By', value: 'Naina' }
    ]
  }
});
