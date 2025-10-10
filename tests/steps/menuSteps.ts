
import {Browser, BrowserContext, chromium, } from 'playwright'
import { expect } from '@playwright/test';
import {Given, Then, When} from '@cucumber/cucumber';
import { evaluateBotResponse } from '../../utils/evaluateResponse';
import fs from 'fs';
import path from 'path';
import {getQuestionsFromModule} from '../../utils/messsageLoader';
import { logMessage } from '../../utils/chatLogger';
const { allure } = require('allure-cucumberjs');
import {CustomWorld} from '../support/world';

let browser:Browser;

//let context :BrowserContext;


// Given('I open Whats Web', { timeout: 3600000 }, async () => {
//   const sessionPath = path.resolve('./whatsapp-session.json');
//   browser = await chromium.launch({ headless: false });

//   const context = fs.existsSync(sessionPath)
//       ? await browser.newContext({ storageState: sessionPath })
//       : await browser.newContext();

//   this.page = await context.newthis.page();
//   await this.page.goto('https://web.whatsapp.com');

//   // Wait for WhatsApp to load - either QR or chat list
//   await this.page.waitForSelector('div[aria-label="Chat list"]', { timeout: 60000 });

//   // If QR was shown and login completed, save session
//   const isLoggedIn = await this.page.$('div[aria-label="Chat list"]');
//   if (isLoggedIn && !fs.existsSync(sessionPath)) {
//       await context.storageState({ path: sessionPath });
//       console.log('✅ Session stored at:', sessionPath);
//   } else if (isLoggedIn) {
//     console.log('✅ Session loaded successfully');
//   } else {
//     console.log('⚠️ Still on QR this.page – session might be expired or invalid');
//   }
// });


When('I send {string} in Meta', {timeout: 50000},async function (this: CustomWorld,message:string) {
    await this.page.fill('div[aria-placeholder="Type a message"]', message);
    await this.page.keyboard.press('Enter');
    await this.page.waitForSelector(`//div[contains(text(), "Choose an option")]`);
    await this.page.waitForTimeout(5000);
    // const screenshot = await this.page.screenshot();
    // await this.attach(screenshot, 'image/png');

});

When('I just send message {string}', {timeout: 50000},async function (this: CustomWorld,message:string) {
  await this.page.fill('div[aria-placeholder="Type a message"]', message);
  await this.page.keyboard.press('Enter');
  await this.page.waitForTimeout(5000);
  // const screenshot = await this.page.screenshot();
  // await this.attach(screenshot, 'image/png');

});

Then('the message should appear in the chat', async function(this: CustomWorld) {
    const lastMessage = await this.page.locator('span.selectable-text').last().textContent();
    console.log('Last message sent:', lastMessage);
    await this.page.waitForTimeout(5000);
    // const screenshot = await this.page.screenshot();
    // await this.attach(screenshot, 'image/png');
  });


  
Then('I click on Menu option in Meta',{timeout: 50000}, async function (this: CustomWorld) {
  await this.page.waitForSelector(`//div[contains(text(), "Explore Services")]`, { timeout: 10000 });
  const buttons = this.page.locator(`//div[contains(text(), "Explore Services")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
   const screenshot = await this.page.screenshot();
   await this.attach(screenshot, 'image/png');
});

Then('I click on {string} options in Meta',{timeout: 50000}, async function (this: CustomWorld,menuOptions:string) {
  await this.page.click(`//div[@role="gridcell"]//div[contains(text(),"${menuOptions}")]`);
   //div[contains(text(),${menuOptions})]`);
  await this.page.waitForTimeout(5000)
  await this.page.click('//span[@data-icon="wds-ic-send-filled"]');
  await this.page.waitForTimeout(5000)

  // const screenshot = await this.page.screenshot();
  // await this.attach(screenshot, 'image/png');
});



Then('I click on subMenu options', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`//span[contains(text(),"Please select a service from the list below")]`, { timeout: 20000 });
  await this.page.waitForTimeout(10000);
  const buttons = await this.page.locator(`//button[contains(text(),"Choose an option")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
  
  await this.page.waitForTimeout(5000);
 
});


Then('I select an account {string} in Meta', {timeout: 50000}, async function (this: CustomWorld,accountNumber:string)  {

  await this.page.waitForTimeout(15000);
  const buttons = await this.page.locator(`//button[@aria-label="${accountNumber}"]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
  await this.page.waitForTimeout(5000);
  await this.page.click('//span[@data-icon="wds-ic-send-filled"]');
  await this.page.waitForTimeout(5000)
  // const screenshot = await this.page.screenshot();
  // await this.attach(screenshot, 'image/png');

});



