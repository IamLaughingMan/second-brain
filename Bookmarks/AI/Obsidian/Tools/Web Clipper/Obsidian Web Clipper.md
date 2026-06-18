---
type: bookmark
para: resource
domain: pkm
title: "Obsidian Web Clipper"
url: "https://obsidian.md/help/web-clipper/templates"
summary: "官方瀏覽器擴充，一鍵 clip 網頁→vault markdown，trigger 按站自動分流（自動 bookmark 正路）"
status: active
created: 2026-06-17
updated: 2026-06-18
related:
  - "[[Bookmarks]]"
tags:
  - bookmark
  - found-by-claude
  - pkm
  - obsidian
  - web-clipper
  - automation
---

# Obsidian Web Clipper

- URL: https://obsidian.md/help/web-clipper/templates
- Saved date: 2026-06-17
- Topic: 官方瀏覽器擴充,一鍵 clip 網頁 → vault markdown(自動 bookmark 嘅正路)
- Status: active

## Why I saved this

研究「自動 bookmark」時 Claude 搵到嘅主力工具。官方、local-first、kepano 推薦,而且 template trigger 機制啱晒本 vault 嘅 by-domain 方案(按站自動分流去 domain 夾)。

## Summary

- **Template triggers**:按 URL prefix / regex / schema.org 自動揀 template。
- **Destination**:每 template 可設目標夾(create new / append / daily note)。
- **Frontmatter**:靠 `{{title}}`／`{{url}}`／`{{date}}`／`{{author}}` 等變數 + selector 自動填 properties。
- **Capture**:全文或選段,自動抽 title/author/date/url。

## My Notes

下一步可整一個「Bookmark」template:寫死 `type: bookmark`／`status: active`／`para: resource`,trigger 按站分流(如 github.com → AI 夾)。

## Related
- [[kepano - Obsidian Web Clipper]]
- [[Obsidian Community Web Clipper Templates]]
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-18），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://obsidian.md/help/web-clipper/templates　・　抽取 defuddle 2026-06-18 HKT，已剝 badge/圖片雜訊。

[[Introduction to Obsidian Web Clipper|Web Clipper]] allows you to create templates that automatically capture and organize metadata from web pages. Example templates are available in the [clipper-templates repo](https://github.com/kepano/clipper-templates).

## Create or edit a template

To **create** a template go to Web Clipper settings and click the **New template** button in the sidebar. You can also **duplicate** a template in the **More** actions menu in the top right corner.

To **edit** a template choose a template from the sidebar. Your changes will be saved automatically.

Templates make use of [[Variables]] and [[Filters]], which allow you to tailor how content will be saved.

## Import and export Web Clipper templates

To import a template:

1. Open the extension and click the **[[Settings]]** cog icon.
2. Go to any template in the list.
3. Click **Import** in the top right or drag and drop your `.json` template file(s) anywhere in the template area.

To export a template click **Export** in the top right. This will download the template `.json` file. You can also copy the template data to your clipboard via the **More** menu.

## Template settings

### Behavior

Define how content from Web Clipper will be added to Obsidian:

- **Create a new note**
- **Add to an existing note**, at the top or bottom
- **Add to daily note**, at the top or bottom (requires the [[daily notes]] plugin to be active)

### Automatically trigger a template

Template triggers allow you to automatically select a template based on the current page URL or [schema.org](https://schema.org/) data. You can define multiple rules for each template, separated by a new line.

The first match in your template list determines which template is used. You can drag templates up and down in Web Clipper settings to change the order in which templates are matched.

#### Simple URL matching

Simple matching triggers a template if the current page URL *starts with* the given pattern. For example:

- `https://obsidian.md` will match any URL that starts with this text.

#### Regular expression matching

You can trigger templates based on more complex URL patterns using regular expressions. Enclose your regex pattern in forward slashes (`/`). Remember to escape special characters in regex patterns (like `.` and `/`) with a backslash (`\`). For example:

- `/^https:\/\/www\.imdb\.com\/title\/tt\d+\/reference\/?$/` will match any IMDB reference page.

#### Schema.org matching

You can trigger templates based on [schema.org](https://schema.org/) data present on the page. Use the `schema:` prefix followed by the schema key you want to match. You can optionally specify an expected value. For example:

- `schema:@Recipe` will match pages where the schema type is "Recipe".
- `schema:@Recipe.name` will match pages where `@Recipe.name` is present.
- `schema:@Recipe.name=Cookie` will match pages where `@Recipe.name` is "Cookie".

Schema.org values can also be used to [[Variables#Schema.org variables|pre-populate data in templates]].

### Interpreter context

When [[Interpreter|Interpreter]] is enabled, you can use [[Variables#Prompt variables|prompt variables]] to extract page content with natural language. For each template you can define the [[Interpreter#Context|context]] that Interpreter has access too.

## Key Comments

（非社交媒體，原頁無公開留言區 → 不適用。本類 reference source（repo / gist / 官方文件）link-rot 風險低。）
