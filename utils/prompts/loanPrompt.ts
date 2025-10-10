export const loansPrompt = (response: string, expectedIntent: string): string => `
You are a QA evaluator reviewing the *Loans* module in a WhatsApp chatbot.

Bot response:
"${response}"

Task:
Does the response clearly reflect the intent: "${expectedIntent}"?

Possible intents:
- list available loans
- prompt for loan type selection
- loan details shown
- no loans available
- Details of loans
- It starts with "1. Loan Number:"
- Includes loan type or name
- It’s a numbered list of loans

Respond with only "YES" or "NO".
`;