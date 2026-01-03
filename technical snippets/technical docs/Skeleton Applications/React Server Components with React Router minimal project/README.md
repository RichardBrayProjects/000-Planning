# Minimal RSC + Lambda Example

The absolute minimum code to demonstrate React Server Components with React Router and AWS Lambda.

## What's Here

**Frontend (7 files):**
- `HomePage.tsx` - A React Server Component that fetches from Lambda
- `App.tsx` - Single route
- `main.tsx` - Entry point
- Basic config files

**Backend (3 files):**
- `index.ts` - Lambda handler (one endpoint)
- `local-server.ts` - Run Lambda locally
- Config files

## Run It

```bash
# Terminal 1 - Start Lambda
cd backend
npm install
npm run dev

# Terminal 2 - Start Frontend  
cd frontend
npm install
npm run dev
```

Open http://localhost:5173

## How It Works

1. `HomePage.tsx` is a Server Component (no `'use client'`)
2. It runs on the server and fetches from Lambda
3. Only the rendered HTML is sent to the browser
4. No JavaScript bundle for the HomePage component!

That's it. This is RSC + Lambda at its simplest.
