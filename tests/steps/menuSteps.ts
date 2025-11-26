
import { Then, When } from '@cucumber/cucumber';
import { expect } from '@playwright/test';
import fs from 'fs';
import path from 'path';
import { Browser } from 'playwright';
import { v4 as uuidv4 } from "uuid";
import { logMessage } from '../../utils/chatLogger';
import { evaluateBotResponse } from '../../utils/evaluateResponse';
import { CustomWorld } from '../support/world';
const { allure } = require('allure-cucumberjs');

let browser:Browser;

const responses: { index: number; conversationId: string; text: string; screenshotPath: string }[] = [];


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

When('I send message {string}', {timeout: 50000},async function (msg: string) {
  await this.page.fill('div[aria-placeholder="Type a message"]', msg);
  await this.page.keyboard.press('Enter');
  await this.page.waitForTimeout(5000);
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




// When('I send {string} message {int} times and capture responses', {timeout: 8000000}, async function (msg:string, count: number) {
//   const screenshotsDir = path.join("reports", "screenshots");
//   if (!fs.existsSync(screenshotsDir)) fs.mkdirSync(screenshotsDir, { recursive: true });

//   for (let i = 0; i < count; i++) {
//     console.log(`📤 Sending message #${i + 1}`);

//     // Send message
//     await this.page.fill('div[aria-placeholder="Type a message"]', msg);
//     await this.page.keyboard.press('Enter');
//     await this.page.waitForTimeout(15000);
//     logMessage('user', msg);


//     let pleaseText = "";

// try {
//   const lastIncoming = this.page.locator('div.message-in').last();

//   // Wait until last message contains "Please" or timeout after 5s
//   await lastIncoming.waitFor({ 
//     state: 'visible', 
//     timeout: 600000 
//   });

//   const text = await lastIncoming.textContent();
//   if (text?.includes("Please")) {
//     pleaseText = text.trim();
//     console.log("💬 Optional intermediate message found:", pleaseText);
//   } else {
//     console.log("ℹ️ 'Please' message not found in last message.");
//   }
// } catch (err) {
//   console.log("ℹ️ 'Please' message did not appear, continuing...");
// }
//  await this.page.waitForTimeout(30000);

//     // Wait for bot response

//     await this.page.waitForSelector('.message-in.focusable-list-item', { timeout: 8000000 });

  
//       // Wait for the last incoming bot message to appear
//      const botMsg = await this.page.waitForSelector(
//       '(//div[contains(@class,"message-in")]//span[contains(@class,"selectable-text")])[last()]',
//         { timeout: 800000 }
//       );

//      // Get message text
//      const text = (await botMsg.textContent())?.trim() || "No response";

//      console.log("💬 Latest Bot Response:", text);

//      const screenshotPath = path.join(screenshotsDir, `response_${i + 1}.png`);

//      const chatElement = await this.page.$('div#main'); // chat area
//      let buf: Buffer;

//      if (chatElement) {
//      buf = await chatElement.screenshot({ path: screenshotPath });
//      } else {
//      buf = await this.page.screenshot({ path: screenshotPath, fullPage: false });
//      }

// // Attach to report (Cucumber/Allure)
//      await this.attach(buf, 'image/png');

//     responses.push({
//       index: i + 1,
//       text,
//       screenshotPath,
//     });

//     console.log(`✅ Captured Response #${i + 1}: ${text}`);
//   }

//   // Save data to JSON for reference
//   fs.writeFileSync("reports/accountBalanceResponses.json", JSON.stringify(responses, null, 2));
// });



// Then("I should generate HTML report with screenshots",{timeout: 8000000}, async function () {
//   console.log("📄 Generating HTML report with screenshots...");

//   const html = `
//   <html>
//     <head>
//       <title>Account Balance Bot Response Report</title>
//       <style>
//         body {
//           font-family: Arial, sans-serif;
//           background: #f9fafc;
//           padding: 20px;
//         }
//         h2 {
//           color: #007bff;
//         }
//         table {
//           width: 100%;
//           border-collapse: collapse;
//           margin-top: 20px;
//         }
//         th, td {
//           border: 1px solid #ccc;
//           padding: 10px;
//           text-align: left;
//           vertical-align: top;
//         }
//         th {
//           background-color: #007bff;
//           color: white;
//         }
//         img {
//           width: 250px;
//           border-radius: 8px;
//           box-shadow: 0 2px 6px rgba(0,0,0,0.2);
//         }
//         tr:nth-child(even) { background: #f2f2f2; }
//       </style>
//     </head>
//     <body>
//       <h2>Account Balance Bot Response Report (100 Iterations)</h2>
//       <table>
//         <tr>
//           <th>#</th>
//           <th>Bot Response</th>
//           <th>Screenshot</th>
//         </tr>
//         ${responses
//           .map(
//             (r) => `
//           <tr>
//             <td>${r.index}</td>
//             <td>${r.text}</td>
//             <td><img src="${path.relative("reports", r.screenshotPath)}" alt="Response Screenshot ${r.index}"></td>
//           </tr>`
//           )
//           .join("")}
//       </table>
//     </body>
//   </html>`;

//   fs.writeFileSync("reports/accountBalanceReport.html", html);
//   console.log("✅ HTML report generated: reports/accountBalanceReport.html");
// });


Then("I should generate HTML report with screenshots",{timeout: 8000000}, async function () {
  console.log("📄 Generating HTML report with embedded screenshots...");

  const html = `
  <html>
    <head>
      <title>Account Balance Bot Response Report</title>
      <style>
        body { font-family: Arial, sans-serif; background: #f9fafc; padding: 20px; }
        h2 { color: #007bff; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; vertical-align: top; }
        th { background-color: #007bff; color: white; }
        img { width: 250px; border-radius: 8px; box-shadow: 0 2px 6px rgba(0,0,0,0.2); }
        tr:nth-child(even) { background: #f2f2f2; }
      </style>
    </head>
    <body>
      <h2>Account Balance Bot Response Report (${responses.length} Iterations)</h2>
      <table>
        <tr>
          <th>#</th>
          <th>Bot Response</th>
          <th>Screenshot</th>
        </tr>
        ${responses
          .map((r) => {
            // Convert screenshot to base64
            const imgBuffer = fs.readFileSync(r.screenshotPath);
            const base64 = imgBuffer.toString('base64');
            return `
              <tr>
                <td>${r.index}</td>
                <td>${r.text}</td>
                <td><img src="data:image/png;base64,${base64}" alt="Response ${r.index}"/></td>
              </tr>
            `;
          })
          .join("")}
      </table>
    </body>
  </html>
  `;

  fs.writeFileSync("reports/accountBalanceReport.html", html);
  console.log("✅ HTML report generated with embedded screenshots: reports/accountBalanceReport.html");
});

When('I send {string} message {int} times and capture responses',{ timeout: 8000000 },async function (msg: string, count: number) {
    const screenshotsDir = path.join("reports", "screenshots");
    if (!fs.existsSync(screenshotsDir))
      fs.mkdirSync(screenshotsDir, { recursive: true });

    for (let i = 0; i < count; i++) {
      // ✅ Generate a unique conversation ID for this iteration
      const conversationId = `conv_${i + 1}_${Date.now()}_${uuidv4().slice(0, 8)}`;
      console.log(`📤 Sending message #${i + 1} | Conversation ID: ${conversationId}`);

      // ✅ Send the same message, but include unique conversation ID (optional)
      const messageToSend = `${msg}`;
      await this.page.fill('div[aria-placeholder="Type a message"]', messageToSend);
      await this.page.keyboard.press("Enter");

      await this.page.waitForTimeout(15000);
      logMessage("user", messageToSend);

      // --- Optional intermediate “Please...” message ---
      let pleaseText = "";
      try {
        const lastIncoming = this.page.locator("div.message-in").last();
        await lastIncoming.waitFor({ state: "visible", timeout: 600000 });
        const text = await lastIncoming.textContent();
        if (text?.includes("Please")) {
          pleaseText = text.trim();
          console.log("💬 Optional intermediate message found:", pleaseText);
        } else {
          console.log("ℹ️ 'Please' message not found in last message.");
        }
      } catch {
        console.log("ℹ️ 'Please' message did not appear, continuing...");
      }

      await this.page.waitForTimeout(15000);

      // --- Wait for bot response ---
      await this.page.waitForSelector(".message-in.focusable-list-item", { timeout: 8000000 });

      const botMsg = await this.page.waitForSelector(
        '(//div[contains(@class,"message-in")]//span[contains(@class,"selectable-text")])[last()]',
        { timeout: 800000 }
      );

      const text = (await botMsg.textContent())?.trim() || "No response";
      console.log(`💬 Latest Bot Response [${conversationId}]: ${text}`);

      // --- Capture screenshot ---
      const screenshotPath = path.join(
        screenshotsDir,
        `response_${i + 1}_${conversationId}.png`
      );
      const chatElement = await this.page.$("div#main");
      const buf = chatElement
        ? await chatElement.screenshot({ path: screenshotPath })
        : await this.page.screenshot({ path: screenshotPath, fullPage: false });

      await this.attach(buf, "image/png");

      responses.push({
        index: i + 1,
        conversationId,
        text,
        screenshotPath,
      });

      console.log(`✅ Captured Response #${i + 1}: ${text}`);

      await this.page.waitForTimeout(5000);
    }

    fs.writeFileSync(
      "reports/accountBalanceResponses.json",
      JSON.stringify(responses, null, 2)
    );
  }
);



///this is dynamic button it clicked as the options are changing
Then('I click on {string} dynamic Menu options', { timeout: 50000 }, async function (this: CustomWorld,msg: string) {
  // Wait for the chat view with the service prompt
  await this.page.waitForSelector(
    `//span[contains(text(),"Tap below to explore all our services and get started right away")]/ancestor::div[@id="main"]`,
    { timeout: 10000 }
  );

  // XPath to match all possible dynamic buttons
  const dynamicButtonXPath = `//div[@id="main"]//button[
    normalize-space(text())="${msg}" 
      or @title="${msg}"
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