Then('I capture a screenshot of the this page', async function (this: CustomWorld) {
  const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
  const filepath = path.join('reports/screenshots', `step-screenshot-${timestamp}.png`);

  if (!fs.existsSync('reports/screenshots')) {
    fs.mkdirSync('reports/screenshots', { recursive: true });
  }

  const buffer = await this.page.screenshot({ fullPage: true });
  fs.writeFileSync(filepath, buffer);

  await this.attach(buffer, 'image/png');
});


Then('the {string} module response should match intent {string}',{timeout: 50000}, async function (this: CustomWorld,
  moduleName: string,
  expectedIntent: string
) {
  const responseText = await this.page.locator('.bot-response').last().textContent();
  const isValid = await evaluateBotResponse(moduleName, responseText ?? '', expectedIntent);

  await this.attach(`Bot response: ${responseText}`, 'text/plain');
  await this.attach(`GPT Evaluation: ${isValid ? '✅ PASS' : '❌ FAIL'}`, 'text/plain');

  expect(isValid).toBeTruthy();
  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');
});



Then('I wait for accounts list to appear', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`//span[contains(text(),"Please select an account")]`, { timeout: 10000 });
  await this.page.waitForTimeout(5000);
   const buttons = await this.page.locator(`//span[contains(text(),"Please select an accont")]`);
  const count = await buttons.count();

  await this.page.waitForTimeout(5000);
});

Then('Response contains the  details of account which has {string}', {timeout: 50000}, async function (this: CustomWorld,accountType:string)  {
  await this.page.waitForTimeout(5000);
  const summary = this.page.locator(`//span[contains(text() ,"${accountType}")]`);
  await expect(summary).toBeVisible;


});

Then('I click on {string} in Meta', {timeout: 50000},async function (this: CustomWorld,exitOptions:string)  {
  //await this.page.waitForSelector(`//span[contains(text(),"Please select a account to check Account summary")]`, { timeout: 10000 });
  await this.page.waitForTimeout(15000);
  const buttons = await this.page.locator(`//span[text()="${exitOptions}"]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
  await this.page.waitForTimeout(5000)
  // const screenshot = await this.page.screenshot();
  // await this.attach(screenshot, 'image/png');

});
Then('I wait for service request list to appear', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`//span[contains(text(),"️ Loading your service requests")]`, { timeout: 10000 });
  await this.page.waitForTimeout(5000);
});

When('I send message {string}', async function (msg: string) {
  await this.page.fill('div[aria-placeholder="Type a message"]', msg);
  await this.page.keyboard.press('Enter');
  await this.page.waitForTimeout(3000);
  logMessage('user', msg);

//  await this.attach(`📨 Sent message [${msg}]: ${msg}`, 'text/plain');
});


Then('I click on Menu options in Meta', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`//span[contains(text(),"Please select a service from the list below")]/ancestor::div[@id="main"]`, { timeout: 10000 });
  const buttons = await this.page.locator(`//div[contains(text(),"Explore Services")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }

  }
  
  await this.page.waitForTimeout(5000);
});

///this is dynamic button it clicked as the options are changing
Then('I click on dynamic Menu options in Meta', { timeout: 50000 }, async function (this: CustomWorld) {
  // Wait for the chat view with the service prompt
  await this.page.waitForSelector(
    `//span[contains(text(),"Tap below to explore all our services and get started right away")]/ancestor::div[@id="main"]`,
    { timeout: 10000 }
  );

  // XPath to match all possible dynamic buttons
  const dynamicButtonXPath = `//div[@id="main"]//button[
    normalize-space(text())="Explore Services" 
      or @title="Explore Services"
  ]`;

   await this.page.waitForSelector(dynamicButtonXPath,
    { timeout: 10000 }
  );
  // Count matching buttons
  const buttons = this.page.locator(dynamicButtonXPath);
  const count = await buttons.count();

  if (count === 0) {
    throw new Error('❌ No dynamic button appeared.');
  }

  // Click the last button (latest one in chat)
  await buttons.nth(count - 1).click();
  console.log('🟢 Clicked the latest dynamic menu button');

  // Optional wait for next bot message
  await this.page.waitForTimeout(5000);
});

Then('I wait for loans list and select the loan from the list', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`xpath=.//span[contains(text(),"Listing your")]`, { state: "visible" });
  const buttons = await this.page.locator(`//div[contains(text(),"Choose an option")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }

  }
  
  await this.page.waitForTimeout(5000);
});
