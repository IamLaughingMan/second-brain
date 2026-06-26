---
type: bookmark
para: resource
domain: obsidian-ai
title: "How I Built an AI-Powered Task System with Obsidian and Claude Code"
url: "https://www.jdhwilkins.com/how-i-built-an-ai-powered-task-system-with-obsidian-and-claude-code"
status: active
created: 2026-06-26
updated: 2026-06-26
summary: "6 note types task system；用 obsidian-cli skill 行所有 vault ops（防 broken link）；todo-vault skill atop CLI；metadata-first over folder hierarchy"
tags:
  - bookmark
  - obsidian
  - ai
  - claude-obsidian-workflow
  - found-by-claude
---

# How I Built an AI-Powered Task System with Obsidian and Claude Code

> [!info] Bookmark · obsidian-ai domain · Claude-found
> 6 note types task system；用 obsidian-cli skill 行所有 vault ops（防 broken link）；todo-vault skill atop CLI；metadata-first over folder hierarchy

## Summary
6 note types task system；用 obsidian-cli skill 行所有 vault ops（防 broken link）；todo-vault skill atop CLI；metadata-first over folder hierarchy

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

## Context engineering is the next big thing

If you have been following the AI space recently, you may have come across the term ***context engineering***. Coined by Shopify CEO Tobi Lütke and quickly endorsed by Andrej Karpathy, the argument is that "prompt engineering" undersells what is actually going on when you get consistently good results from an AI model.

> *"The art of providing all the context for the task to be plausibly solvable by the LLM."* - Tobi Lütke, Shopify CEO

Cleverly worded prompts are only a small part of how we can get *genuinely* useful outputs from generative AI tools. The information that's available to the model matters way more.

> *"Most agent failures are context failures, not model failures"* - Philipp Schmid, Google DeepMind

Strip away the AI here, and you have a problem that productivity nerds have been working on for decades: ***Personal Knowledge Management*** (PKM). The idea is to build a personal system for capturing, organising, and making the right information available (to humans) at the right time.

Most PKM systems are built around two layers. The ***knowledge layer*** stores notes, ideas, and reference material - the things you learn, think about and may want to return to.The ***task layer*** handles actions: tasks, reminders, habits, and scheduled events. Some PKM setups focus on one of these layers, but many of the more pragmatic ones handle both together.

For this project, however, I'm only building a task layer. I already have a similar knowledge layer setup, which I'd be happy to write another post about if anyone is interested.

In this post, I'll document how I built a task layer using Obsidian, Claude Code, and a pair of custom AI skills. The specific architecture I used isn't really important here. This is just the setup that works for me. What I think is worth taking away is how the ideas and tools combine to build a system that can fit with your individual workflow.

---

## What does a task layer actually need?

Most practical task layer setups, regardless of the tools, share the same core components:

**An inbox:** a low-friction holding pen for tasks, ideas, and reminders (before anything is sorted)

**A task organisation system:** somewhere to structure those items

**A daily note:** a single consolidated view of everything relevant to today

**A scheduled review:** a regular checkpoint to see what has been completed and whether priorities need adjusting

**An archive:** somewhere for completed items to go - out of sight, but accessible if ever needed again.

A common criticism of PKM systems is that people spend as much time managing the system as actually using it. The goal with my setup was to offload as much of that maintenance overhead to Claude as possible. The components above give the structure, while the AI takes care of the upkeep.

The rest of this post walks through how I have built each of these using Obsidian and Claude Code.

## My weapon of choice: Obsidian

For this project, I'm using ***Obsidian***, a note-taking application that sits on top of your local file system. Underneath is a folder of plain Markdown files. What makes it more than just a text editor is the ability to link notes together, assign structured metadata, and search across the whole *'vault* ' quickly.

Linking works in two ways:

A direct ***wikilink*** between notes - essentially a hyperlink from one note to another

***Frontmatter metadata*** - properties you assign at the top of each note, like a project tag or a status field. Obsidian's search can find all notes sharing a given property instantly, which makes grouping related items easy without enforcing a rigid folder structure

Put enough links together, and Obsidian can render them as a graph - a live visualisation of how everything in your vault connects.

Obsidian's community plugin ecosystem is extensive. There are calendar plugins available, and I did try them, but they just weren't the interface I gravitated towards. I found myself asking Claude what my upcoming schedule looked like instead, which turned out to be a better fit for how I work.

Folders in Obsidian are less meaningful than they look. In this system, they loosely group note types and house archives, but the real organisation comes from metadata. Trying to enforce a strict folder hierarchy just makes things harder to find. The metadata search is far more flexible.

