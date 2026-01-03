

**One route per Lambda, no Express**

Why:

* Matches Lambda’s execution model
* Simpler mental model
* Easier testing and reasoning
* Better cold start behavior
* Cleaner demos and explanations

**Canonical pattern you should standardize on**

* One Lambda = one responsibility
* API Gateway HTTP API
* Pure handler function
* JSON in / JSON out
* No web framework
* No containers unless required

This gives you:

* Minimal cold starts
* Clean IAM boundaries
* Excellent composability



## How ...

### 1. Write your Lambda as a pure function

Lambda should look like this:

* Input: plain JS object (already parsed)
* Output: plain JS object
* No AWS-specific logic inside

Example mental model:

```
(input) => output
```

This is your **business logic**, reusable everywhere.

---

### 2. Add a tiny Lambda adapter (production only)

This adapter:

* Converts API Gateway event → your input object
* Converts your output → API Gateway response

This code runs **only in AWS**.

---

### 3. Add a tiny local HTTP adapter (debug only)

For local development:

* Use Node’s built-in `http` module (not Express)
* OR use a very thin dev server
* Map HTTP request → same input object
* Call the same business logic function

Your frontend talks to:

* API Gateway in AWS
* `localhost` during development





## 1. Canonical Project Structure (use this everywhere)

```
mini-project-1-midi-import/
  src/
    logic.ts          // pure business logic
    lambda.ts         // AWS Lambda adapter
    local-server.ts   // local HTTP adapter (dev only)
  package.json
  tsconfig.json
```

---

## 2. Pure Business Logic (logic.ts)

This file:

* Knows nothing about AWS
* Knows nothing about HTTP
* Is easy to test

```
export interface ParseMidiInput {
  midiFilePath: string
}

export interface ParsedNote {
  pitch: string
  start: number
  duration: number
  velocity: number
  voice: number
}

export async function parseMidi(
  input: ParseMidiInput
): Promise<ParsedNote[]> {
  // placeholder for now
  return [
    {
      pitch: "C4",
      start: 0,
      duration: 0.5,
      velocity: 0.8,
      voice: 1
    }
  ]
}
```

This is the **core of your system**.

---

## 3. AWS Lambda Adapter (lambda.ts)

This file:

* Converts API Gateway → your input
* Converts output → API Gateway response
* Contains all AWS-specific logic

```
import { parseMidi } from "./logic"

export async function handler(event: any) {
  const body = JSON.parse(event.body ?? "{}")

  const result = await parseMidi({
    midiFilePath: body.midiFilePath
  })

  return {
    statusCode: 200,
    headers: { "content-type": "application/json" },
    body: JSON.stringify(result)
  }
}
```

Deploy this with:

* API Gateway HTTP API
* Lambda
* No Express
* No containers

---

## 4. Local Debug Server (local-server.ts)

This lets you:

* Call the same logic locally
* Use your frontend unchanged

No Express. No magic.

```
import http from "http"
import { parseMidi } from "./logic"

const server = http.createServer(async (req, res) => {
  if (req.method !== "POST") {
    res.statusCode = 404
    return res.end()
  }

  let body = ""
  req.on("data", chunk => (body += chunk))
  req.on("end", async () => {
    const input = JSON.parse(body)

    const result = await parseMidi({
      midiFilePath: input.midiFilePath
    })

    res.setHeader("content-type", "application/json")
    res.end(JSON.stringify(result))
  })
})

server.listen(3000, () => {
  console.log("Local server running on http://localhost:3000")
})
```

Run with:

```
ts-node src/local-server.ts
```

---

## 5. Frontend: Zero Changes Between Local and AWS

In your React app:

```
const API_BASE =
  import.meta.env.MODE === "development"
    ? "http://localhost:3000"
    : "https://your-api-id.execute-api.region.amazonaws.com"

await fetch(`${API_BASE}/parse-midi`, {
  method: "POST",
  headers: { "content-type": "application/json" },
  body: JSON.stringify({
    midiFilePath: "/tmp/bach.mid"
  })
})
```




## Best Readable Pattern (Recommended)

Create a tiny helper:

```
function readRequestBody(req: IncomingMessage): Promise<string> {
  return new Promise((resolve, reject) => {
    let body = ""

    req.on("data", chunk => {
      body += chunk
    })

    req.on("end", () => resolve(body))
    req.on("error", reject)
  })
}
```

Then your server code becomes:

```
const body = await readRequestBody(req)
const input = JSON.parse(body)
```

This is the **cleanest and most idiomatic** solution.

---


