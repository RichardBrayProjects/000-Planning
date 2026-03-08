import { createServer } from 'http';
import { handler } from './index.js';

createServer(async (req, res) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  
  if (req.method === 'OPTIONS') {
    res.writeHead(200);
    res.end();
    return;
  }

  const result = await handler();
  res.writeHead(result.statusCode, result.headers);
  res.end(result.body);
}).listen(3001, () => {
  console.log('Lambda running at http://localhost:3001');
});
