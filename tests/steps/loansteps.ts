
import { When,Then } from '@cucumber/cucumber';
import { Browser, BrowserContext} from 'playwright';
import { expect } from '@playwright/test';

import {CustomWorld} from './../support/world';


let browser:Browser;
let context :BrowserContext;



// // Helper: Wait for new bot message after a user message
// async function waitForNewBotMessage(this: CustomWorld,prevCount: number): Promise<string> {
//   await this.page.waitForFunction(
//     ({ selector, count }) => {
//       return document.querySelectorAll(selector).length > count;
//     },
//     { selector: 'div.message-in.focusable-list-item', count: prevCount }, // ✅ passed as a single object
//     { timeout: 30000 } // optional options object
//   );

//   const latestText = await this.page.locator('div.message-in').last().innerText();
  
//   return latestText;
// }

async function waitForNewBotMessage(this: CustomWorld, prevCount: number): Promise<string> {
  await this.page.waitForFunction(
    (prevCount) => {
      const messages = document.querySelectorAll('div.message-in.focusable-list-item');
      return messages.length > prevCount;
    },
    prevCount,
    { timeout: 30000 } // optional options object
  );

  const latestText = await this.page.locator('div.message-in').last().innerText();
  return latestText;
}




Then('The loan number should be {string}',{timeout: 50000}, async function (this: CustomWorld,loanNumber: string) {
    await this.page.waitForSelector(`//span[contains(text(),"Finance Number:")]`, { timeout: 10000 });
    await expect(this.page.getByText(`Finance Number: ${loanNumber}`).first()).toBeVisible();

   // await expect(locator).toBeVisible();
    const screenshot = await this.page.screenshot();
    await this.attach(screenshot, 'image/png');
  });
  
Then('The loan type should be {string}',{timeout: 50000}, async function (loanType: string) {
 
    //const locator = this.page.locator(`xpath=.//strong[text()="Loan Type:"]/parent::span[contains(text(),"${loanType}")]`);
    await expect(this.page.getByText(`Finance Type: ${loanType}`).first()).toBeVisible();
    //await expect(locator).toBeVisible();

    const screenshot = await this.page.screenshot();
    await this.attach(screenshot, 'image/png');
  });



Then( 'Bot should respond with finance number {string} and type {string}',{timeout:500000},async function (this: CustomWorld,expectedNumber: string, expectedType: string) {
  
  await this.page.waitForSelector('div.message-in', { timeout: 60000 });
  const botMessage = this.page.locator('div.message-in').last();

    // Wait for the latest message to appear
    await botMessage.waitFor({ state: 'visible', timeout: 20000 });

    const messages = await this.page.locator('div.message-in').allInnerTexts();
    console.log('All Bot Messages:\n', messages);
    const allMessagesText = messages.join('\n');
    // Extract text
    const text = await botMessage.innerText();

    console.log('🤖 Bot Message:\n', text);

    // Validate content
    expect(allMessagesText).toContain(`${expectedNumber}`);
    expect(allMessagesText).toContain(`${expectedNumber}`);

    // Take screenshot and attach
    const screenshot = await this.page.screenshot();
    await this.attach(screenshot, 'image/png');
  },

);

// Then( 'Bot should respond with {string}', {timeout:500000},async function (value: string) {
//      await this.page.waitForSelector('div.message-in.focusable-list-item', { timeout: 1000000 });
//     const botMessage = this.page.locator('.message-in .selectable-text').last();
//     // Wait for the latest message to appear
//     await botMessage.waitFor({ state: 'visible', timeout: 30000 });
//     const fullBotMessages = await this.page.locator('div.message-in').last().innerText();
//     const initialCount = await this.page.locator('div.message-in').count();
//     const latestMessage = await waitForNewBotMessage(initialCount);

//     // Log for debugging
//     console.log('🟢 Full Bot Message:\n', fullBotMessages);

//     // Validate content
//     expect(latestMessage).toContain(`${value}`);


//     // Take screenshot and attach
//     const screenshot = await this.page.screenshot();
//     await this.attach(screenshot, 'image/png');
//   },
// );



//for single line
Then('Bot should respond with {string}', { timeout: 500000 }, async function (this: CustomWorld, value: string) {
  // soft assert pattern
  try {
    await this.page.waitForSelector('.message-in.focusable-list-item', { timeout: 80000 });

    const botMessage = this.page.locator('.message-in .selectable-text').last();
    await botMessage.waitFor({ state: 'visible', timeout: 80000 });

    const fullBotMessages = await this.page.locator('div.message-in').last().innerText();
    const initialCount = await this.page.locator('div.message-in').count();
    const latestMessage = await waitForNewBotMessage.call(this,initialCount);

    console.log('🟢 Full Bot Message:\n', fullBotMessages);

    // Assertion
    expect(latestMessage).toContain(`${value}`);

    // Screenshot on PASS (chat area only)
    const chatElement = await this.page.$('div#main');  // change selector to actual chat area
    if (chatElement) {
      const buf = await chatElement.screenshot();
      await this.attach(buf, 'image/png');
    } else {
      const buf = await this.page.screenshot({ fullPage: false });
      await this.attach(buf, 'image/png');
    }

  } catch (err) {
    // Capture failures but continue
    // Attach screenshot on FAIL
    const chatElement = await this.page.$('div#main');  // same chat selector
    if (chatElement) {
      const buf = await chatElement.screenshot();
      await this.attach(buf, 'image/png');
    } else {
      const buf = await this.page.screenshot({ fullPage: false });
      await this.attach(buf, 'image/png');
    }

    // record failure in world so After hook can fail scenario
    this.failures.push({ step: `Bot should respond with ${value}`, message: (err as Error).message });

    // optionally log
    console.error(`Soft assertion failed in step "Bot should respond with ${value}":`, err);

    // do not throw here so step doesn't abort other steps
  }
});

//for multiple lines
Then('Bot should respond', { timeout: 500000 }, async function (this: CustomWorld, docString: string) {
  try {
    await this.page.waitForSelector('.message-in.focusable-list-item', { timeout: 30000 });

    const initialCount = await this.page.locator('div.message-in').count();
    const latestMessage = await waitForNewBotMessage.call(this, initialCount);

    const fullBotMessage = await this.page.locator('div.message-in').last().innerText();
    console.log('🟢 Full Bot Message:\n', fullBotMessage);

    // Split multiline expected text and assert line-by-line
    const expectedLines = docString.trim().split('\n').map(line => line.trim());
    for (const line of expectedLines) {
      expect(fullBotMessage).toContain(line);
    }

    // Screenshot on pass
    const chatElement = await this.page.$('div#main');
    const buf = chatElement
      ? await chatElement.screenshot()
      : await this.page.screenshot({ fullPage: false });
    await this.attach(buf, 'image/png');

  } catch (err) {
    // Screenshot on fail
    const chatElement = await this.page.$('div#main');
    const buf = chatElement
      ? await chatElement.screenshot()
      : await this.page.screenshot({ fullPage: false });
    await this.attach(buf, 'image/png');

    this.failures.push({
      step: `Bot should respond with:\n${docString}`,
      message: (err as Error).message,
    });

    console.error(`❌ Soft assertion failed for:\n${docString}\n`, err);
  }
});
