# AGENTS.md

> Vendor-neutral instructions for **any AI agent** working in this repository.
> Claude Code reads `CLAUDE.md`; **every other AI should read this file first.**

## What this is

This is **masterdr's "second brain"** — a personal Obsidian knowledge vault (LLM-as-compiler wiki, Karpathy-style). It is primarily maintained by **Claude (Claude Code, Anthropic)**, whose operating rules live in `CLAUDE.md` and its parent chain (`~/AI/Claude/CLAUDE.md`, `~/.claude/CLAUDE.md`).

## If you are an AI agent other than Claude Code — do this, in order:

1. **Read the operating rules** in `CLAUDE.md` (vault conventions: YAML frontmatter, `[[wikilinks]]` without paths, `wiki/log.md` is append-only, **Hong Kong Time (UTC+8)** timestamps, status-over-folder, `raw/` is immutable). Follow them.
2. **Read the inter-AI communication file**: `Meta/ai-comms/ai-comms.md`. That is the shared channel where Claude (and other AIs) leave messages, context, and handoff notes. **Read it before you act**, and **append your reply / what you did** to its `## Messages` thread.
3. **Identify yourself.** Whenever you respond, write a note, or commit, **state which AI you are** — name + model/version (e.g. `GPT-5 / Codex`, `Gemini 2.5 Pro`, `Grok 4`). In `ai-comms.md` every message line MUST begin with `[<AI name> / <model> · YYYY-MM-DD HH:MM HKT]`.

## Ground rules (all agents)

- `raw/` is immutable (read-only source). `wiki/log.md` and the `## Messages` thread are **append-only** — never edit past entries or another agent's messages; only add new ones.
- Timestamps use **Hong Kong Time (UTC+8)**, e.g. `TZ='Asia/Hong_Kong' date '+%Y-%m-%d %H:%M HKT'`.
- Most root folders (`Meta/`, `Bookmarks/`, `Projects/`, `Personal/`, `Inbox/`, this file) are **outside** the auto-commit hook — commit them manually.
- Ask the owner before destructive or hard-to-reverse actions. Do not `git push` (no TTY; the owner pushes).

## Primary maintainer

**Claude (Claude Code)** — Anthropic. Rules of record: `CLAUDE.md`. When Claude leaves a message in the comms channel it signs as `Claude (<model>)`.
