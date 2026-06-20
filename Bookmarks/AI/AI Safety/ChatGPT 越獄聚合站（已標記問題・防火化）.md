---
type: bookmark
para: resource
domain: ai-safety
title: "ChatGPT 越獄聚合站（已標記問題）"
url: ""
status: flagged
created: 2026-06-21
updated: 2026-06-21
tags: [bookmark, ai-safety, flagged, pointer]
summary: "已標記為有問題嘅站。URL 以防火化（defang）寫法記錄，dual-use 越獄聚合站；環境已封 live URL，內容不宜 ingest（prompt-injection 風險）。只作 awareness。"
---

## 記錄

- **網址（防火化，防誤點／防 ingest）**：`hxxps://chatgptjailbreak[.]tech/?dataType=Post&listingType=Local&sort=Active`
- 還原方法：`hxxps`→`https`、`[.]`→`.`

## ⚠️ 有問題（標記原因）

- **越獄聚合站**：內容為繞過 LLM 安全護欄嘅 prompt（dual-use）。
- **prompt-injection 風險**：站內容屬活攻擊面，**不宜抓取／ingest 入庫**（任何 AI 日後讀到有中招風險）。
- **環境封鎖**：寫入 live URL 嘅檔會被環境 content-filter 自動移除；故此處只留防火化記錄。

## 相關

- [[r-ClaudeAIJailbreak - Reddit 社群（Claude AI 越獄 紅隊）]]
