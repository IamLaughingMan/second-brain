---
type: bookmark
para: resource
domain: obsidian-ai
title: "Obsidian as a Second Brain: Manage Projects with AI Agents"
url: "https://educalvolopez.com/en/blog/obsidian-segundo-cerebro-agentes-ia"
status: active
created: 2026-06-26
updated: 2026-06-26
summary: "西班牙 PKM practitioner Eduardo Calvo López；管 projects with AI agents；強調 second-brain 概念同 agent 點 coordination"
tags:
  - bookmark
  - obsidian
  - ai
  - claude-obsidian-workflow
  - found-by-claude
---

# Obsidian as a Second Brain: Manage Projects with AI Agents

> [!info] Bookmark · obsidian-ai domain · Claude-found
> 西班牙 PKM practitioner Eduardo Calvo López；管 projects with AI agents；強調 second-brain 概念同 agent 點 coordination

## Summary
西班牙 PKM practitioner Eduardo Calvo López；管 projects with AI agents；強調 second-brain 概念同 agent 點 coordination

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

You have meeting notes in Notion, specs in Google Docs, decisions buried in Slack threads, and code snippets scattered across local folders. Somebody asks why a certain architecture decision was made three months ago and the answer is... somewhere. Maybe a message, maybe a doc nobody updated, maybe in someone's head who already left the team.

This is the default state of most teams. And it gets worse over time. The more projects you juggle, the more context you lose.

What if there was a single system where all your project knowledge lived in plain files on your disk, organized with a real method, and accessible to AI agents that can search, summarize, and generate from it? That system exists. It is Obsidian plus a few well-chosen connections.

## Why Obsidian (and not something else)

The answer comes down to one principle: **local-first**. Your files live on your disk as plain Markdown. No proprietary format, no cloud dependency, no subscription required to access your own notes. If Obsidian disappeared tomorrow, you would still have every single file exactly where you left it.

That alone sets it apart from Notion, Roam, or Coda. But there is more:

