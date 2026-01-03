# THIS IS THE LAST ENTRY IN THE CHATGPT CONVERSATION CALLED "CONVERT JS TO TS"

It contains complete instructions for how to create a "combined front end" in typescript

Backend development should go like this

1. Implement the DEX javascript server complete with constants
2. Migrate to Typescript, moving constants out to be loaded from .env file (except client secret which comes from environment variable set by .bash_profile)
   - prove that works
3. Manually create a Cognito service
4. Paste in the Cognito paramters into a separate .env file and run against that : should run against Cognito !

---

Perfect ✅ — here’s your **updated full setup**, built around the idea that the _only_ sensitive values (the two client secrets) live **outside your project**, securely exported from your shell (`~/.bash_profile` or `~/.zshrc`).

Everything else is configuration — safe to store in source control.
This keeps your local + cloud setup perfectly aligned with strong security hygiene.

---

# 🧩 1. Folder Structure

```
project-root/
│
├─ package.json
├─ tsconfig.json
│
├─ .env.cognito
├─ .env.dex
│
└─ src/
   ├─ demo.ts
   └─ env.d.ts
```

---

# 🧩 2. Environment Variables (exported in your shell)

Edit your `~/.bash_profile` (Linux) or `~/.zshrc` (macOS):

```bash
# Cognito secret (sensitive)
export COGNITO_CLIENT_SECRET="l8ig7ls9v3g6m2vlbuo7krlkbcmi97nqv420922q5h81loercvh"

# Dex secret (sensitive)
export DEX_CLIENT_SECRET="ZXhhbXBsZS1hcHAtc2VjcmV0"
```

Then reload your shell:

```bash
source ~/.bash_profile    # or source ~/.zshrc
```

✅ These two variables are **never committed to git**, **never written to project files**, and available to every shell session.

---

# 🧩 3. package.json

```jsonc
{
  "name": "auth-demo",
  "version": "1.0.0",
  "type": "module",
  "scripts": {
    "dev": "tsx watch src/demo.ts",
    "start": "tsx src/demo.ts",
    "start:dex": "cross-env PROVIDER=dex tsx src/demo.ts",
    "start:cognito": "cross-env PROVIDER=cognito tsx src/demo.ts",
    "typecheck": "tsc --noEmit"
  },
  "dependencies": {
    "express": "^5.1.0",
    "cors": "^2.8.5",
    "axios": "^1.7.7",
    "cookie-session": "^2.1.0",
    "dotenv": "^16.4.7"
  },
  "devDependencies": {
    "typescript": "^5.8.3",
    "tsx": "^4.19.4",
    "cross-env": "^7.0.3",
    "@types/node": "^22.14.0",
    "@types/express": "^5.0.2",
    "@types/cors": "^2.8.17",
    "@types/cookie-session": "^2.0.49"
  }
}
```

---

# 🧩 4. tsconfig.json

```jsonc
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ES2022",
    "moduleResolution": "bundler",
    "rootDir": "./src",
    "outDir": "./dist",
    "strict": true,
    "strictNullChecks": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "sourceMap": true,
    "declaration": true,
    "allowImportingTsExtensions": false,
    "noEmit": false
  },
  "include": ["src/**/*.ts", "src/**/*.d.ts"],
  "exclude": ["node_modules", "dist"]
}
```

---

# 🧩 5. Environment Files (non-sensitive only)

### `.env.cognito`

```bash
PROVIDER=cognito

PORT=3001
REDIRECT_URI=http://localhost:3001/authenticated

BASE_URL=https://eu-west-2tcmvussb0.auth.eu-west-2.amazoncognito.com
CLIENT_ID=2pd94ln3uveahu25tfe47jpli4

AUTH_PATH=/oauth2/authorize
TOKEN_PATH=/oauth2/token
USERINFO_PATH=/oauth2/userInfo
LOGOUT_PATH=/logout
SCOPES=openid email
```

---

### `.env.dex`

```bash
PROVIDER=dex

PORT=3001
REDIRECT_URI=http://localhost:3001/authenticated

BASE_URL=http://localhost:5556
CLIENT_ID=sample-app

AUTH_PATH=/auth
TOKEN_PATH=/token
USERINFO_PATH=/userinfo
LOGOUT_PATH=none
SCOPES=openid profile email
```

🟢 Both `.env` files are **safe to commit** — no secrets inside.
They define public endpoints and identifiers only.

---

# 🧩 6. src/env.d.ts

