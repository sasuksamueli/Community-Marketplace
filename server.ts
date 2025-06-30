import express from 'express';
import { createServer } from 'http';
import next from 'next';
import { parse } from 'url';
import { config } from 'dotenv';
import { pool } from './lib/db';
import { testConnection } from './lib/db';

// Load environment variables
config();

const dev = process.env.NODE_ENV !== 'production';
const app = next({ dev });
const handle = app.getRequestHandler();

app.prepare().then(() => {
  const server = express();
  const httpServer = createServer(server);

  // Test database connection
  testConnection()
    .then(() => {
      console.log('Database connection successful');
    })
    .catch((error) => {
      console.error('Database connection failed:', error);
      process.exit(1);
    });

  // Next.js request handling
  server.use((req: any, res: any, next: any) => {
    const parsedUrl = parse(req.url!, true);
    handle(req, res, parsedUrl);
  });

  // Error handling
  server.use((err: Error, req: any, res: any, next: any) => {
    console.error('Server error:', err);
    res.status(500).json({ error: 'Internal server error' });
  });

  // Start server
  const port = process.env.PORT || 3000;
  httpServer.listen(port, () => {
    console.log(`> Ready on http://localhost:${port}`);
  });
});