If you want a proper introduction to Obsidian before continuing, [this guide](https://obsidian.rocks/getting-started-with-obsidian-a-beginners-guide/?ref=jdhwilkins.com) (not affiliated) is a good starting point.

As I mentioned, I keep my knowledge layer in a completely separate Obsidian vault. This post covers the task layer only. Having both open side by side is straightforward when I need to cross-reference them, and keeping them separate has meant each vault stays focused on one job. I will probably look at combining them at some point, but for now, this setup works just fine.

---

## The Obsidian CLI skill

The core of the AI side of the system is a Claude Code skill called ***obsidian-cli***. It gives any Claude agent a consistent interface for reading and writing to an Obsidian vault, using Obsidian's own command-line interface rather than touching the underlying files directly.

When an AI agent reads or writes files directly using standard file system operations, Obsidian has no awareness of those changes, often resulting in broken links. The CLI routes all operations through Obsidian's own runtime instead, so the vault's internal state stays consistent with whatever the agent is doing.

There is also a token efficiency argument. The CLI queries Obsidian's existing indexes rather than scanning raw files, which is [significantly faster and cheaper](https://prokopov.me/posts/obsidian-cli-changes-everything-for-ai-agents/?ref=jdhwilkins.com) than grep-style file operations.

Because the skill is vault-agnostic, I use the same one across both of my vaults. Any Claude agent running on my machine, from any project folder, has access to the same interface.

If you want to go deeper into how Claude Code skills work, I have written about [getting started with agent skills](https://www.jdhwilkins.com/getting-started-with-agent-skills) and [how to write them well](https://www.jdhwilkins.com/level-up-your-ai-agent-with-skills-engineering).

## The todo-vault skill

The ***todo-vault skill*** sits on top of the CLI and defines the actual shape of the task system and how the agent should use it. This is where the task organization component lives.

The skill establishes six note types, each with its own folder and frontmatter schema:

**Tasks:** undated, one-off action items

**Reminders:** date-sensitive tasks

**Repeated tasks:** recurring items with a defined schedule

**Habits:** personal habits tracked with a streak counter and history log

**Events:** scheduled appointments, with optional pre- and post-checklists

**Notes:** freeform reference material

Completed tasks, reminders, and events are archived automatically to 'old' subfolders. Repeated tasks and habits are never archived as they track a last-completed date and resurface on schedule. Having six clearly defined types means the agent can handle ingesting new items very reliably.

---

### The morning briefing

Perhaps my favourite feature of the skill is the ***morning briefing***, an eleven-step routine that runs automatically on a scheduled trigger each day. This is where the daily note and the review cadence components come in.

The routine starts by syncing yesterday's checkbox states back to each note's metadata - so if I ticked off a task in the daily note, the task note itself gets updated too (this is just a quirk of how Obsidian links work). Then it archives completed items, updates habit streaks, and compacts old daily notes into year/month subdirectories. After that, it scans for anything due in the next seven days, fetches a weather forecast, and builds the day's task list.

Rather than applying a fixed prioritisation rule, the briefing reads a pair of context files stored in the vault before building the list. Those files tell the agent what it needs to know to make sensible decisions. This includes what kinds of work I do, which days suit which types of tasks, what is currently in progress and my overall goals. Items from yesterday that were not completed carry forward with higher priority.

The output is a ***daily note*** containing the task list, today's habits, a seven-day forward view, and a weather summary. That note is my scheduling system for the day. Claude assembles the initial draft, but since these are just text files, I can make any necessary tweaks myself.

### Agent-managed context

The morning briefing's behaviour is influenced by two additional reference files from the vault.

[context.md](http://context.md/?ref=jdhwilkins.com) is mine to maintain. It holds facts and information the agent should know about me, such as my current goals and ambitions, my constraints, the things I'm working on and any long-term timelines or schedules.

[agent-notes.md](http://agent-notes.md/?ref=jdhwilkins.com) is maintained by the agent. It accumulates behavioural observations over time. So if I consistently skip a particular task, overload certain days of the week, or my working patterns change, that all gets recorded by the agent. The file is compacted periodically to keep it manageable.

Keeping both files inside the vault means I can update my context without touching the skill itself. The skill has a fixed instruction set, while the vault acts as a mutable data layer.

---

## Bringing it all together

Here is how this all looks in practice from my perspective.

The **inbox** is a speech-to-text brain dump using ***WisprFlow***. I speak, it transcribes, and I end up with a raw note full of tasks, ideas, and reminders in no particular order. It is the lowest-friction capture method I have found. (Not sponsored, it's just the best tool I've found so far.)

The **task organisation** is handled by Claude Code acting as an ingest mechanism. It reads the brain dump, identifies what each item is, and creates the appropriate note type in the vault. Tasks become task notes. Reminders get dates. Events go into the events folder. The vault ends up with clean notes without any manual filing.

The **daily note** is produced each morning by the briefing, running on its scheduled trigger. It is the single view I use to run my day.

The daily and weekly review comes into play here as well. Habit streaks are tracked automatically, carried-over tasks are flagged, and [agent-notes.md](http://agent-notes.md/?ref=jdhwilkins.com) builds a running picture of patterns over time. A more structured weekly review is something I am still developing, but the briefing already catches most of what a manual weekly check-in would surface.

The **archive** is fully automatic, as completed items are moved to old/ subfolders. Daily notes older than seven days move into Daily/YYYY/Month-Name/ folders, too. This means that the vault stays organised with no additional effort on my part.

The system as a whole is a reasonable answer to the context engineering problem. My data is structured, consistently maintained, and available to Claude in a form it can actually use. The agent is not working from a blank slate every morning. It has a current picture of what I am working on, what my priorities are, and how I tend to behave.

## Before you try this yourself...

The most important thing, if you are thinking about building something similar, is to really spend some time figuring out how you want to use such a system and what sort of structure will work for you. It'll take some trial and error to get it right. I often tweak my setup to add features and edit my morning briefing.

If there is interest in a deeper dive into the vault structure, skill files, and templates, let me know in the comments. There is a lot more to cover than fits in a single post.

## Key Comments

_(GitHub repo / blog post，可能無 dedicated comment section；如有 Discussions/Reddit thread 後續可加)_