```ts
declare namespace NodeJS {
  interface ProcessEnv {
    PROVIDER?: "dex" | "cognito";
    PORT?: string;
    REDIRECT_URI?: string;
    BASE_URL?: string;
    CLIENT_ID?: string;
    AUTH_PATH?: string;
    TOKEN_PATH?: string;
    USERINFO_PATH?: string;
    LOGOUT_PATH?: string;
    SCOPES?: string;
    // Secrets (injected via shell)
    COGNITO_CLIENT_SECRET?: string;
    DEX_CLIENT_SECRET?: string;
  }
}
```

---

# 🧩 7. src/demo.ts

```ts
import dotenv from "dotenv";
dotenv.config({ path: `.env.${process.env.PROVIDER || "cognito"}` });

import express from "express";
import cors from "cors";
import axios from "axios";
import cookieSession from "cookie-session";
import { randomBytes, createHash } from "node:crypto";

// ============================================================
// Environment configuration
// ============================================================

const provider = process.env.PROVIDER || "cognito";
const PORT = parseInt(process.env.PORT || "3001", 10);
const REDIRECT_URI = process.env.REDIRECT_URI!;
const BASE_URL = process.env.BASE_URL!;
const CLIENT_ID = process.env.CLIENT_ID!;
const CLIENT_SECRET =
  provider === "dex"
    ? process.env.DEX_CLIENT_SECRET
    : process.env.COGNITO_CLIENT_SECRET;

if (!CLIENT_SECRET) {
  console.error(
    `❌ Missing ${provider.toUpperCase()}_CLIENT_SECRET in environment`
  );
  process.exit(1);
}

const AUTH_URL = `${BASE_URL}${process.env.AUTH_PATH}`;
const TOKEN_URL = `${BASE_URL}${process.env.TOKEN_PATH}`;
const USERINFO_URL = `${BASE_URL}${process.env.USERINFO_PATH}`;
const LOGOUT_PATH = process.env.LOGOUT_PATH;
const SCOPES = process.env.SCOPES!;

// ============================================================
// Express setup
// ============================================================

const app = express();

app.use(
  cors({
    origin: ["http://localhost:3000", "http://localhost:3001"],
    credentials: true,
  })
);

app.use(express.json());

app.use(
  cookieSession({
    name: "session",
    keys: ["your-cookie-secret-key-1", "your-cookie-secret-key-2"],
    maxAge: 10 * 60 * 1000, // 10 minutes
    httpOnly: true,
    sameSite: "lax",
    secure: false, // true if HTTPS
  })
);

// ============================================================
// Utility functions
// ============================================================

function generateRandomString(length: number): string {
  const buffer = randomBytes(Math.ceil((length * 3) / 4));
  return buffer
    .toString("base64")
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=/g, "")
    .substring(0, length);
}

function generateCodeChallenge(codeVerifier: string): string {
  return createHash("sha256")
    .update(codeVerifier)
    .digest("base64")
    .replace(/\+/g, "-")
    .replace(/\//g, "_")
    .replace(/=/g, "");
}

// ============================================================
// Routes
// ============================================================

app.get("/health", (_req, res) => {
  res.json({ status: "ok", timestamp: new Date().toISOString() });
});

// ===== /login =====
app.get("/login", (req, res) => {
  const state = generateRandomString(32);
  req.session!.oauth_state = state;

  const codeVerifier = generateRandomString(128);
  const codeChallenge = generateCodeChallenge(codeVerifier);
  req.session!.code_verifier = codeVerifier;

  const authUrl = new URL(AUTH_URL);
  authUrl.searchParams.set("client_id", CLIENT_ID);
  authUrl.searchParams.set("response_type", "code");
  authUrl.searchParams.set("scope", SCOPES);
  authUrl.searchParams.set("redirect_uri", REDIRECT_URI);
  authUrl.searchParams.set("state", state);
  authUrl.searchParams.set("code_challenge", codeChallenge);
  authUrl.searchParams.set("code_challenge_method", "S256");

  console.log(`Redirecting to: ${authUrl.toString()}`);
  res.redirect(authUrl.toString());
});

// ===== /authenticated =====
app.get("/authenticated", async (req, res) => {
  try {
    const { code, state, error, error_description } = req.query as Record<
      string,
      string
    >;

    if (error) {
      console.error("OAuth error:", error, error_description);
      return res.redirect(
        `http://localhost:3000/auth/error?error=${encodeURIComponent(
          error
        )}&description=${encodeURIComponent(error_description || "")}`
      );
    }

    if (!code) {
      console.error("Missing authorization code");
      return res.redirect(
        "http://localhost:3000/auth/error?error=missing_code"
      );
    }

    const storedState = req.session?.oauth_state;
    const storedCodeVerifier = req.session?.code_verifier;

    if (!storedState || state !== storedState) {
      console.error("State mismatch or missing");
      return res.redirect(
        "http://localhost:3000/auth/error?error=state_mismatch"
      );
    }

    if (!storedCodeVerifier) {
      console.error("Missing stored code verifier");
      return res.redirect(
        "http://localhost:3000/auth/error?error=missing_session_data"
      );
    }

    console.log("Exchanging code for token...");
    const tokenParams = new URLSearchParams({
      grant_type: "authorization_code",
      client_id: CLIENT_ID,
      client_secret: CLIENT_SECRET,
      code,
      redirect_uri: REDIRECT_URI,
      code_verifier: storedCodeVerifier,
    });

    const tokenResponse = await axios.post(TOKEN_URL, tokenParams, {
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
    });

    const tokens = tokenResponse.data;

    let userInfo: Record<string, any> = {};
    if (tokens.id_token) {
      try {
        const payload = tokens.id_token.split(".")[1];
        userInfo = JSON.parse(Buffer.from(payload, "base64").toString());
      } catch {
        console.warn("Failed to parse ID token");
      }
    }

    if (tokens.access_token) {
      try {
        const userInfoResponse = await axios.get(USERINFO_URL, {
          headers: { Authorization: `Bearer ${tokens.access_token}` },
        });
        userInfo = { ...userInfo, ...userInfoResponse.data };
      } catch (err: any) {
        console.warn("Failed to fetch user info:", err.message);
      }
    }

    req.session!.user = {
      sub: userInfo.sub,
      name: userInfo.name || userInfo.preferred_username || userInfo.username,
      email: userInfo.email,
    };
    req.session!.tokens = {
      access_token: tokens.access_token,
      expires_in: tokens.expires_in,
      token_type: tokens.token_type,
    };

    delete req.session!.oauth_state;
    delete req.session!.code_verifier;

    const userData = encodeURIComponent(JSON.stringify(req.session!.user));
    res.redirect(`http://localhost:3000/auth/success?user=${userData}`);
  } catch (err: any) {
    console.error("Authentication callback error:", err.message);
    res.redirect(
      "http://localhost:3000/auth/error?error=internal_error&description=An%20unexpected%20error%20occurred"
    );
  }
});

