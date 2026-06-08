# Second Brain — LLM Wiki

Mode: D+C+E (Personal + Projects + Research)
Purpose: Mixed second brain for personal life, projects, and research
Owner: masterdr
Created: 2026-06-07

## Structure

```
vault/
├── .raw/                    # immutable source documents
│   ├── articles/
│   ├── transcripts/
│   ├── screenshots/
│   ├── data/
│   └── assets/
├── wiki/
│   ├── index.md             # master catalog
│   ├── log.md               # append-only operation log
│   ├── hot.md               # ~500 word recent context cache
│   ├── overview.md          # executive summary
│   ├── sources/             # one summary per raw source
│   ├── entities/            # people, orgs, products
│   ├── concepts/            # ideas, frameworks, patterns
│   ├── domains/             # top-level topic areas
│   ├── comparisons/         # side-by-side analyses
│   ├── questions/           # filed answers
│   ├── meta/                # dashboards, lint reports
│   ├── goals/               # personal & professional goals
│   ├── areas/               # life areas (health, finance, career…)
│   ├── learning/            # skills being mastered
│   ├── people/              # relationships and shared context
│   ├── resources/           # books, courses, tools
│   └── projects/            # active and archived projects
├── _templates/              # note templates
├── _attachments/            # images and PDFs
└── WIKI.md                  # full LLM operating manual
```

## Conventions

- All notes use YAML frontmatter: type, status, created, updated, tags (minimum)
- Wikilinks use [[Note Name]] format — filenames are unique, no paths needed
- .raw/ contains source documents — never modify them
- wiki/index.md is the master catalog — update on every ingest
- wiki/log.md is append-only — new entries go at the TOP, never edit past entries

## Operations

- **Ingest**: drop source in .raw/, say "ingest [filename]"
- **Query**: ask any question — Claude reads hot.md first, then index, then drills in
- **Lint**: say "lint the wiki" to run a health check
- **Scaffold complete**: ready to use

## Git auto-commit

The claude-obsidian plugin auto-commits wiki edits via a PostToolUse hook that runs
`git add -- wiki/ .raw/ .vault-meta/ && git commit -- wiki/ .raw/ .vault-meta/`.
It needs **all three pathspecs to resolve**, so this vault keeps `.raw/.gitkeep` and
`.vault-meta/.gitkeep` committed. Don't delete them — without them `.vault-meta/`
won't exist (git add aborts) and `.raw/` has no tracked file (git commit pathspec
error), and the hook swallows both errors (`2>/dev/null || true`), so wiki edits
stop committing **silently**. Verify it's working by checking that `git status` is
clean after a wiki edit and that `wiki: auto-commit <date>` commits appear in the log.

## Wiki Knowledge Base (for other projects)

When another project's CLAUDE.md references this vault:
1. Read wiki/hot.md first (recent context, ~500 words)
2. If not enough, read wiki/index.md (full catalog)
3. If you need domain specifics, read wiki/<domain>/_index.md
4. Only then read individual wiki pages
