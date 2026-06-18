---
type: bookmark
para: resource
domain: ai-tools
title: "Ponytail"
url: "https://github.com/DietrichGebert/ponytail"
summary: "AI coding-agent ruleset，核心『最好嘅 code 係冇寫過』；YAGNI 決策階梯，聲稱少 80–94% code（MIT、~23k★）"
status: active
created: 2026-06-17
updated: 2026-06-18
related:
  - "[[Karpathy LLM Wiki Pattern]]"
tags:
  - bookmark
  - ai-tools
  - coding-agents
  - yagni
  - prompt-engineering
---

# Ponytail

- URL: https://github.com/DietrichGebert/ponytail
- Saved date: 2026-06-17
- Topic: AI coding-agent ruleset（minimalist coding philosophy）
- Status: active

## Why I saved this

一套俾 AI coding agent 用嘅 ruleset，核心理念係「最好嘅 code 就係你冇寫過嘅 code」。同我自己 `CLAUDE.md` 嘅 **Simplicity First / Surgical Changes** 原則同 [[Karpathy LLM Wiki Pattern]] 嘅 minimalism 思路一脈相承，值得參考點樣將呢套規矩 encode 入 agent。

## Summary

- **係咩**：一個 decision-hierarchy ruleset，注入 AI coding agent，令佢寫 code 前先考慮現成方案。
- **次序**：跳過唔需要嘅 feature（YAGNI）→ 用 standard library → 用 native platform feature → 用已裝 dependency → 寫 one-liner → 最後先寫最少量 custom code。
- **聲稱效果**：比 baseline agent 少 80–94% code、快 3–6×。
- **主語言**：JavaScript（93.3%）。
- **License**：MIT ・ **Stars**：~23.5k（截至 2026-06-17）。

## Key Takeaways

- 三種整合模式：`lite` / `full` / `ultra` / `off`。
- 內置 command：`/ponytail-review`（code review）、repo audit、tech-debt tracking。
- 兼容 13+ agent：Claude Code、Codex、GitHub Copilot CLI、Cursor 等。
- 用 lifecycle hooks + skill-based command system。
- Topics：developer-tools, ai-agents, claude, yagni, llm, prompt-engineering, agent-skills, cursor-rules。

## My Notes

（待補：試下 `lite` 模式落 Claude Code，睇同我現有 CLAUDE.md 規則有冇衝突／互補。）

## Related
- [[Karpathy LLM Wiki Pattern]]
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-18），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://github.com/DietrichGebert/ponytail　・　抽取 defuddle 2026-06-18 HKT，已剝 badge/圖片雜訊。

## Ponytail

*He says nothing. He writes one line. It works.*

**80-94% less code · 3-6× faster · 42-75% cheaper**
<sub>Per-task code, latency, and cost on the Claude API, not your plan's quota. Median across Haiku, Sonnet, and Opus (10 runs for code and latency, 30 for the re-verified cost). Results vary by model and prompt: the ruleset re-injects each turn, so on a short prompt or a terse reasoning model that overhead can outweigh the savings. <a href="https://github.com/DietrichGebert/ponytail/blob/main/benchmarks">Reproduce it yourself.</a></sub>

---

You know him. Long ponytail. Oval glasses. Has been at the company longer than the version control. You show him fifty lines; he looks at them, says nothing, and replaces them with one.

Ponytail puts him inside your AI agent.

## Before / after

You ask for a date picker. Your agent installs flatpickr, writes a wrapper component, adds a stylesheet, and starts a discussion about timezones.

With ponytail:

```
<!-- ponytail: browser has one -->
<input type="date">
```

