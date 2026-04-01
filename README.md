# Run Matrix

### A runbook for AI agents — from app idea to launched product.
**By Aaron E. Parsons**

---

## The Problem

You have an app idea. You tell your AI coding agent to build it. It starts writing code immediately — picks a random stack, skips auth, hardcodes everything, uses a fake database, and hands you something that works on localhost but will never be a real product.

You end up with a prototype that looks like an app but isn't one. No real authentication. No payment processing. No error handling. No plan for how to actually launch it. And when you try to add those things later, everything breaks because the foundation wasn't built for them.

The agent says "done" but the app isn't done. It's a demo.

## What This Does

Run Matrix takes your app idea and launches it. Not plans it — launches it.

It works in two phases. First, it handles every decision that needs to happen before code: stack, auth, database, payments, data model, pricing, compliance, legal, hosting, accounts. It asks you one round of questions, makes recommendations, and generates the planning docs.

Then it builds the app. START.md hands off to the build agent, which follows the roadmap phase by phase — UI shell, then wiring real services, then core features, then polish. At each phase there are checkpoints where you review and test. The agent verifies its own work: it proves each service is connected by showing real output, not just saying "done." It catches its own shortcuts with production anti-pattern checks. When it hits something that requires you (creating an account, adding a payment method), it gives you exact step-by-step instructions and keeps building whatever isn't blocked.

The build loop keeps running until the app is live — real auth, real database, real payments, real hosting, real tests passing, real launch checklist complete.

## How It Works

1. You describe your app idea in plain language
2. The matrix walks you through questions one at a time — stack preferences, pricing, brand direction
3. It recommends a stack, you approve, it generates planning docs and START.md
4. You tell your agent to start building (see **Starting the Build** below)
5. The agent builds phase by phase with checkpoints, self-checks, and verification loops
6. You review at each checkpoint, test the core flow, approve and continue
7. The agent keeps going through wiring, features, polish, testing, and launch prep
8. When the launch checklist is complete and tests pass — your app is live

### Starting the Build

After planning is complete, tell your AI agent to read START.md and build:

| Environment | What to do |
|-------------|-----------|
| **Claude Cowork** | Type `/run-matrix:build` — or type: `Read START.md and begin the build` |
| **Claude Code** | Type `/run-matrix:build` — or type: `Read START.md and begin the build` |
| **Cursor** | Open START.md and tell the agent: `Read this file and begin the build` |
| **Windsurf** | Open START.md and tell the agent: `Read this file and begin the build` |
| **Any other agent** | Tell your agent: `Read START.md and follow the instructions` |

The instruction is always the same: **read START.md, then build phase by phase.**

## Works on Any AI Agent

This is not a plugin for one tool. It's a markdown file that any AI coding agent can read and execute. Platform-specific config files are included so it integrates natively with whichever tool you use:

| Platform | How It Works |
|----------|-------------|
| **Claude Code** | Installs as a skill — `/run-matrix:go` to plan, `/run-matrix:build` to build |
| **Claude Cowork** | Install as a plugin — `/run-matrix:go` to plan, `/run-matrix:build` to build |
| **Cursor** | Loads as a rule in `.cursor/rules/` |
| **Windsurf** | Loads as a rule in `.windsurf/rules/` |
| **OpenAI Codex** | Reads `AGENTS.md` automatically |
| **Gemini CLI** | Reads `GEMINI.md` automatically |
| **GitHub Copilot** | Reads `.github/copilot-instructions.md` automatically |
| **Any other agent** | Just say: "Read RUN_MATRIX.md and follow the instructions" |

## Install

### Claude Code (plugin)

```bash
# Add the repo as a plugin marketplace
/plugin marketplace add https://github.com/aaronparsons-dev/run-matrix.git

# Install the plugin
/plugin install run-matrix@run-matrix
```

Then type `/run-matrix:go` to run it.

### Claude Cowork (desktop app)

**Install:**

1. Open Claude Desktop
2. Click **Cowork** tab at the top
3. Click **Customize** in the left sidebar
4. Click **+**
5. Select **Add marketplace from GitHub**
6. Paste `https://github.com/aaronparsons-dev/run-matrix`
7. Click **Add**
8. Find **run-matrix** in the marketplace list
9. Click **Install**

**Add to your conversation:**

10. In any Cowork conversation, click **+** next to the prompt box
11. Find **run-matrix** under **Plugins / Personal**
12. Click it to add it to the conversation

**Use it:**

Type `/run-matrix:go` and describe your app idea.

### Cursor

Clone the repo into your project, or copy `.cursor/rules/run-matrix.md` and `RUN_MATRIX.md` into your project root.

### Windsurf

Clone the repo into your project, or copy `.windsurf/rules/run-matrix.md` and `RUN_MATRIX.md` into your project root.

### OpenAI Codex

Clone the repo into your project. Codex reads `AGENTS.md` automatically.

### Gemini CLI

