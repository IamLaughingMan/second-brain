---
type: meta
title: "Wiki Index"
updated: 2026-06-12
---

# Wiki Index

本 wiki 的**純目錄（catalog）**＝查詢入口（每頁 + 一句註，按 `type` 分組）。**混合結構**：meta 與跨領域方法頁平放 `wiki/` 根層，領域內容入領域資料夾（鏡射 MOC hub，如 `Health/Oral/Periodontal Disease/`）。檢索靠本目錄分組＋`[[wikilink]]`（不帶路徑、零斷連），資料夾只是人類瀏覽動線。分組標題對應每頁 frontmatter 的 `type`。更新於每次 ingest。

→ 近期脈絡見 [[hot]]・操作日誌見 [[log]]

> [!note] Overview 採 multi-wiki（per-domain）模式，root 唔保留
> Karpathy 一手 gist 將 **overview** 同 **index** 分開講。本 vault 採用「**root index/log 統管全 vault，overview 落每個 domain hub 入面**」嘅 multi-wiki 拆法。例：[[Health/Oral/Periodontal Disease/overview|Periodontal Disease overview]]。Root 嘅 vault-wide overview 已於 2026-06-17 撤銷（合理 scope 過大）。

## Root hubs（vault-wide MOC）
- [[Inbox]] — 未整理 catch-all，root 級 `Inbox/`（GTD pattern；7 日 triage SLA）
- [[Bookmarks]] — 長期 URL 指標，root 級 `Bookmarks/`（`status` 欄分 active / archived，靠 [[Bookmarks.base]] 嘅 view 篩，不搬檔）
- [[Projects]] → [[AI Arcade]] — 專案領域 hub，root 級 `Projects/`（PARA pattern）

## Maps of Content（領域 hub）
- [[Health]] → [[Oral]] → [[Periodontal Disease]] — 牙周病研究的三層導覽 hub，對應資料夾 `wiki/Health/Oral/Periodontal Disease/`（含全部 20 篇 `domain: periodontal-disease` 頁）
- `Periodontal Disease.base` — 牙周病領域的動態資料表（Obsidian Bases；嵌在 [[Periodontal Disease]] hub 內，靠 `domain` filter 非路徑）

## Concepts
- [[Stage IV Grade C Periodontitis]] — 最嚴重的牙周診斷（2018 分類）
- [[Periodontal Regenerative Therapy]] — EMD/GTR/LANAP 再生附著組織
- [[Full-Arch Dental Implants]] — All-on-4 / zygomatic 選項＋價格
- [[Stem Cell Periodontal Therapy]] — PDLSC/DPSC 細胞再生
- [[Tooth Regeneration Anti-USAG-1]] — 重新長出真牙的抗體

## Entities
- [[Toregem BioPharma]] — 日本生技，世界首個長牙藥
- [[Katsu Takahashi]] — anti-USAG-1 抗體主導研究者

## Sources
- [[2018 Periodontitis Classification]] — Tonetti 2018 分期/分級（high）
- [[Regenerative Therapies in Periodontology 2025]] — MDPI 綜述（high）
- [[Apical 2mm-Sparing Debridement Pulp Vitality Case 2025]] — 保留根尖 2mm＋EMD 再生、5 年保牙髓個案（medium）
- [[TRG-035 Anti-USAG-1 Antibody]] — Toregem 長牙藥（medium）
- [[Allogeneic Dental Pulp Stem Cell RCT 2025]] — Nature STTT 試驗（high）
- [[Global Dental Implant Cost Guide 2025-2026]] — 價格彙整（medium）
- [[EFP Adjunctive Therapy Stage III-IV Periodontitis]] — EFP S3＋aPDT RCT（high）
- [[Asia Dental Implant Cost Guide 2025-2026]] — TW/HK/KR/JP/SG/CN 價格（medium）
- [[Zygomatic vs Grafted Implant Survival Reviews]] — 存活率 meta 分析（high）

## Comparisons
- [[Zygomatic Implants vs Bone Graft Implants]] — 存活、併發症、何時選哪個
- [[Global Dental Implant Price Comparison]] — 總價格表：西方＋亞洲＋醫療旅遊

## Resources
- [[Top Asian Periodontal and Implant Centers]] — 亞洲頂尖機構＋如何找專科醫師
- [[Periodontal Daily Products and Supplements]] — 日常產品、益生菌、補充品：證據＋價格

> [!info] Vault 方法論 reference 已搬離 wiki/
> `Karpathy LLM Wiki Pattern` 由 2026-06-17 起住 `Meta/docs/`（同 [[OBSIDIAN-SETUP]] / [[WIKI]] 一齊做 vault setup 三件套）—— 唔再屬 wiki 嘅 compounding knowledge，係靜態 spec。Wikilink `[[Karpathy LLM Wiki Pattern]]` path-independent，仍然解得到。

## Questions（filed answers）
- [[Research - Severe Periodontitis and Tooth Loss]] — 綜述：嚴重牙周、治療、價格、近未來
- [[Recording Claude Conversations in Obsidian]] — 研究：大家點記錄 Claude 對話（兩派哲學＋GitHub 高星 landscape＋本 vault peer/可補強）`domain: pkm`
