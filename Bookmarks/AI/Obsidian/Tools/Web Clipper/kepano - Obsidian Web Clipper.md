---
type: bookmark
para: resource
domain: pkm
title: "kepano - Obsidian Web Clipper"
url: "https://stephango.com/obsidian-web-clipper"
summary: "Obsidian CEO kepano 講 Web Clipper local-first 哲學同分類型 template 例（大神 bucket 出處）"
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
  - kepano
---

# kepano - Obsidian Web Clipper

- URL: https://stephango.com/obsidian-web-clipper
- Saved date: 2026-06-17
- Topic: Steph Ango (kepano, Obsidian CEO) 講 Web Clipper 哲學 + template 例
- Status: active

## Why I saved this

大神 bucket 出處。kepano 主張 **local-first**(內容存本機、唔靠外部服務),提供唔同內容類型 template(電影/書/recipe/arXiv),示範點按需 tailor capture。研究自動 bookmark 時引用嘅權威來源。

## Key Takeaways

- 預設 bookmarklet 一 click = 由文章主體開一個新 Obsidian 檔。
- 圖片:external link 慳空間但要上網;想離線用 Local Images plugin。
- 哲學偏 accessibility 多過 complex automation(提供 extension + bookmarklet 兩路)。

## Related
- [[Obsidian Web Clipper]]
- [[Karpathy LLM Wiki Pattern]]
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-18），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://stephango.com/obsidian-web-clipper　・　抽取 defuddle 2026-06-18 HKT，已剝 badge/圖片雜訊。

## Browser extension (2024)

Web Clipper is an [open source](https://github.com/obsidianmd/obsidian-clipper) browser extension that saves articles and pages from the web as Markdown files in [Obsidian](https://stephango.com/obsidian).

### Get the extension

- [For Chrome](https://chromewebstore.google.com/detail/obsidian-web-clipper/cnjifjpddelmedmihgijeibhnjfabmlf), Brave, Edge, Arc, Orion, and other Chromium-based browsers.
- [For Firefox](https://addons.mozilla.org/en-US/firefox/addon/web-clipper-obsidian/) and Firefox Mobile.
- [For Safari](https://apps.apple.com/us/app/obsidian-web-clipper/id6720708363) on macOS, iOS, and iPadOS.

### Clipper templates

Web Clipper makes it easy extract metadata and content from pages using templates. For example, you can save movies, books, recipes, and places to Obsidian.

I created templates that work with my [personal vault](https://stephango.com/vault). You can [download them](https://github.com/kepano/clipper-templates/archive/refs/heads/main.zip) or look at the code on [GitHub](https://github.com/kepano/clipper-templates). I made templates for IMDB, Letterboxd, Goodreads, arXiv, YouTube, and more. They provide useful examples of the syntax [documented here](https://github.com/obsidianmd/obsidian-clipper).

---

## Bookmarklet (2021)

I originally created Obsidian Web Clipper as a bookmarklet in 2021. The bookmarklet is still available below for archival purposes, or if you prefer not to install browser extensions.

Bookmarklets are powerful bookmarks that allow you to run scripts within web pages. However they do come with limitations. They’re harder to customize, and some websites block the execution of remote scripts. The browser extension solves some of these issues, but may not be necessary for your use case.

### Demo

### Installation

Drag the “Clip in Obsidian” link below into your bookmarks. Then click the bookmark to clip the page. This will clip the page to your currently open vault and insert metadata about the article.

Clip in Obsidian

### Usage

By default, clicking the bookmarklet creates a new Obsidian file from the main body of the article, similar to Readability view. Alternatively you can choose to create a file from a selection, by either selecting all (`CMD+A`), or just a portion of the page.

### Downloading images for offline use

Any images in the content will be embedded as external references. This reduces storage in your vault but has two downsides: first, you need to be online to see the images, and second, those images will no longer resolve if the images are removed from the site.

If you want to download images locally you can use the [Local Images plugin](https://github.com/aleksey-rezvov/obsidian-local-images) which will download the images and save them to your vault so they are always accessible.

### Customization

If you want to customize the file path and template for your clippings, you will need to edit [the source code](https://gist.github.com/kepano/90c05f162c37cf730abb8ff027987ca3).

Optional variables can be found at the top of the code, and the template at the bottom. If you make changes I recommend using [Bookmarklet Maker](https://caiorss.github.io/bookmarklet-maker/) to minify and URI-encode the bookmarklet.

### Troubleshooting

This bookmarklet may not work on all websites and browsers. You can troubleshoot issues by opening the Developer Console in your browser and checking if any errors appear when you click the bookmarklet.

The most common error is that a website or the browser itself is blocking third party code execution. This is commonly due to the `connect-src` Content Security Policy (CSP) used by some websites.

## Key Comments

（非社交媒體，原頁無公開留言區 → 不適用。本類 reference source（repo / gist / 官方文件）link-rot 風險低。）
