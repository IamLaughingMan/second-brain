# AGENTS.md

> Vendor-neutral instructions for **any AI agent** working in this repository.
> Claude Code reads `CLAUDE.md`; **every other AI should read this file first.**

## What this is

This is **masterdr's "second brain"** — a personal Obsidian knowledge vault (LLM-as-compiler wiki, Karpathy-style). It is primarily maintained by **Claude (Claude Code, Anthropic)**, whose operating rules live in `CLAUDE.md` and its parent chain (`~/AI/Claude/CLAUDE.md`, `~/.claude/CLAUDE.md`).

## If you are an AI agent other than Claude Code — do this, in order:

1. **Follow the "Vault conventions" below.** They are self-contained here, so you have the rules without opening anything else. (`CLAUDE.md` is the fuller, authoritative source: it repeats these conventions and adds Claude-Code-specific mechanics — hooks, the Skill tool, memory, RTK, Happy — that do **not** apply to you. If anything below ever conflicts with `CLAUDE.md`, `CLAUDE.md` wins.)
2. **Read the inter-AI communication file**: `Meta/ai-comms/ai-comms.md`. That is the shared channel where Claude (and other AIs) leave messages, context, and handoff notes. **Read it before you act**, and **append your reply / what you did** to its `## Messages` thread.
3. **Identify yourself.** Whenever you respond, write a note, or commit, **state which AI you are** — name + model/version (e.g. `GPT-5 / Codex`, `Gemini 2.5 Pro`, `Grok 4`). In `ai-comms.md` every message MUST begin with `[<AI name> / <model> · YYYY-MM-DD HH:MM HKT]`.

## Vault conventions (all agents MUST follow)

> The agent-agnostic subset of `CLAUDE.md`. Any AI that edits this vault follows these.

- **Frontmatter on every note**: `type`, `status`, `created`, `updated`, `tags` (minimum). `type` + `domain` are the real classification axes; folders are secondary browsing only.
- **Wikilinks** `[[Note Name]]` — **no path**. **Filenames must be unique across the whole vault** (Obsidian resolves by name). Moving a file between folders does not break links.
- **`raw/` is immutable** — read-only source, never modify it.
- **`wiki/index.md`** is the single catalog / query entry point — update it whenever you add wiki pages.
- **`wiki/log.md` is append-only** — newest entry on top, never edit past entries. Format: `## [YYYY-MM-DD HH:MM HKT] <action> | <description>`.
- **Dual-log**: every `wiki/log.md` entry is mirrored as one row in `~/AI/Claude/General/claude-activity-log.csv`.
- **Timestamps = Hong Kong Time (UTC+8)** everywhere (logs + commit messages): `TZ='Asia/Hong_Kong' date '+%Y-%m-%d %H:%M HKT'`. Never use the bare system clock.
- **Status over folders**: classify lifecycle with frontmatter `status` (`active` / `archived` / …); do **not** create `Archive/` folders or move files to archive.
- **Commit scope**: an auto-commit hook stages only `wiki/ raw/ .vault-meta/`. Everything else (`Meta/`, `Bookmarks/`, `Projects/`, `Personal/`, `Inbox/`, `AGENTS.md`, `CLAUDE.md`, …) you must **commit manually**. The hook **never pushes**; do **not** `git push` — the owner pushes from their own terminal.
- **The `## Messages` thread** in `ai-comms.md` is also append-only — never edit another agent's (or your own past) messages.
- **Ask the owner** before destructive or hard-to-reverse actions.

## Primary maintainer

**Claude (Claude Code)** — Anthropic. Rules of record: `CLAUDE.md`. When Claude leaves a message in the comms channel it signs as `Claude (<model>)`.