// ===== /user =====
app.get("/user", (req, res) => {
  if (req.session?.user) {
    res.json({
      authenticated: true,
      user: req.session.user,
      tokens: req.session.tokens,
    });
  } else {
    res.json({ authenticated: false });
  }
});

// ===== /logout =====
app.get("/logout", (req, res) => {
  req.session = null;

  if (LOGOUT_PATH === "none") {
    const logoutRedirectUrl = "http://localhost:3000";
    console.log(`Redirecting to: ${logoutRedirectUrl}`);
    res.redirect(logoutRedirectUrl);
  } else {
    const logoutUrl = `${BASE_URL}${LOGOUT_PATH}?client_id=${CLIENT_ID}&logout_uri=${encodeURIComponent(
      "http://localhost:3000"
    )}`;
    console.log(`Redirecting to Cognito logout: ${logoutUrl}`);
    res.redirect(logoutUrl);
  }
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`✅ Auth server running on port ${PORT}`);
  console.log(`Provider: ${provider}`);
  console.log(`Base URL: ${BASE_URL}`);
  console.log(`Redirect URI: ${REDIRECT_URI}`);
});
```

---

# 🧩 8. Run Commands

### Run against Cognito

```bash
pnpm start:cognito
```

### Run against Dex

```bash
pnpm start:dex
```

### Default (Cognito)

```bash
pnpm start
```

Your secrets are loaded automatically from your shell environment, not from any file.

---

✅ **Result**

- `CLIENT_SECRET` values never touch your repo or disk
- `.env` files safe to commit and share
- Easy switching between Dex and Cognito
- Works perfectly with `pnpm`, `tsx`, and your existing Docker/CDK setup later

---

Would you like me to show how you could add a _runtime fallback_ that automatically reads the same secrets from AWS Secrets Manager if you’re missing them locally (for future parity with your Lambda deployment)?
