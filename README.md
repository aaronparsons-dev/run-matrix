# Run Matrix

### A runbook for AI agents — from app idea to production launch.
**By Aaron E. Parsons**

---

## The Problem

You have an app idea. You tell your AI coding agent to build it. It starts writing code immediately — picks a random stack, skips auth, hardcodes everything, uses a fake database, and hands you something that works on localhost but will never be a real product.

You end up with a prototype that looks like an app but isn't one. No real authentication. No payment processing. No error handling. No plan for launch. And when you try to add those things later, everything breaks because the foundation wasn't built for them.

## What This Fixes

Run Matrix sits between your idea and the code. Before a single line is written, it forces every decision that matters: what stack to use (and why), how auth works, how data is structured, what the pricing model is, what accounts you need to create, what legal docs you need, and exactly what order to build things in.

Then it generates a complete set of planning documents that any AI coding agent can follow to build the real thing — not a prototype, the actual production app with real auth, real payments, real database, real hosting.

## How It Works

1. You describe your app idea in plain language
2. The matrix asks you one round of questions (stack preferences, pricing, brand direction)
3. It generates 11 planning documents — spec, architecture, roadmap, launch checklist, and a START.md file
4. You point your AI coding agent at START.md and say "build this"
5. The agent follows the roadmap phase by phase, with checkpoints where you review progress, until the app is launched

The planning documents include self-checking rules, production anti-pattern guards, and step-by-step instructions for every account setup and service configuration you'll need along the way.

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

### Option 1 — Clone it into your project

```bash
git clone https://github.com/YOUR_USERNAME/run-matrix.git
cd run-matrix
```

Then tell your AI agent: **"Read RUN_MATRIX.md and follow the instructions."**

### Option 2 — Install as a Claude Code plugin

```bash
claude plugin add https://github.com/YOUR_USERNAME/run-matrix
```

Then type `/run-matrix` in any Claude Code session.

### Option 3 — Copy into any project

Copy `RUN_MATRIX.md` into your project root. Copy the platform config folder for your tool (`.cursor/rules/`, `.windsurf/rules/`, etc.) if you want native integration. Or just tell your agent to read the file.

## What It Generates

```
your-project/
├── READ-THESE/
│   ├── SPEC.md              Full product spec — personas, user stories, data model,
│   │                        API routes, pricing, priorities, risk register
│   ├── ROADMAP.md           Build sequence with phases and checkpoints
│   └── LAUNCH_CHECKLIST.md  Every account, config, legal doc, and pre-launch task
├── BUILD_AGENT/
│   ├── ARCHITECTURE.md      Stack decisions, scoring rationale, function map
│   ├── SESSION.md           Build state — what's done, what's next, what's broken
│   ├── KNOWN_ISSUES.md      Failed approaches so the agent doesn't repeat mistakes
│   └── CHANGELOG.md         Every deviation from the original plan
├── START.md                 Entry point for the build agent
├── README.md                Project overview and local setup
├── .env.example             Every env var needed with instructions
└── .env.local               Your secrets (never committed)
```

## License

MIT License — see [LICENSE](LICENSE).
