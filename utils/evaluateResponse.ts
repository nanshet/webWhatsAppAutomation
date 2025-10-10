// utils/evaluateResponse.ts
import { openai } from './openaiClient';
import { promptTemplates } from './promptTemplates';

export async function evaluateBotResponse(
  moduleName: string,
  responseText: string,
  expectedIntent: string
): Promise<boolean> {
  const template = promptTemplates[moduleName];

  if (!template) {
    throw new Error(`❌ No prompt template found for module: ${moduleName}`);
  }

  const prompt = template(responseText, expectedIntent);

  const completion = await openai.chat.completions.create({
    model: 'gpt-4',
    messages: [{ role: 'user', content: prompt }],
    temperature: 0.2,
  });

  const result = completion.choices[0].message.content?.trim();
  return result === 'YES';
}
