import { setWorldConstructor, IWorldOptions } from '@cucumber/cucumber';
import { BrowserContext, Page, chromium } from 'playwright';
import path from 'path';

export class CustomWorld {
  context!: BrowserContext;
  page!: Page;
  failures: { step: string; message: string }[] = [];

  attach!: (data: Buffer | string, mediaType: string) => Promise<void>;
  parameters!: any;

  constructor(options: IWorldOptions) {
    Object.assign(this, options);
  }

  // init() can be used by BeforeAll to start browser once
static async init(): Promise<{ context: BrowserContext; page: Page }> {
    const userDataDir = path.resolve('./whatsapp-session');

    const context = await chromium.launchPersistentContext(userDataDir, {
      headless: false,
    });

    const page = context.pages().length > 0 ? context.pages()[0] : await context.newPage();
    await page.goto('https://web.whatsapp.com');
    await page.waitForSelector('div[aria-label="Chat list"]', { timeout: 250000 });

    const isLoggedIn = await page.$('div[aria-label="Chat list"]');
    if (isLoggedIn) {
      console.log('✅ Already logged in. Using persistent session.');
    } else {
      console.log('📸 Please scan the QR code to continue.');
    }

    return { context, page };
  }
}

setWorldConstructor(CustomWorld);
