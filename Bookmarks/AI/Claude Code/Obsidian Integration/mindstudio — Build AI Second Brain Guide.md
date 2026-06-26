---
type: bookmark
para: resource
domain: obsidian-ai
title: "How to Build an AI Second Brain with Claude Code and Obsidian"
url: "https://www.mindstudio.ai/blog/build-ai-second-brain-claude-code-obsidian"
status: active
created: 2026-06-26
updated: 2026-06-26
summary: "Pattern A 嘅 7-folder 結構 (Inbox/Projects/Areas/Resources/Archive/AI/Templates) + CLAUDE.md 5 component 建議 (personal context / vault structure / session protocol / tone / tools)"
tags:
  - bookmark
  - obsidian
  - ai
  - claude-obsidian-workflow
  - found-by-claude
---

# How to Build an AI Second Brain with Claude Code and Obsidian

> [!info] Bookmark · obsidian-ai domain · Claude-found
> Pattern A 嘅 7-folder 結構 (Inbox/Projects/Areas/Resources/Archive/AI/Templates) + CLAUDE.md 5 component 建議 (personal context / vault structure / session protocol / tone / tools)

## Summary
Pattern A 嘅 7-folder 結構 (Inbox/Projects/Areas/Resources/Archive/AI/Templates) + CLAUDE.md 5 component 建議 (personal context / vault structure / session protocol / tone / tools)

## Key Takeaways
- _(待補)_

## My Notes
_(待補)_

## Related
- Synthesis: [[Claude + Obsidian Project Workflow]]
- Comparison: [[Claude + Obsidian Workflow Pattern Comparison]]
- Hub: [[Obsidian]]

<!-- ===== ARCHIVE BELOW (link-rot protection) ===== -->

## Full Content (archived)

## Why Most People’s Knowledge Systems Eventually Break Down

You’ve probably felt it before — the creeping sense that you’ve thought through a problem before, written notes about it somewhere, maybe even solved it, but you can’t find any of it. Ideas sit in Notion pages you never reopen. Research lives in browser tabs you’ll close by Friday. Meeting notes pile up without connecting to anything.

The concept of a “second brain” — a personal knowledge system that stores and surfaces information when you need it — has been around for years. But most implementations are static. You write things down, and they just… sit there. They don’t connect to each other automatically. They don’t help you act on what you know. And they definitely don’t get smarter over time.

That’s where Claude Code and Obsidian change the picture. Together, they let you build a second brain that actually does something — one that reads your notes, understands context, builds on previous sessions, and automates the repetitive work that eats up your day. This guide walks you through exactly how to set that up.

*Last updated: 2026-05-11 — added current Claude Code skill and orchestration references.*

---

## What Makes a Second Brain “AI-Powered”

A traditional second brain (in the sense popularized by Tiago Forte’s methodology) is a curated, searchable knowledge base. Obsidian is one of the best tools for this: local-first, markdown-based, with a powerful graph view and plugin ecosystem. But it’s still passive storage.

## Other agents ship a demo. Remy ships an app.

UI

React + Tailwind ✓ LIVE

API

REST · typed contracts ✓ LIVE

DATABASE

real SQL, not mocked ✓ LIVE

AUTH

roles · sessions · tokens ✓ LIVE

DEPLOY

git-backed, live URL ✓ LIVE

Real backend. Real database. Real auth. Real plumbing. Remy has it all.

An AI-powered second brain adds an agent layer on top. Instead of just storing information, it:

- **Synthesizes** notes and surfaces relevant context when you start a new task
- **Learns your patterns** across sessions, not just within one conversation
- **Takes action** — drafting, sending, scheduling, summarizing — based on what’s in your vault
- **Writes back** into your knowledge base, so every session leaves a trace

Claude Code, Anthropic’s agentic coding and automation tool, is well-suited for this role. It can read and write files, execute code, browse the web, and maintain context across long tasks. Paired with an Obsidian vault as its memory layer, it becomes an agent that knows your history and builds on it.

