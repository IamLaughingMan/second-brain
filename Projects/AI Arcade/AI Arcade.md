---
type: project
para: project
domain: projects
title: "AI Arcade"
status: active
created: 2026-06-07
updated: 2026-06-12
code_path: "~/AI/Claude/ai-arcade-2026-06-07"
tags:
  - project
related:
  - "[[Projects]]"
---

# Project: AI Arcade

← [[Projects]]

## Goal
Mobile-first 嘅趣味 AI 工具集(BoredHumans.com 啟發),由 5 個純 JS 工具起步,日後易加 Claude/OpenAI 工具。

## Background
靈感來自 BoredHumans。設計上一開始就分前後端,等之後加 AI 時 API key 可以收喺 server side,唔使重寫。

## Current Status
**v1 完成**(2026-06-07):5 個工具 build 好、`git init`、`npm install` 完成。本機 only,**未有 git remote、未部署**。最後 commit `35655ad`。

## Key Decisions
- **Node.js(Express)over PHP / 純 HTML-JS** — 純 HTML/JS 會喺 browser 露 API key;Node 收喺 server,又同前端同語言,易加 AI route。
- **v1 5 個工具、零 API key** — 全部用 preloaded data,零成本、ship 得快(Magic 8-Ball、Would You Rather、Fortune Cookie、Personality Quiz、Random Fact)。
- **Mobile-first、Vanilla JS 無 framework** — target 用戶喺手機;React/Vue 加 bundle,工具站用 vanilla 更快。
> 完整決策原文留 repo `decisions.md`。

## Important Links
- Repo(本機):`~/AI/Claude/ai-arcade-2026-06-07`
- Hosting target(未做):Render / Railway free tier

## Stack
HTML/CSS/vanilla JS 前端 · Node.js(Express)後端 · 一工具一 folder(`public/tools/`)· `routes/` 留俾未來 AI API。

## Open Questions
- [ ] 揀 Render 定 Railway 部署?
- [ ] 第一個加 AI 嘅工具係邊個?

## Next Actions
- [ ] 開 git remote(GitHub)
- [ ] 部署 v1 上 free tier
- [ ] 加 `.env` + 第一條 AI route

## Outputs Worth Keeping
_(暫無)_

## Log
- 2026-06-12：建立 vault project 頁,連接 repo(Model B);抽 v1 決策與現狀精華。