More survivors in [examples/](https://github.com/DietrichGebert/ponytail/blob/main/examples).

## Numbers

Five everyday tasks (email validator, debounce, CSV sum, countdown timer, rate limiter), three models, three arms: no skill, the [caveman](https://github.com/JuliusBrussee/caveman) skill, and ponytail. Ten runs per cell, median reported.

**80-94% less code, 42-75% less cost, and 3-6× faster than a no-skill agent, on every Claude model.** Every shortcut ponytail takes is marked in the code with a `ponytail:` comment naming its upgrade path. Reproduce it yourself: `npx promptfoo eval -c benchmarks/promptfooconfig.yaml`. Method and raw numbers: [benchmarks/](https://github.com/DietrichGebert/ponytail/blob/main/benchmarks). Production-grade tasks, where an unconstrained agent bloats far more, are written up in [benchmarks/results/](https://github.com/DietrichGebert/ponytail/blob/main/benchmarks/results).

**That is the byproduct, not the pitch.** These are Claude numbers, and they vary by model. Capable instruction-following models follow the ladder and write far less, cheaper and faster. Terse reasoning models can go the other way: the ladder is a deliberation step, so the model spends thinking tokens working through the rungs before it saves any output, and together with the always-on ruleset that can cost more than the shorter code saves. On GPT-5.5 it does. And all of this is single-shot, one prompt in and one answer out: a real agent session re-injects the ruleset and runs the ladder every turn, which this benchmark does not measure, so per-session cost can land either way. The rule was never "fewest tokens." It is: write only what the task needs, and never cut validation, error handling, security, or accessibility. The code ends up small because it is necessary, not golfed, and that is the part that stays maintainable. Lower cost and latency are a side effect on the models that follow it.

## How it works

Before writing code, the agent stops at the first rung that holds:

```
1. Does this need to exist?   → no: skip it (YAGNI)
2. Stdlib does it?            → use it
3. Native platform feature?   → use it
4. Installed dependency?      → use it
5. One line?                  → one line
6. Only then: the minimum that works
```

Lazy, not negligent: trust-boundary validation, data-loss handling, security, and accessibility are never on the chopping block.

## Install

The most effort ponytail will ever ask of you:

The Claude Code and Codex plugins run two tiny Node.js lifecycle hooks, so `node` needs to be on your PATH (note for Nix/nvm users: it must be on the non-interactive shell's PATH). If it isn't, the skills still work, the always-on activation just stays quiet instead of erroring on every prompt.

### Claude Code

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

### Codex

```
codex plugin marketplace add DietrichGebert/ponytail
codex
```

Open `/plugins`, select the Ponytail marketplace, and install Ponytail. Then open `/hooks`, review and trust its two lifecycle hooks, and start a new thread.

This same install also covers the Codex desktop app: restart the app after installing and it picks up the plugin.

### GitHub Copilot CLI

```
copilot plugin marketplace add DietrichGebert/ponytail
copilot plugin install ponytail@ponytail
```

In an interactive Copilot CLI session, use the slash equivalents:

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

Copilot CLI namespaces plugin commands by plugin name. For example:

```
/ponytail:ponytail ultra
/ponytail:ponytail-review
```

### Pi agent harness

```
pi install git:github.com/DietrichGebert/ponytail
```

### OpenCode

Run OpenCode from a checkout of this repo (the plugin reuses its `hooks/` and `skills/`), and add to `opencode.json`:

```
{ "plugin": ["./.opencode/plugins/ponytail.mjs"] }
```

Injects the ruleset every turn at the active level; adds the `/ponytail` commands (see [Commands](#commands)). OpenCode also auto-loads this repo's `AGENTS.md`, so the rules hold even without the plugin. The plugin adds the `lite/full/ultra/off` levels.

The `./` path resolves against your project's `opencode.json`; to share one checkout across projects, point it at the absolute path of the `.mjs` instead (it finds its `hooks/` and `skills/` relative to its own file).

### Gemini CLI

```
gemini extensions install https://github.com/DietrichGebert/ponytail
```

Loads the ruleset as always-on context every session and registers the `/ponytail` commands; the `skills/` ship too, activated when a task needs them.

### Antigravity CLI

Google is renaming Gemini CLI to Antigravity CLI (the `agy` binary); the same extension installs there:

```
agy plugin install https://github.com/DietrichGebert/ponytail
```

It reuses this repo's `gemini-extension.json`. One difference: Antigravity converts the `/ponytail` commands into skills, so you type them into the chat (e.g. `/ponytail-review` as a message) instead of picking them from a slash menu. Until the migration completes (around June 18, 2026), `gemini extensions install` still works too. To run it as an always-on rule instead, drop the ruleset into `.agents/rules/`.

### OpenClaw

```
clawhub install ponytail
```

Installs ponytail as an OpenClaw skill from ClawHub; the review, audit, debt, and help skills install the same way (`clawhub install ponytail-review`, and so on). OpenClaw applies it on coding tasks and also exposes it as a `/ponytail` command. Without ClawHub, copy [`.openclaw/skills/ponytail`](https://github.com/DietrichGebert/ponytail/blob/main/.openclaw/skills) into `~/.openclaw/skills/`.

That was it. He'd be proud. He won't say it.

Active every session, with a handful of commands (see [Commands](#commands)). `/ponytail ultra` exists for when the codebase has wronged you personally. Startup and mode-change text shows the current mode.

Set the level for every new session with the `PONYTAIL_DEFAULT_MODE` env var (`lite` / `full` / `ultra` / `off`), or a `defaultMode` field in `~/.config/ponytail/config.json` (`%APPDATA%\ponytail\config.json` on Windows). The default is `full`.

Cursor, Windsurf, Cline, GitHub Copilot (editor), Aider, Kiro: copy the matching rules file from this repo ([`.cursor/rules/`](https://github.com/DietrichGebert/ponytail/blob/main/.cursor/rules), [`.windsurf/rules/`](https://github.com/DietrichGebert/ponytail/blob/main/.windsurf/rules), [`.clinerules/`](https://github.com/DietrichGebert/ponytail/blob/main/.clinerules), [`.github/copilot-instructions.md`](https://github.com/DietrichGebert/ponytail/blob/main/.github/copilot-instructions.md), [`AGENTS.md`](https://github.com/DietrichGebert/ponytail/blob/main/AGENTS.md), [`.kiro/steering/`](https://github.com/DietrichGebert/ponytail/blob/main/.kiro/steering)).

Kiro: copy `.kiro/steering/ponytail.md` to `~/.kiro/steering/` (global) or `.kiro/steering/` in your project.

GitHub Copilot CLI fallback (instruction-only mode): it reads `AGENTS.md` and `.github/copilot-instructions.md` in a project, or copy the rules into `~/.copilot/copilot-instructions.md` to run ponytail in every project. This path keeps always-on guidance, but does not add plugin mode switches or hooks.

VS Code with the Codex extension reads `AGENTS.md`, which this repo ships, so it works from the repo root with no setup (`~/.codex/AGENTS.md` makes Codex global).

Which files map to which agent: [Agent portability](https://github.com/DietrichGebert/ponytail/blob/main/docs/agent-portability.md).

## Commands

| Command | What it does |
| --- | --- |
| `/ponytail [lite \| full \| ultra \| off]` | Set the intensity, or turn it off. No argument reports the current level. |
| `/ponytail-review` | Review the current diff for over-engineering, hands back a delete-list. |
| `/ponytail-audit` | Audit the whole repo for over-engineering, not just the diff. |
| `/ponytail-debt` | Harvest the `ponytail:` shortcuts you've deferred into a ledger, so "later" doesn't become "never". |
| `/ponytail-help` | Quick reference for the commands above. |

Commands need a skill-capable host (Claude Code, Codex, OpenCode, Gemini, pi). In Codex they're skills, invoke with `@` (`@ponytail-review`). The instruction-only adapters (Cursor, Windsurf, Cline, Copilot, Kiro, Antigravity) load the always-on ruleset without the commands.

## Development

When changing the compact rule text, keep the agent copies aligned:

```
node scripts/check-rule-copies.js
npm test
```

The OpenClaw skill package (`.openclaw/skills/`) is generated from `skills/`; rerun `node scripts/build-openclaw-skills.js` after changing a skill, the test suite fails if it is stale.

The correctness benchmark spawns Python for email and CSV checks; `python3` is tried before `python`. CSV checks need `pandas` installed locally.

## FAQ

**Does it need a config file?** No. An optional `~/.config/ponytail/config.json` or `PONYTAIL_DEFAULT_MODE` env var can set the default level, but nothing is required.

**What if I really need the 120-line cache class?** You don't. Insist anyway and he'll build it. Slowly. Correctly. While looking at you.

**Does it scale?** The code you never wrote scales infinitely. Zero bugs, zero CVEs, 100% uptime since forever.

**Why "ponytail"?** You know exactly why.

## License

[MIT](https://github.com/DietrichGebert/ponytail/blob/main/LICENSE). The shortest license that works.

## Key Comments

（非社交媒體，原頁無公開留言區 → 不適用。本類 reference source（repo / gist / 官方文件）link-rot 風險低。）