---

## Understanding Claude Code and What It Can Actually Do

Claude Code is a terminal-based agent — you run it from the command line inside a project directory. It can see all the files in that directory, write new ones, run shell commands, and call external APIs.

This is different from just chatting with Claude in a browser. Claude Code is designed for extended, multi-step tasks. It doesn’t forget what it’s doing three messages in. It can:

- Read dozens of files before responding
- Write structured outputs to specific file paths
- Execute scripts and interpret the results
- Maintain a working context document it updates as it goes

The critical insight for building a second brain: your Obsidian vault is just a folder of markdown files. Claude Code can read that folder, understand the structure, and write back into it. That’s all you need to close the loop. This is the same pattern Andrej Karpathy describes in his [LLM wiki concept for personal knowledge bases](https://www.mindstudio.ai/blog/andrej-karpathy-llm-wiki-knowledge-base-claude-code) — structured markdown as the substrate, a capable agent as the interface.

---

## Setting Up Your Obsidian Vault as a Structured Knowledge Base

Before connecting Claude Code, your vault needs a consistent structure. Claude works better with clear, predictable file organization.

### Folder Structure That Works

A simple structure that’s easy for both humans and agents to navigate:

```plaintext
/Vault
  /Inbox          ← Raw captures, quick notes
  /Projects       ← Active project folders
  /Areas          ← Ongoing responsibilities (health, finances, work)
  /Resources      ← Reference material by topic
  /Archive        ← Completed projects, old notes
  /AI             ← Agent outputs, session logs, summaries
  /Templates      ← Reusable note templates
```

The `/AI` folder is new to most people’s setups. This is where Claude Code writes its outputs — session summaries, generated drafts, task logs. Over time, this folder becomes a record of everything the agent has done for you.

### Frontmatter Conventions

Use YAML frontmatter consistently at the top of notes. Claude can parse and filter by these fields. A minimal standard:

```yaml
---
created: 2025-01-15
tags: [project, client, active]
status: in-progress
related: [[Meeting Notes - Jan 10]], [[Project Brief]]
---
```

## One coffee. One working app.

You bring the idea. Remy manages the project.

WHILE YOU WERE AWAY

✓Designed the data model

✓Picked an auth scheme — sessions + RBAC

✓Wired up Stripe checkout

✓Deployed to production

Live at yourapp.msagent.ai

The `related` field using Obsidian’s wiki-link syntax is especially useful. Claude Code can follow these references and build a fuller picture of context before acting. As your vault grows past a few hundred notes, [Graphify’s knowledge-graph approach for Claude Code](https://www.mindstudio.ai/blog/graphify-claude-code-knowledge-graph-large-codebase-70x) shows how to compress a large interconnected document set into something an agent can navigate efficiently without loading every file into context.

### Daily Notes as Agent Handoff Points

Set up daily notes as structured templates. Include sections like:

- **Top priorities** — What you’re focused on today
- **Open loops** — Unresolved items from yesterday
- **Context for AI** — Anything you want the agent to know before it starts
- **Agent log** — Populated by Claude Code after each session

This daily note becomes the entry point for each Claude Code session. It tells the agent what matters today, and it receives the agent’s summary when the session ends.

---

## Connecting Claude Code to Your Obsidian Vault

### Prerequisites

- Obsidian installed with your vault stored locally (not just in iCloud)
- Claude Code installed via `npm install -g @anthropic-ai/claude-code`
- An Anthropic API key (set as `ANTHROPIC_API_KEY` in your environment)
- Basic comfort with the terminal

### The Project Directory Setup

Navigate to your vault folder in the terminal:

```bash
cd ~/Documents/MyVault
claude
```

That’s it for basic setup. Claude Code is now running inside your vault. It can see every file. But to make this a real second brain, you need to give it context about how to behave.

### Writing a CLAUDE.md System Prompt

Claude Code looks for a `CLAUDE.md` file in the project root. This is your agent’s standing instructions — it reads this every session. Think of it as the constitution for your second brain.

A strong `CLAUDE.md` for a personal knowledge system includes:

**Who you are and what you do** Write 2-3 sentences about your role, the kind of work you do, and what you’re trying to accomplish.

**Vault structure guide** Describe your folder structure and naming conventions so the agent knows where to look and where to write.

**Session protocol** Define what the agent should do at the start of each session (read today’s daily note, check the inbox folder, review open loops) and at the end (write a session summary to `/AI/sessions/`, update the daily note’s agent log).

**Tone and output preferences** How should responses be formatted? Do you want bullet points or prose? Do you want the agent to ask clarifying questions or make reasonable assumptions?

**What the agent has access to** List any tools or scripts available (more on this below).

Here’s a partial example:

```markdown
# My Second Brain — Agent Instructions

## About Me
I'm a product manager at a B2B SaaS company. I manage 3-4 active projects at any time and
need help synthesizing research, drafting documents, and tracking decisions.

## Vault Structure
- /Inbox: Capture notes I haven't processed. Check here first.
- /Projects: Each project has its own folder. Active projects have status: active in frontmatter.
- /AI/sessions: Write a session summary here after every session.

## Session Protocol
Start each session by:
1. Reading today's daily note (format: /Inbox/YYYY-MM-DD.md)
2. Scanning /Inbox for unprocessed notes
3. Checking for any notes tagged #needs-review

End each session by:
1. Writing a session summary to /AI/sessions/YYYY-MM-DD-HH.md
2. Updating today's daily note with an "Agent Log" section
```

### Persistent Memory Through Session Logs

## Remy is new. The platform isn't.

Remy

Product Manager Agent

THE PLATFORM

200+ models 1,000+ integrations Managed DB Auth Payments Deploy

▮

BUILT BY MINDSTUDIO

Shipping agent infrastructure since 2021

Remy is the latest expression of years of platform work. Not a hastily wrapped LLM.

This is the piece that makes the system actually learn. Every session, Claude Code writes a structured summary:

- What was discussed or worked on
- Decisions made
- Outstanding items
- Any new information about your preferences or context

At the start of the next session, the agent reads recent session logs before doing anything else. This creates genuine continuity — the agent isn’t starting from scratch every time. It knows what you were working on yesterday. It remembers that you prefer concise bullet summaries over long paragraphs. It knows that the Henderson project is on hold.

---

## Building Workflows That Automate Daily Business Tasks

Once the basic memory system is working, you can extend it with specific workflows. Here are four that pay off quickly.

### Inbox Processing Workflow

Every morning, capture everything into your Obsidian Inbox folder — voice memos transcribed by your phone, emails you forwarded to a notes inbox, photos of whiteboards, quick text captures. Then run Claude Code with the instruction: “Process my inbox.”

The agent reads each item, creates properly structured notes in the right folders with appropriate frontmatter and tags, identifies connections to existing notes, and archives or deletes the raw inbox items. What used to take 20-30 minutes happens in under 5.

### Weekly Review Automation

The weekly review is one of the most valuable habits in any knowledge system — and one of the most skipped. Claude Code can handle most of it:

```plaintext
Run my weekly review:
1. Summarize completed work from this week's daily notes and project files
2. List open loops and unresolved decisions
3. Flag any stale projects (no updates in 7+ days)
4. Draft next week's priorities based on my goals and current project status
5. Write the output to /Reviews/YYYY-WW.md
```

The output is a structured weekly review document you can skim in minutes, then adjust. You get the reflection without the friction.

### Meeting Preparation Workflow

Before an important meeting, run: “Prepare me for my 2pm call with \[Client\].” Claude Code searches your vault for all notes tagged with that client’s name, pulls relevant project context, surfaces any open questions or commitments from past meetings, and produces a clean briefing doc.

### Research Synthesis

When you’re starting a new project or need to get up to speed on a topic, you can feed Claude Code a batch of reference material (PDFs, web content, articles saved as markdown) and ask it to synthesize the key points, identify patterns, and connect to relevant existing notes in your vault. The synthesized output lands in `/Resources`, linked to the original sources and to related project notes. If you want to package these recurring patterns as reusable agent capabilities, [these 5 Claude Code skills cut token costs by up to 70%](https://www.mindstudio.ai/blog/5-claude-code-skills-cut-token-costs-70-percent-benchmarked) — the same idea works for second-brain workflows like inbox triage, weekly review, or meeting prep.

---

## Extending This Setup with MindStudio

Claude Code running locally against your Obsidian vault handles the thinking and writing layer well. But there are limits — it doesn’t natively send emails, trigger calendar events, push to external tools, or run on a schedule without you being at your terminal.

This is where [MindStudio](https://mindstudio.ai/) fills the gap. MindStudio’s [Agent Skills Plugin](https://www.mindstudio.ai/developer) lets Claude Code and other AI agents call 120+ business capabilities as simple method calls — things like `agent.sendEmail()`, `agent.searchGoogle()`, and `agent.runWorkflow()`. The plugin handles rate limiting, retries, and auth so your agent can focus on reasoning, not plumbing.

In practice, this means your Claude Code second brain can go further than local file manipulation:

- **Send a summary email** after completing a weekly review, rather than just writing the file
- **Create a calendar event** when a deadline is identified in your notes
- **Push a task to Notion or Airtable** when a project note changes status to `active`
- **Search the web** to supplement research synthesis with current information

For teams, MindStudio also lets you build shareable, no-code AI workflows that don’t require everyone to run Claude Code from a terminal. If your process for inbox processing or meeting prep is working well, you can replicate its logic in MindStudio’s visual builder and share it with colleagues — no setup required on their end. With 1,000+ integrations and support for all major AI models, you can build workflows that connect your personal knowledge system to the broader tools your team already uses. If you want to push the local-Claude-Code half further before reaching for a hosted layer, [the Superpowers plugin packages reusable Claude Code skills](https://www.mindstudio.ai/blog/what-is-superpowers-plugin-claude-code) that map naturally onto second-brain workflows — note triage, summarization, scheduled reviews.

You can try MindStudio free at [mindstudio.ai](https://mindstudio.ai/).

---

## Common Mistakes to Avoid

### Inconsistent Vault Structure

Claude Code is good at inferring structure, but inconsistency creates friction. If some projects live in `/Projects` and others in `/Work/Active`, the agent has to guess. Spend an hour standardizing your vault before connecting the agent — it pays off quickly.

### Writing a CLAUDE.md That’s Too Vague

“Be helpful” is not a useful instruction. The more specific you are about your context, your vault’s conventions, and your expectations for each session, the more accurate and useful the agent’s outputs will be. Update `CLAUDE.md` whenever you notice repeated misunderstandings.

### Not Reading the Session Logs

The session logs are only useful if you actually read them. Build a 2-minute habit of reviewing the previous session’s log before starting a new one. You’ll catch errors, refine instructions, and stay oriented.

### Treating Every Task as an Agent Task

Some tasks are faster to do yourself. If you need to rename one file, just rename it. Claude Code is most valuable for tasks involving synthesis across many notes, consistent multi-step workflows, or output generation where you want a first draft. Don’t reach for the agent when a 30-second manual action is simpler.

### Letting the Inbox Become a Dumping Ground

The inbox only works if you process it. Set a daily trigger — first coffee, end of lunch, start of shutdown — and run the inbox processing workflow then. A backlog of 200 unprocessed notes turns the agent into a mess.

---

## FAQ

### Does Claude Code actually remember things between sessions?

## Remy doesn't build the plumbing. It inherits it.

Other agents wire up auth, databases, models, and integrations from scratch every time you ask them to build something.

WHAT REMY DOESN'T HAVE TO BUILD

200+

AI MODELS

GPT · Claude · Gemini · Llama

✓

1,000+

INTEGRATIONS

Slack · Stripe · Notion · HubSpot

✓

MANAGED DB

AUTH

PAYMENTS

CRONS

Remy ships with all of it from MindStudio — so every cycle goes into the app you actually want.

Not natively. Claude Code doesn’t have persistent memory built in. The memory in this setup comes from session logs written to your Obsidian vault. At the start of each session, you (or your `CLAUDE.md` instructions) tell the agent to read recent session logs before doing anything else. This creates continuity through structured documentation, not the model’s internal memory.

### Is it safe to give Claude Code access to my entire Obsidian vault?

This depends on what’s in your vault and your threat model. Claude Code runs locally — your files aren’t being uploaded to a server by default (though API calls to Anthropic do send your prompts and any file content you include). For most people’s personal and work notes, this is fine. If your vault contains highly sensitive material (legal, medical, financial), apply judgment about what you include in queries. You can also create a filtered sub-vault with less sensitive content for agent access.

### How is this different from just chatting with Claude in the browser?

Browser-based Claude has no access to your files, doesn’t persist anything between conversations, and can’t take actions like writing files or running scripts. Claude Code is a local agent with filesystem access, the ability to run code and shell commands, and a project-based context window that includes all your vault files. The gap between the two is significant for anything beyond one-off questions.

### Can I use a different AI model instead of Claude?

The Obsidian vault as structured file storage works with any agent that can read and write files. OpenAI’s Codex CLI, local models via tools like [Ollama](https://ollama.com/), and custom agents built with LangChain or CrewAI can all be pointed at the same vault structure. Claude Code is a strong default because of its large context window and reliability on long document tasks, but the architecture isn’t locked to one model.

### What Obsidian plugins complement this setup?

A few that integrate well:

- **Templater** — For consistent note templates, especially daily notes
- **Dataview** — For querying your vault like a database (agents can also read Dataview queries)
- **QuickAdd** — For fast inbox capture from within Obsidian
- **Periodic Notes** — For managing daily, weekly, and monthly notes with consistent naming

None of these are required, but they make the vault easier to work with for both you and the agent.

### How long does it take to set this up?

The basic setup — organizing your vault, writing a `CLAUDE.md`, and running your first Claude Code session — takes about an hour. Getting the system dialed in, with good session protocols and a few reliable workflows, takes another few sessions of iteration. Most people see meaningful time savings within the first week.

---

## Key Takeaways

- An AI second brain adds an agent layer to a knowledge base, making it active rather than passive
- Obsidian’s local markdown structure makes it a natural memory layer for Claude Code
- The `CLAUDE.md` file is your agent’s standing instructions — invest time in making it specific
- Session logs stored in the vault create genuine continuity across sessions
- MindStudio extends this setup by giving Claude Code access to external business tools and enabling no-code versions of your best workflows for team use

If you’re already using Obsidian and have been curious about making it more useful with AI, this is a practical entry point. Start with the structure cleanup and a basic `CLAUDE.md`. The more complex workflows can come later. For an opinionated take on where this pattern leads at maximum extension, [building an agentic operating system on Claude Code](https://www.mindstudio.ai/blog/how-to-build-agentic-operating-system-claude-code) walks through layering skills, hooks, and routing on top of a base workflow like this one. And if you want to go beyond what’s possible from the terminal, [MindStudio](https://mindstudio.ai/) is worth a look — it’s a fast way to turn your best agent workflows into something you can share, schedule, and connect to the rest of your tool stack.

## Key Comments

_(GitHub repo / blog post，可能無 dedicated comment section；如有 Discussions/Reddit thread 後續可加)_
