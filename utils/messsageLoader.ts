import fs from 'fs';
import path from 'path';

export function getQuestionsFromModule(moduleName: string): string[] {
  const filePath = path.resolve(__dirname, `./../tests/data/${moduleName.toLowerCase()}.json`);
  
  if (!fs.existsSync(filePath)) {
    throw new Error(`Module data file not found: ${filePath}`);
  }

  const data = JSON.parse(fs.readFileSync(filePath, 'utf-8'));
  return data.questions || [];
}
