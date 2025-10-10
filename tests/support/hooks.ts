import { BeforeAll, AfterAll, Before, After, AfterStep, BeforeStep } from '@cucumber/cucumber';
import { CustomWorld } from './world';
import { BrowserContext,Page } from 'playwright';

const CHAT_SELECTOR = 'div#main';

let globalContext:BrowserContext;
let globalPage:Page;

// // Launch WhatsApp once for all scenarios
BeforeAll({ timeout: 300000 },async () => {
  const result = await CustomWorld.init(); // ✅ call init() from world
  globalContext = result.context;
  globalPage = result.page;
});


// Before({ timeout: 120000 }, async function (this: CustomWorld) {
//   const result = await CustomWorld.init();
//   globalContext = result.context;
//   this.context = result.context;
//   this.page = result.page;
// });

 // Attach global page to each scenario world
Before(function (this: CustomWorld) {
  
  this.context = globalContext;
  this.page = globalPage;
});

// Screenshot after each step
AfterStep(async function (this: CustomWorld, { result }) {
  try {
    if (!this.page) return;

    const chatElement = await this.page.$(CHAT_SELECTOR);
    const buf = chatElement
      ? await chatElement.screenshot()
      : await this.page.screenshot({ fullPage: false });

    await this.attach(buf, 'image/png');
  } catch (e) {
    console.warn('AfterStep screenshot failed:', e);
  }

  if (result?.status === 'FAILED') {
    const message = result.message || 'Step failed';
    this.failures.push({ step: 'Unknown step', message });
  }
});

// After each scenario
After(async function (this: CustomWorld) {
  if (this.failures.length > 0) {
    const msgs = this.failures
      .map((f, i) => `#${i + 1} ${f.step} => ${f.message}`)
      .join('\n');

    await this.attach(msgs, 'text/plain');
    throw new Error('Soft assertion failures:\n' + msgs);
  }

   
});

// Close browser at the very end
AfterAll(async () => {
  if (globalContext) await globalContext.close();
});
