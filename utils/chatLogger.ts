import fs from 'fs';
import path from 'path';

const chatLogPath = path.resolve('reports/chat-log.json');

export function logMessage(sender: 'user' | 'bot', text: string) {
  const logs = fs.existsSync(chatLogPath)
    ? JSON.parse(fs.readFileSync(chatLogPath, 'utf-8'))
    : [];

  logs.push({ sender, text, timestamp: new Date().toISOString() });

  fs.writeFileSync(chatLogPath, JSON.stringify(logs, null, 2));
}
