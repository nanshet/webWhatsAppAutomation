import { defineConfig } from '@playwright/test';

export default defineConfig({
  reporter: [
    ['list'], // console output
    ['allure-playwright'] // allure reporter
  ],
  use: {
    headless: false,
    screenshot: 'only-on-failure',
    trace: 'retain-on-failure'
  },
  timeout: 60 * 1000
});
