
import { When,Then } from '@cucumber/cucumber';
import { Browser, BrowserContext} from 'playwright';
import { expect } from '@playwright/test';

import {CustomWorld} from '../support/world';


let browser:Browser;
let context :BrowserContext;





Then('I click on Menu options for arabic in Meta', { timeout: 50000 }, async function (this: CustomWorld) {
  // Wait for the chat view with the service prompt
  await this.page.waitForSelector(
    `//span[contains(text(),"الرجاء اختيار الخدمة من القائمة أدناه")]/ancestor::div[@id="main"]`,
    { timeout: 10000 }
  );

  // XPath to match all possible dynamic buttons
  const dynamicButtonXPath = `//div[@id="main"]//button[     normalize-space(text())="اختر خيارًا"        or @title="اختر خيارًا"   ]`;

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


Then('I wait for loans list in arabic and select the loan from the list', {timeout: 50000},async function (this: CustomWorld) {
  await this.page.waitForSelector(`xpath=.//span[contains(text(), "جاري عرض قروضك")]//parent::span[@dir="rtl"]`, { state: "visible" });
  const buttons = await this.page.locator(`//button[@title="اختر خيارًا"]`);
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


Then('I click on subMenu options for arabic in Meta', { timeout: 50000 }, async function (this: CustomWorld) {
  // Wait for the chat view with the service prompt
  await this.page.waitForSelector(
    `//span[contains(text(),"يرجى اختيار خدمة من القائمة أدناه")]/ancestor::div[@id="main"]`,
    { timeout: 10000 }
  );

  // XPath to match all possible dynamic buttons
  const dynamicButtonXPath = `//div[@id="main"]//button[     normalize-space(text())="اختر خيارًا"        or @title="اختر خيارًا"   ]`;

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



When('I send message in Arabic {string}', {timeout: 50000},async function (this: CustomWorld,message:string) {
    await this.page.fill('div[aria-placeholder="Type a message"]', message);
    await this.page.keyboard.press('Enter');
    await this.page.waitForSelector(`xpath=.//span[contains(text(),"الرجاء اختيار الخدمة من القائمة أدناه")]`, { state: "visible" });
    await this.page.waitForTimeout(5000);
    // const screenshot = await this.page.screenshot();
    // await this.attach(screenshot, 'image/png');

});
