# agentledger

Homebrew tap for [agentledger](https://github.com/garyleelty/agentledger) — a
local-first cost ledger for AI coding agents. It reads the session logs your
agents already write on disk (Claude Code, Codex, OpenCode, Kilo, DSH,
OpenClaw, pi-agent, Cherry Studio, Gemini CLI) and turns them into tokens and
dollars.

## Install

```bash
brew install garyleelty/agentledger/agentledger
```

Then:

```bash
agentledger              # totals + per-agent breakdown
agentledger by-model     # which model is eating your budget
agentledger waste        # where the cache-read spend is concentrated
```

`aledger` is a shorter alias for the same command.

## What it does not do

It never makes a network call. It opens your log files read-only and writes
nothing. No account, no API key, no telemetry, no update check — the input is
your entire coding history.

## Links

- Source: https://github.com/garyleelty/agentledger
- Issues: https://github.com/garyleelty/agentledger/issues
- Licence: MIT
