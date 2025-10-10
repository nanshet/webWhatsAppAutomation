
import { loansPrompt } from './prompts/loanPrompt'; // Add as needed

export const promptTemplates: Record<string, (response: string, intent: string) => string> = {

  Loans: loansPrompt,
};
