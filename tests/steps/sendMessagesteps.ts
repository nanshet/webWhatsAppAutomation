
import {Browser, BrowserContext, chromium, } from 'playwright'
import { expect } from '@playwright/test';
import {Given, Then, When} from '@cucumber/cucumber';
import { evaluateBotResponse } from '../../utils/evaluateResponse';
import fs from 'fs';
import path from 'path';
import {getQuestionsFromModule} from './../../utils/messsageLoader';
import { logMessage } from '../../utils/chatLogger';
const { allure } = require('allure-cucumberjs');
import {CustomWorld} from './../support/world';

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


Given ('I open Whats Web',{timeout:50000}, async function (this: CustomWorld) {

  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');
// const userDataDir = path.resolve('./whatsapp-session');

// const context = await chromium.launchPersistentContext(userDataDir,{
//   headless:false,
// });
// const pages = context.pages();
// if (pages.length > 0) {
//   this.page = pages[0];
// } else {
//   this.page = await context.newPage();
// }

// //this.page = context.pages().length > 0 ?context.pages()[0]: await context.pages();

// await this.page.goto('https://web.whatsapp.com');
// await this.page.waitForSelector('canvas[aria-label="Scan this QR code to link a device!"], div[aria-label="Chat list"]', { timeout: 120000 });

//   const isLoggedIn = await this.page.$('div[aria-label="Chat list"]');
//   if (isLoggedIn) {
//     console.log('✅ Already logged in. Using persistent session.');
//   } else {
//     console.log('📸 Please scan the QR code to continue.');
//   }
// // Screenshot after sending message
//  const screenshot = await this.page.screenshot();
//  await this.attach(screenshot, 'image/png');
 });
  

When('I search for the {string}',{timeout: 50000},async function (this: CustomWorld,contact :string) {
    const chatList = this.page.locator('div[aria-label="Chat list"]');
    await chatList.waitFor({ state: 'attached' });
    await this.page.fill('//p[contains(@class, "selectable-text")]',contact);
    // const screenshot = await this.page.screenshot();
    // await this.attach(screenshot, 'image/png');

});

When('I selected the contact {string}',{timeout: 50000},async function (this: CustomWorld,contact :string){
   await this.page.waitForSelector(`span[title="${contact}"]`, { timeout: 10000 });
   await this.page.click(`span[title="${contact}"]`);
  //  const screenshot = await this.page.screenshot();
  //  await this.attach(screenshot, 'image/png');
});


When('I send {string}', {timeout: 50000},async function (this: CustomWorld,message:string) {
    await this.page.fill('div[aria-placeholder="Type a message"]', message);
    await this.page.keyboard.press('Enter');
    await this.page.waitForSelector(`//span[contains(text(), "Tap below to explore all our services and get started right away.")]`);
    await this.page.waitForTimeout(5000);
    // const screenshot = await this.page.screenshot();
    // await this.attach(screenshot, 'image/png');

});

When('I just send message {string}', {timeout: 50000},async function (this: CustomWorld,message:string) {
  await this.page.fill('div[aria-placeholder="Type a message"]', message);
  await this.page.keyboard.press('Enter');
  await this.page.waitForTimeout(10000);
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


  
Then('I click on Menu options',{timeout: 50000}, async function (this: CustomWorld) {
  await this.page.waitForSelector(`//button[contains(@title,"Please pick a servi")]`, { timeout: 10000 });
  const buttons = this.page.locator(`//button[contains(@title,"Please pick a servi")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
  // const screenshot = await this.page.screenshot();
  // await this.attach(screenshot, 'image/png');
});

Then('I click on {string} options',{timeout: 50000}, async function (this: CustomWorld,menuOptions:string) {
   await this.page.waitForTimeout(10000)
  await this.page.click(`//div[@role="gridcell"]//div[contains(text(),"${menuOptions}")]`);
   //div[contains(text(),${menuOptions})]`);
  await this.page.waitForTimeout(5000)
  await this.page.click('//span[@data-icon="wds-ic-send-filled"]');
  await this.page.waitForTimeout(5000)

  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');
});

// Then('I click on subMenu options', {timeout: 50000},async () => {
//   await this.page.waitForSelector(`//span[contains(text(),"Please select a service from the list below")]`, { timeout: 10000 });
//   const buttons = await this.page.locator(`//button[contains(@title,"Please select a ser…")]`);
//   await buttons.last().waitFor({ state: 'visible' });
//   await buttons.last().click();
//   await this.page.waitForTimeout(5000)

// });


// Then('I click on subMenu options', {timeout: 50000},async function (this: CustomWorld) {
//   await this.page.waitForSelector(`//span[contains(text(),"Please select a service from the list below")]`, { timeout: 10000 });
//   const buttons = await this.page.locator(`//button[contains(@title,"Please select a ser…")]`);
//   const count = await buttons.count();

//   for (let i = count - 1; i >= 0; i--) {
//     const button = buttons.nth(i);
//     if (await button.isVisible()) {
//       await button.click();
//       console.log(`✅ Clicked visible button at index ${i}`);
//       break;
//     }
//   }
//   // await buttons.last().waitFor({ state: 'visible' });
//   // await buttons.last().click();
//   await this.page.waitForTimeout(5000);
//   const screenshot = await this.page.screenshot();
//   await this.attach(screenshot, 'image/png');
// });

Then('I click on accounts subMenu options', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`//span[contains(text(),"Please select a account to check Account summary")]`, { timeout: 10000 });
  const buttons = await this.page.locator(`//button[contains(@title,"Please select a acc…")]`);
  const count = await buttons.count();

  for (let i = count - 1; i >= 0; i--) {
    const button = buttons.nth(i);
    if (await button.isVisible()) {
      await button.click();
      console.log(`✅ Clicked visible button at index ${i}`);
      break;
    }
  }
  // await buttons.last().waitFor({ state: 'visible' });
  // await buttons.last().click();
  await this.page.waitForTimeout(5000);

});

Then('I select an account {string}', {timeout: 50000}, async function (this: CustomWorld,accountNumber:string)  {
  await this.page.waitForSelector(`//span[contains(text(),"Please select a account to check Account summary")]`, { timeout: 10000 });
  await this.page.waitForTimeout(5000);
  const buttons = await this.page.locator(`//span[text()="${accountNumber}"]`);
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
  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');

});

Then('Response contains the summary details of account which has {string}', {timeout: 50000}, async function (this: CustomWorld,accountType:string)  {
 // const summary = this.page.locator('//span[contains(text(), "LIVIONAIRE CURRENT ACCOUNT")]');
  const summary = this.page.locator(`//span[contains(text() ,"${accountType}")]`);
  await expect(summary).toBeVisible;

  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');

});


Then('I click on {string}', {timeout: 50000},async function (this: CustomWorld,exitOptions:string)  {
  await this.page.waitForSelector(`//span[contains(text(),"Please select a account to check Account summary")]`, { timeout: 10000 });
  await this.page.waitForTimeout(5000);
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
  const screenshot = await this.page.screenshot();
  await this.attach(screenshot, 'image/png');

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



When('I send message {int} from module {string}', async function (this: CustomWorld,index: number, moduleName: string) {
  const questions = getQuestionsFromModule(moduleName);
  const msg = questions[index];

  if (!msg) throw new Error(`❌ No message at index ${index} in module ${moduleName}`);
  await this.page.fill('div[aria-placeholder="Type a message"]', msg);
  await this.page.keyboard.press('Enter');
  await this.page.waitForTimeout(3000);
  logMessage('user', msg);

  await this.attach(`📨 Sent message [${index}]: ${msg}`, 'text/plain');
});