- **No vendor lock-in.** Move your vault to any Markdown editor. Your notes are yours.
- **2,500+ community plugins.** Whatever workflow you need, someone probably built it.
- **Bases** is the new structured data layer, bringing database-like views (tables, boards, calendars) directly into your vault without leaving Markdown.
- **Official CLI.** Since version 1.12 (February 2026), Obsidian ships with a [command-line interface](https://obsidian.md/cli) that includes over 100 commands. Search, create notes, manage tasks, open your daily note, all from the terminal. Free, no subscription. This changes how AI agents interact with your vault.
- **[Obsidian Skills](https://github.com/kepano/obsidian-skills)** by Steph Ango (CEO of Obsidian) is a clear strategic signal. The leadership is actively building bridges between Obsidian and AI agents. This is not a community hack; it is the direction the product is heading.

Obsidian is evolving from a note-taking app into something closer to a lightweight operating system for knowledge work. And the AI integration is the piece that makes it click.

## The method: PARA + Zettelkasten for projects

A tool without a method is just a fancy folder. Two frameworks give your vault real structure.

**PARA** (by Tiago Forte) splits everything into four categories:

| Category | What goes here | Example |
| --- | --- | --- |
| Projects | Active work with a deadline | Client app redesign |
| Areas | Ongoing responsibilities | Engineering standards, design system |
| Resources | Reference material | Code snippets, articles, API docs |
| Archives | Completed or paused items | Shipped projects, old specs |

**Zettelkasten** adds the connection layer. Each note is atomic (one idea, one file) and linked to related notes. Instead of rigid hierarchies, you get a web of knowledge that grows organically.

Combined, they give you both structure and flexibility. Here is what a practical developer vault looks like:

```
vault/
  projects/
    client-app/
      specs/
      decisions/
      meeting-notes/
      retrospectives/
    internal-tool/
      specs/
      decisions/
  areas/
    engineering/
    design/
    infrastructure/
  resources/
    snippets/
    references/
    reading-notes/
  archives/
  templates/
```

Every project gets the same sub-folders. Every note follows the same template. Consistency is what makes this searchable, both for you and for an AI agent.

**Essential plugins to make this work:**

| Plugin | Purpose |
| --- | --- |
| Dataview | Query your vault like a database |
| Templater | Dynamic templates with variables and logic |
| Tasks | Track to-dos across all notes with due dates and filters |
| QuickAdd | One-keystroke note creation with predefined templates |
| Calendar | Visual timeline tied to daily/weekly notes |
| Periodic Notes | Automated daily, weekly, and monthly note creation |

These six plugins turn Obsidian from a note editor into a project management system. And they are just the foundation.

## Connecting Obsidian with AI agents

This is where it gets interesting. There are four layers of integration, each with a different level of depth.

### Layer 1: AI plugins inside Obsidian

These run inside the app and give you AI capabilities without leaving your vault.

[**Smart Connections**](https://github.com/brianpetro/obsidian-smart-connections) is the standout. It builds a local embedding index of your entire vault and uses RAG (retrieval-augmented generation) to find related notes. Write a new spec, and it surfaces every related decision, meeting note, and snippet automatically. The connections are semantic, not just keyword matches.

[**Copilot for Obsidian**](https://github.com/logancyang/obsidian-copilot) brings multi-model support directly into the editor. Claude, GPT, Gemini, or local models through Ollama. You can chat with your vault, ask questions about your notes, and get answers grounded in your actual content.

[**Text Generator**](https://github.com/nhaouari/obsidian-textgenerator-plugin) focuses on content creation with multiple providers. Useful for drafting documentation, expanding bullet points into prose, or generating meeting summaries from raw notes.

### Layer 2: Obsidian CLI -- your vault from the terminal

Since February 2026, Obsidian ships with an [official CLI](https://obsidian.md/cli) that includes over 100 commands. This matters because any AI agent with terminal access (Claude Code, Codex CLI, Gemini CLI) can operate on your vault directly without MCP servers or additional plugins.

Some commands that change the game:

```
obsidian search query="authentication decision"       # Search the vault
obsidian daily                                         # Open today's note
obsidian daily:append content="Pending task"           # Add content without opening the app
obsidian files --vault=my-vault                        # List files
obsidian create --title="ADR: New API" --vault=my-vault  # Create a note
```

The advantage over MCP servers: zero extra configuration. Enable the CLI in Settings, register the command, and it works. The agent runs `obsidian search` just like it would run `git status`. No intermediary server, no API key, no REST plugin.

The CLI requires Obsidian to be running in the background (it communicates with the app). If your workflow includes having Obsidian open while coding, the CLI is the most direct option.

### Layer 3: MCP servers -- for richer integrations

If you need more than what the CLI offers -- or if you use Claude Desktop instead of Claude Code -- MCP servers are still valuable. I covered them in detail in the [previous article on MCP servers](https://educalvolopez.com/en/blog/mcp-servers-conectar-herramientas-claude-code).

[**mcp-obsidian**](https://github.com/MarkusPfundstein/mcp-obsidian) acts as a REST API bridge between your vault and any MCP-compatible agent. It exposes your notes, folders, and search capabilities through the Local REST API plugin.

[**obsidian-mcp-tools**](https://github.com/jacksteamdev/obsidian-mcp-tools) goes deeper. It adds semantic search over your vault contents and integrates with Templater for structured note creation. The agent does not just read your notes; it can create new ones following your templates.

Here is a configuration example for `claude_desktop_config.json`:

```
{
  "mcpServers": {
    "obsidian": {
      "command": "npx",
      "args": ["-y", "mcp-obsidian"],
      "env": {
        "OBSIDIAN_API_KEY": "your-api-key"
      }
    }
  }
}
```

**When CLI vs MCP:** If you work from the terminal with Claude Code, the CLI is enough for most operations. MCP shines when you need semantic search, Templater integration, or when using Claude Desktop where there is no terminal access.

### Layer 4: Obsidian Skills -- the agent UNDERSTANDS Obsidian

This is the most significant layer. [**Obsidian Skills**](https://github.com/kepano/obsidian-skills) is an official project by kepano (Steph Ango, CEO of Obsidian) and has accumulated over 13,900 stars on GitHub. This is not a side experiment. It is the company signaling where the product is going.

The repository includes skills that teach the agent to work with the Obsidian ecosystem:

| Skill | What it teaches the agent |
| --- | --- |
| Obsidian Markdown | Obsidian-flavored Markdown syntax, callouts, embeds, links |
| Bases | The new structured data layer, queries, views |
| JSON Canvas | The open format for infinite canvases |
| CLI | Command-line vault operations |
| Defuddle | Content extraction and cleanup |

These skills are compatible with Claude Code and Codex CLI. Installation is simple:

```
cd your-vault
git clone https://github.com/kepano/obsidian-skills .claude/skills
```

The difference is fundamental. Without skills, the agent can read and write Markdown. With skills, the agent understands Obsidian conventions: how to create proper internal links, how to use callouts, how to structure a canvas, how to query Bases. It goes from being literate to being fluent.

The most powerful combination: **CLI + Skills**. The agent has direct access to the vault via terminal and also understands how Obsidian works. No intermediary servers, no API configuration, no external dependencies.

## Real workflows: managing projects with AI

Theory is nice. Here is what this looks like in practice.

### Workflow 1: Documenting technical decisions

Every significant technical decision should be an ADR (Architecture Decision Record). The problem is nobody wants to write them from scratch.

Set up a Templater template for ADRs:

```
---
type: decision
project: "{{tp.system.prompt('Project')}}"
date: "{{tp.date.now('YYYY-MM-DD')}}"
status: proposed
---

# ADR: {{tp.system.prompt('Decision title')}}

## Context

## Decision

## Consequences

## Alternatives considered
```

With QuickAdd, creating a new ADR is one keystroke. The AI fills in the draft based on meeting notes or Slack summaries you pasted into the vault. Then a Dataview query gives you a live dashboard:

```
TABLE status, date
FROM "projects"
WHERE type = "decision"
SORT date DESC
```

Every decision, across all projects, queryable and searchable. No more digging through Slack.

### Workflow 2: Meeting prep and summaries

Before a meeting, the agent searches your vault for all notes related to the topic: previous meeting notes, open tasks, recent decisions, blockers. It generates a prep document in seconds.

After the meeting, paste your raw notes. The AI extracts action items and creates tasks with the Tasks plugin format:

```
- [ ] Update API schema for v2 endpoint @john #client-app 📅 2026-04-10
- [ ] Review security audit findings @sarah #infrastructure 📅 2026-04-08
```

Tasks plugin tracks these across your entire vault. Nothing falls through the cracks.

### Workflow 3: Project onboarding

A new team member joins. Instead of scheduling three hours of knowledge transfer meetings, point them at the vault. They can ask the AI agent questions like:

- "What are the main architectural decisions for the client app?"
- "What was decided about the authentication flow?"
- "What are the open blockers for the current sprint?"

Smart Connections surfaces the relevant specs, decisions, and context. The new person gets up to speed in a fraction of the time, and the answers are grounded in actual documented decisions, not someone's fading memory.

### Workflow 4: Sprint review from the vault

At the end of a sprint, Dataview aggregates everything: completed tasks, decisions made, blockers encountered, notes created. The AI generates a sprint summary from this data.

```
TASK
FROM "projects/client-app"
WHERE completed
WHERE completion >= date("2026-03-25")
```

Instead of spending an hour reconstructing what happened, you have a draft review in minutes. The data was already there; it just needed to be assembled.

## The local option: Ollama + Obsidian

Not everything should go to the cloud. If you work with sensitive client data, proprietary code, or just value privacy on principle, running models locally is a real option.

**Ollama** runs open-source models on your machine. Combined with Text Generator or Smart Connections, you get AI capabilities without any data leaving your disk.

Practical model choices:

| Model | Best for | Trade-off |
| --- | --- | --- |
| Llama 3 (8B) | General tasks, summaries | Good balance of speed and quality |
| Mistral (7B) | Code-related queries | Strong reasoning, fast |
| Gemma (9B) | Structured extraction | Good at following templates |

The honest trade-off: local models are less capable than Claude or GPT-4 for complex reasoning tasks. For searching your vault, generating drafts, and extracting action items, they are more than sufficient. For deep architectural analysis or nuanced summarization, cloud models still win.

The setup is straightforward. Install Ollama, pull a model, and point Smart Connections or Text Generator to `localhost:11434`. Your vault stays entirely on your machine.

## Real case: from 40% overhead to under 10%

Eric J. Ma, managing 12 people across 2 teams, documented his experience using Obsidian as his central knowledge system. Before the setup, knowledge management overhead consumed 30-40% of his working time: hunting for context, re-explaining decisions, preparing for meetings, onboarding people.

After building a structured vault with PARA, Dataview queries, and AI integration, that overhead dropped to under 10%. The time savings came from three things: faster retrieval (the AI finds what you need), less repetition (decisions are documented once and discoverable), and automated assembly (sprint reviews, meeting preps, and onboarding docs generate themselves from existing notes).

The numbers will vary depending on your role and team size. But the pattern holds: the more context-switching and knowledge-sharing your work involves, the bigger the payoff.

## Where this is heading

Obsidian is quietly evolving from a note-taking app into a lightweight operating system for knowledge work. Bases adds structured data. Skills add AI fluency. MCP servers add external connectivity. Each piece compounds the others.

The sweet spot is local-first files plus AI agents. Your knowledge stays in plain Markdown on your disk, fully portable and fully yours. AI agents read, search, and generate from it without you needing to copy-paste between tools.

If you are starting from zero, keep it simple: set up a vault, organize it with PARA, install one AI plugin (Smart Connections is the best starting point), and build from there. The method matters more than the tools. A well-organized vault with no AI is already a massive improvement over scattered docs.

And if you are already using Obsidian, the MCP and Skills layers are worth exploring. They transform a personal knowledge base into a system that actively works with you, not just stores what you put in.

For the full breakdown on MCP servers and how to connect other tools, check the [previous article](https://educalvolopez.com/en/blog/mcp-servers-conectar-herramientas-claude-code).

## Key Comments

_(GitHub repo / blog post，可能無 dedicated comment section；如有 Discussions/Reddit thread 後續可加)_