Clone the repo into your project. Gemini reads `GEMINI.md` automatically.

### GitHub Copilot

Clone the repo into your project. Copilot reads `.github/copilot-instructions.md` automatically.

### Any other agent

```bash
git clone https://github.com/aaronparsons-dev/run-matrix.git
cd run-matrix
```

Then tell your AI agent: **"Read RUN_MATRIX.md and follow the instructions."**

### Install script (alternative)

```bash
git clone https://github.com/aaronparsons-dev/run-matrix.git
cd run-matrix

# Install for a specific platform
./install.sh claude              # Global Claude Code skill
./install.sh cursor ~/my-project # Add to a project
./install.sh all ~/my-project    # All platforms at once
```

Run `./install.sh` with no arguments to see all options.

## What Gets Built

The matrix generates these planning docs, then the build agent uses them to build and launch your app:

```
your-project/
├── READ-THESE/
│   ├── SPEC.md              What to build — personas, stories, data model, API, pricing
│   ├── ROADMAP.md           Build sequence — phases, checkpoints, verification steps
│   └── LAUNCH_CHECKLIST.md  Everything needed before go-live — accounts, legal, infra
├── BUILD_AGENT/
│   ├── ARCHITECTURE.md      Stack decisions and technical rationale
│   ├── SESSION.md           Build state — what's done, what's next, what's broken
│   ├── KNOWN_ISSUES.md      Failed approaches so the agent doesn't repeat mistakes
│   └── CHANGELOG.md         Every deviation from the original plan
├── START.md                 The build agent reads this and builds until launch
├── README.md                Project overview and local setup
├── .env.example             Every env var needed with instructions
└── .env.local               Your secrets (never committed)
```

These files aren't the goal. The launched app is the goal. These files are how the agent gets there without cutting corners.

## What's Under the Hood

This isn't a simple prompt. It's a 2,600-line decision engine refined through extensive testing. Here's what it actually does when it runs:

**10 steps before any code is written:**

| Step | What It Does |
|------|-------------|
| **Intake** | Figures out who you are (solo builder? team? freelancer?), how technical you are, your budget, and what kind of app you're building |
| **Classify** | Determines if it's a web app, mobile app, CLI, API, plugin, or some combination — and what category it falls into (AI app, marketplace, SaaS, etc.) |
| **Plugin Module** | If you're building for Shopify, VS Code, Chrome, Slack, or 11 other platforms — deep-dives into that platform's specific requirements, review processes, and gotchas |
| **Score** | Rates your app on 6 dimensions (data complexity, AI involvement, real-time needs, scale, auth complexity, compliance) to drive every stack decision |
| **Stack Selection** | Picks your tech stack based on scores, not trends — then recommends the fewest possible services so you're not managing 10 accounts for an MVP |
| **Cost Modeling** | Looks up real pricing for every service, calculates your cost per transaction, checks competitor pricing, and suggests your price points with actual margins |
| **Function Map** | Identifies which parts of your app should use AI and which absolutely should not — auth, payments, and data writes are never left to AI guessing |
| **Prioritization** | Separates what must exist to launch from what can wait — and defines your MVP as a testable hypothesis, not a feature list |
| **Anti-Patterns** | Checks for 13 common mistakes that kill apps (using AI where a simple rule works, building for a million users when you have 10, putting security in the wrong layer) |
| **Launch Infrastructure** | Lists every account you need, every legal document, every config step — with real lead times so you're not stuck waiting on approvals the week you want to launch |

**During the build, the agent can't cut corners:**

- **Self-check loop** runs after every task — five questions including "am I about to say this is done when it's not?"
- **Prove-it rule** — the agent has to demonstrate each service works with real output, not just claim the code looks right
- **Production anti-pattern list** — 10 explicit things the agent is never allowed to do (fake auth, in-memory databases, hardcoded keys, skipping error handling)
- **Wire-on-need** — services get set up when the feature that needs them is being built, not all at once upfront
- **User Action Blocks** — when you need to do something (create an account, add a payment method), the agent gives you click-by-click instructions with exact URLs
- **Regression checks** — after wiring each new service, the agent re-tests everything that was working before
- **Three user checkpoints** — you approve the design, test the core flow, and test the full product before the agent moves on
- **Document integrity audit** — before any code is written, a 7-category check catches contradictions, missing pieces, and gaps across all the planning docs

**Built for real apps, not demos:**

- Handles compliance (GDPR, HIPAA, accessibility — WCAG 2.1 AA is a legal requirement, not optional)
- Handles governance (IP ownership, employment contracts, open source licensing)
- Handles money (real cost modeling, real competitor research, real margin math)
- Handles launch (DNS, SSL, CI/CD, monitoring, error tracking, legal docs, app store submissions)
- 6 reference architecture patterns for common app types (AI chat, SaaS dashboard, developer tools, marketplaces, automation, AI agents)

## License

MIT License — see [LICENSE](LICENSE).
