---
type: meta
title: "Wiki Overview"
status: developing
created: 2026-06-17
updated: 2026-06-17
tags:
  - meta
  - overview
---

# Wiki Overview

> 高層綜述（synthesis）—— 純文 narrative，幫你（同 LLM）一頁睇晒本 vault 嘅當前面貌。Karpathy 一手 gist 將 **overview** 同 **index** 分開講；本 vault 2026-06-17 拆返兩份。**catalog（每頁 + 一句註）見 [[index]]**；呢頁集中講「現況綜述」。

## 主軸

- **領域焦點**：口腔健康，特別係 **[[Periodontal Disease|牙周病]]**（20+ 篇深度 ingested，住 `wiki/Health/Oral/Periodontal Disease/`）
- **方法論**：跟 [[Karpathy LLM Wiki Pattern]]（LLM as compiler、無 RAG、無向量 DB）。本 vault 採 DAIR.ai 4 階段版（**Ingest → Compile → Query → Lint**），Karpathy 原話則係 3 ops（Ingest/Query/Lint）。
- **vault scaffolding**：混合結構 — meta／跨領域方法頁平放 `wiki/` root；領域內容入領域夾（鏡射 MOC hub 階層）

## Root hubs（vault-wide 入口）

- **[[Inbox]]**（GTD capture-first，7 日 triage SLA）
- **[[Bookmarks]]**（status-field archive、深層細分 tree、獨立於 wiki，pointer-stub 跨 folder）
- **[[Projects]]**（PARA-style，`para: project` 鏡頭）
- **[[Health]] → [[Oral Health]] → [[Periodontal Disease]]**（領域三層導航）

## 已 ingest 主題（high-density）

- **牙周病診斷 / 分期分級**：2018 Tonetti 分類、Stage IV Grade C
- **牙周再生治療**：EMD/GTR/LANAP、aPDT、EFP S3 指南
- **缺牙重建**：All-on-4、zygomatic implant、Asia/Global cost guide
- **未來治療**：Toregem TRG-035 anti-USAG-1 抗體（長真牙）、PDLSC/DPSC 細胞療法

## Synthesis（跨頁綜合）

- 目前累積足夠 evidence 做**亞洲牙周 + 缺牙重建嘅決策支援**（價格、診所、治療選擇）
- **新興方向**（未到臨床、但已 ingest）：anti-USAG-1（重新長牙）、allogeneic stem cell（再生 PDL）—— 屬 medium-term horizon（5–10 年）
- 仍有空白：口腔黏膜病、矯正、蛀牙預防 —— 未來 ingest 補

## 操作快取

- 最近 ingest／lint／decisions 見 [[log]]
- 近期脈絡（~500 字）見 [[hot]]

## 跨領域 meta／方法頁

- [[Karpathy LLM Wiki Pattern]] — vault 嘅 foundational methodology
- [[OBSIDIAN-SETUP]] — 完整建置藍圖（Karpathy + kepano + Layout sources audit）
