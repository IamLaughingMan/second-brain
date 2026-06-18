---
type: bookmark
para: resource
domain: pkm
title: "Obsidian Community Web Clipper Templates"
url: "https://github.com/obsidian-community/web-clipper-templates"
summary: "社群維護嘅官方 Web Clipper template 集，copy JSON 即 import（community bucket 出處）"
status: active
created: 2026-06-17
updated: 2026-06-18
related:
  - "[[Obsidian Web Clipper]]"
tags:
  - bookmark
  - found-by-claude
  - pkm
  - obsidian
  - web-clipper
  - github
---

# Obsidian Community Web Clipper Templates

- URL: https://github.com/obsidian-community/web-clipper-templates
- Saved date: 2026-06-17
- Topic: 社群維護嘅官方 Web Clipper template 集(copy JSON → import)
- Status: active

## Why I saved this

community bucket 出處。研究自動 bookmark 時搵到嘅現成 template 庫——唔使由零砌,copy JSON 入 Web Clipper,去對應站 clip 就用得。整自己「Bookmark」template 嘅參考起點。

## Related
- [[Obsidian Web Clipper]]
- [[kepano - Obsidian Web Clipper]]
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-18），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://github.com/obsidian-community/web-clipper-templates　・　抽取 defuddle 2026-06-18 HKT，已剝 badge/圖片雜訊。

## Obsidian Web Clipper templates

This is a community collection of templates for the official [Obsidian Web Clipper extension](https://github.com/obsidianmd/obsidian-clipper). We are still under construction.

**Helpful resources**

- What is Obsidian Clipper? [Read about it here](https://obsidian.md/clipper).
- Come chat about Obsidian Web Clipper in the `#obsidian-clipper` channel on the [Obsidian Discord](https://discord.gg/obsidianmd).
- Have an issue with Obsidian Web Clipper? Report it at the [Obsidian Web Clipper GitHub](https://github.com/obsidianmd/obsidian-clipper/issues?q=sort%3Aupdated-desc+is%3Aissue+is%3Aopen).

## Quick start

1. Install the Obsidian Web Clipper extension (Chrome/Firefox/Safari).
2. In the extension, open Templates → “New Template”.
3. Copy JSON from this repo’s `templates/` and paste into your template.
4. Visit a matching site (per the template’s “triggers”), then clip using that template.

Tip: Validate your JSON before saving:

- Windows (PowerShell):
```
Get-Content -Raw .\templates\<file>.json | ConvertFrom-Json > $null
```

## Template catalog (examples)

- `templates/medium-concise-summary-clipper.json`
	Medium articles → concise summary + key points
- `templates/github-releases-clipper.json`
	GitHub Releases markdown body
- `templates/youtube-with-transcript-clipper.json`
	YouTube with transcript extraction

See all templates in `templates/`.

## Template schema (at a glance)

Templates here use this structure:

```
{
  "schemaVersion": "0.1.0",
  "name": "Example",
  "behavior": "create",
  "noteNameFormat": "{{published|date:\"YYYY-MM-DD\"}} EXAMPLE {{title|safe_name}}",
  "path": "webclips",
  "context": "{{selectorHtml:article|markdown|slice:0,8000|trim}}",
  "properties": [{ "name": "Source", "value": "{{url}}", "type": "text" }],
  "triggers": ["https://example.com", "schema:@Article"],
  "noteContentFormat": "# {{title}}\n\n{{context}}"
}
```

Conventions:

- Use `selectorHtml:article` with sensible fallbacks (e.g., `main, .pw-post-body`) and cleanup filters (remove media tags, collapse >2 newlines, strip code fences).
- Include both hostname regex and `schema:@Article` in `triggers` where possible.
- Keep `noteNameFormat` predictable and `path` organized by source.

## Contributing

We welcome new templates and improvements. Read [CONTRIBUTING.md](https://github.com/obsidian-community/web-clipper-templates/blob/main/CONTRIBUTING.md).

PR checklist:

- Valid JSON (lint/validate)
- Accurate `triggers`, robust selectors
- Reasonable `noteNameFormat` and `path`
- Tested on 2+ example pages
- Add notes if special behaviors or caveats apply

## Troubleshooting

- Content missing or “insufficient context”?
	The site DOM may differ. Update `selectorHtml` fallbacks and cleanup filters.
- Site updated and template broke?
	Open an issue with URL + expected output and we’ll adjust selectors.

## Folder structure

- `templates/` — JSON templates (primary)
- `Template-guides/` — How-to guides for specific sites/templates
- `Clipper-guides/` — General clipper walkthroughs
- `Resources/` — Reference docs (selectors, clipper docs)
- `Images/` — Screenshots for guides

## Key Comments

（非社交媒體，原頁無公開留言區 → 不適用。本類 reference source（repo / gist / 官方文件）link-rot 風險低。）
