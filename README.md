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
2. The matrix asks one round of questions — stack preferences, pricing, brand direction
3. It generates planning docs and START.md
4. You point your AI agent at START.md: "Read this and build"
5. The agent builds phase by phase with checkpoints, self-checks, and verification loops
6. You review at each checkpoint, test the core flow, approve and continue
7. The agent keeps going through wiring, features, polish, testing, and launch prep
8. When the launch checklist is complete and tests pass — your app is live

## Works on Any AI Agent

This is not a plugin for one tool. It's a markdown file that any AI coding agent can read and execute. Platform-specific config files are included so it integrates natively with whichever tool you use:

| Platform | How It Works |
|----------|-------------|
| **Claude Code** | Installs as a skill — type `/run-matrix` |
| **Claude Cowork** | Install as a plugin via GitHub URL |
| **Cursor** | Loads as a rule in `.cursor/rules/` |
| **Windsurf** | Loads as a rule in `.windsurf/rules/` |
| **OpenAI Codex** | Reads `AGENTS.md` automatically |
| **Gemini CLI** | Reads `GEMINI.md` automatically |
| **GitHub Copilot** | Reads `.github/copilot-instructions.md` automatically |
| **Any other agent** | Just say: "Read RUN_MATRIX.md and follow the instructions" |

## Install

### Option 1 — Clone and run

```bash
git clone https://github.com/aaronparsons-dev/run-matrix.git
cd run-matrix
```

Then tell your AI agent: **"Read RUN_MATRIX.md and follow the instructions."**

### Option 2 — Install as a Claude Code plugin

```bash
claude plugin add https://github.com/aaronparsons-dev/run-matrix
```

Then type `/run-matrix` in any Claude Code session.

### Option 3 — Copy into any project

Copy `RUN_MATRIX.md` into your project root. Copy the platform config folder for your tool (`.cursor/rules/`, `.windsurf/rules/`, etc.) if you want native integration. Or just tell your agent to read the file.

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

## License

MIT License — see [LICENSE](LICENSE).
