This is **OAuth 2.1 Authorization Code + PKCE** with:

- SPA (public client)
- No client secret
- Hosted UI
- Authorization Code flow

Using **Amazon Cognito**.

---

# 🧭 Actors (set the stage)

- **Browser** (the real star)
- **Your SPA** (JS running in the browser)
- **Cognito Hosted UI**
- **Cognito OAuth token endpoint**

---

# 🔹 Event 0 — App bootstraps (no HTTP yet)

Your SPA:

- Generates:
  - `code_verifier`
  - `code_challenge` (derived from verifier)

- Stores `code_verifier` in memory or sessionStorage

❌ No HTTP
❌ No redirect
❌ No navigation

Just prep work.

---

# 🔹 Event 1 — User starts login

Your app does something like:

```ts
window.location.href =
  "https://your-domain.auth.region.amazoncognito.com/oauth2/authorize?...";
```

### ✅ What kind of request?

- 🌍 **Navigation request**
- Initiated by the browser
- Full document load

### 🧠 What the browser does

- Leaves your SPA
- Requests Cognito’s `/authorize` endpoint
- Accepts `text/html`

### ❓ Is this a redirect?

- ❌ No — this is an _explicit navigation_

---

# 🔹 Event 2 — Cognito shows login page

Cognito responds with:

```
HTTP 200 OK
Content-Type: text/html
```

### ✅ What kind of request?

- 🌍 **Navigation response**
- Full HTML document

### 🔁 Redirect?

- ❌ No

User now interacts with the login UI.

---

# 🔹 Event 3 — User submits credentials

The login form submission triggers:

```
POST /login
```

### ✅ What kind of request?

- 🌍 **Navigation request**
- Browser form submission
- Still document-oriented

### 🔁 Redirect?

- ❌ Not yet

---

# 🔹 Event 4 — Cognito redirects back with authorization code

After successful auth, Cognito responds:

```
HTTP 302 Found
Location: https://your-spa.com/callback?code=XYZ&state=ABC
```

### ✅ What kind of request?

- 🔁 **Redirect response**
- To a **navigation request**

### 🧠 What the browser does

- Automatically follows the redirect
- Loads `/callback`
- Address bar updates
- SPA reloads from scratch

### ⭐ Key point

This is **not JavaScript-controlled**.
This is the browser acting as an OAuth agent.

---

# 🔹 Event 5 — SPA reloads on `/callback`

Browser now requests:

```
GET /callback?code=XYZ
```

### ✅ What kind of request?

- 🌍 **Navigation request**
- HTML + JS bundle reload

### 🔁 Redirect?

- ❌ No

At this point:

- You have the **authorization code**
- No tokens yet
- User is authenticated, but app isn’t

---

# 🔹 Event 6 — SPA exchanges code for tokens (PKCE)

Now JavaScript runs:

```ts
fetch("https://your-domain.auth.region.amazoncognito.com/oauth2/token", {
  method: "POST",
  headers: { "Content-Type": "application/x-www-form-urlencoded" },
  body: /* code + code_verifier */
});
```

### ✅ What kind of request?

- 🔌 **API request**
- Initiated by JavaScript
- `fetch()` / XHR
- Accepts JSON

### 🔁 Redirect?

- ❌ No (and should never be)

### 🧠 Why no redirect here?

- Tokens must **never** travel via browser navigation
- This is a **back-channel request**, even though it runs in the browser
- PKCE replaces the client secret

---

# 🔹 Event 7 — Cognito returns tokens

Cognito responds:

```
HTTP 200 OK
Content-Type: application/json

{
  "access_token": "...",
  "id_token": "...",
  "refresh_token": "..."
}
```

### ✅ What kind of response?

- 🔌 **API response**
- JSON payload

### 🔁 Redirect?

- ❌ No

Your SPA now:

- Stores tokens
- Updates auth state
- Renders logged-in UI

---

# 🔹 Event 8 — Authenticated API calls

Subsequent calls:

```ts
fetch("/api/data", {
  headers: {
    Authorization: `Bearer ${accessToken}`,
  },
});
```

### ✅ What kind of request?

- 🔌 **API request**
- No navigation
- No redirects

---

# 🧩 One-page summary table (very teachable)

| Step           | HTTP Initiator | Request Type   | Redirect? | Page Reload |
| -------------- | -------------- | -------------- | --------- | ----------- |
| Start login    | Browser        | Navigation     | ❌        | ❌          |
| Hosted UI load | Browser        | Navigation     | ❌        | ❌          |
| Login submit   | Browser        | Navigation     | ❌        | ❌          |
| Auth success   | Cognito        | Redirect (302) | ✅        | ✅          |
| Callback load  | Browser        | Navigation     | ❌        | ✅          |
| Token exchange | JS (`fetch`)   | API            | ❌        | ❌          |
| Token response | Cognito        | API            | ❌        | ❌          |
| App APIs       | JS (`fetch`)   | API            | ❌        | ❌          |

---

# 🧠 The sentence that usually makes it “click”

You can teach it like this:

> **OAuth uses browser navigation to authenticate the user,
> and API requests to authenticate the application.**

Or even more blunt:

> Redirects are for _users_.
> Tokens are for _code_.

---

If you want, next we can:

- Draw the **same flow but with a confidential client** (server-side)
- Explain **why implicit flow died**
- Show **where refresh tokens fit** in SPAs with Cognito
- Turn this into a **diagram you can put straight into slides**

Just say where you want to go next.
