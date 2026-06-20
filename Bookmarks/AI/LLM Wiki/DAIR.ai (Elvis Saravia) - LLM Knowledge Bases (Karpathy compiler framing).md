---
type: bookmark
para: resource
domain: ai-tools
title: "LLM Knowledge Bases (Karpathy's approach) — DAIR.AI"
url: "https://academy.dair.ai/blog/llm-knowledge-bases-karpathy"
author: "DAIR.AI Academy（Elvis Saravia）"
published: "2026-04-03"
status: active
created: 2026-06-21
updated: 2026-06-21
related:
  - "[[Karpathy LLM Wiki Pattern]]"
  - "[[karpathy - LLM Wiki gist]]"
  - "[[LLM Wiki]]"
tags: [bookmark, llm-wiki, karpathy, knowledge-base, ai-tools, compiler]
summary: "DAIR.AI（Elvis Saravia）英文解說——Karpathy LLM 知識庫模式：LLM 當 compiler（非 RAG/向量庫）、markdown wiki 本身即知識庫，拆成 4 階段 Ingest→Compile→Query&Enhance→Lint&Maintain。本 vault spec 嘅『D 層』一手出處（compiler 比喻＋4 階段 framing 源自此文）。"
---

## Summary

DAIR.AI Academy（**Elvis Saravia**）嘅英文解說文，拆解 Karpathy LLM 知識庫模式。**呢篇喺本 vault 嘅 `Karpathy LLM Wiki Pattern` spec 入面被標為「D 層」一手出處** —— 「LLM 當 **compiler**（唔當 retriever）」嘅一句式 framing、同 4 階段迴圈（Karpathy 原 gist 只有 3 ops）都係由呢篇 distill 出嚟。文末作者仲示範自己用 `qmd` CLI + MCP 做 paper indexing 嘅實作。

## Key Takeaways

- **Core idea**：LLM 當 **compiler** 讀 raw → 產出結構化互連 wiki；**wiki 本身即知識庫**，個人規模唔需要 embeddings／向量搜尋
- **4 階段**：Phase 1 Ingest → Phase 2 Compile → Phase 3 Query and Enhance → Phase 4 Lint and Maintain（＝本 vault 採用嘅 4 階段版本，比 Karpathy 原 3 ops 多拆出「Compile」）
- **Why this works**：維護成本（bookkeeping）對 LLM 趨近零 → wiki 長期保持健康
- **What's Next**：用 wiki 生 synthetic training data 去 fine-tune
- **作者自身實作（My Approach）**：agent-powered research indexing —— 用 [`qmd` CLI](https://github.com/tobi/qmd)（本地 markdown 語義搜尋）index 數百篇論文，再餵入 MCP interactive artifact generator 生成可互動視覺化

## My Notes

⭐ **本 vault spec 嘅一手依據之一**。`[[Karpathy LLM Wiki Pattern]]` 嘅 K/D/V 出處分層入面，「**D = DAIR.ai 解說**」就係指呢篇：compiler 比喻、4 階段框架、「no vector DB at personal scale」嘅明確 phrasing 都源自此。即係 spec 已經吸收咗呢篇精華，本 bookmark 係**回溯一手英文出處**用。

同 cluster 對照：[[karpathy - LLM Wiki gist]] = Karpathy 一手原文（3 ops）；**本篇（DAIR.ai）= 權威英文解說（4 階段 + compiler framing）**；中文側有鉅亨／bnext。作者 Elvis 嘅 `qmd` paper-indexing 實作係額外彩蛋（CLI 工具方向）。

## Related

- [[Karpathy LLM Wiki Pattern]] — 本 vault 方法論 spec（本篇＝其「D 層」出處）
- [[karpathy - LLM Wiki gist]] — Karpathy 英文一手 gist
- [[LLM Wiki]] — 本夾 cluster hub
- `qmd` CLI（文中提及）：<https://github.com/tobi/qmd>

<!-- ===== ARCHIVE BELOW — full article, not for quick scanning ===== -->

## Full Content (archived)

> 來源：`academy.dair.ai`（defuddle 抽取）。英文原文，無需 s2hk。已清：互動 diagram 嘅 `<iframe>` 嵌入（原文喺 Core Idea 前有個 hover 互動圖，存檔保留唔到）、首行 tag 湯、文末 newsletter 訂閱 widget。

Andrej Karpathy recently shared his approach to building personal knowledge bases powered by LLMs. It's a surprisingly practical system that doesn't rely on complex RAG pipelines or vector databases - instead, it uses a structured markdown wiki that an LLM incrementally compiles and maintains.

I put together an interactive diagram that breaks down the full architecture of Karpathy's approach. Hover over each component for details.

## The Core Idea

Instead of building a traditional RAG system, Karpathy's approach treats the LLM as a **compiler** that reads raw source documents and produces a structured, interlinked wiki. The wiki itself becomes the knowledge base - no embeddings or vector search needed at the scale of a personal knowledge base.

The system has four phases that cycle continuously:

## Phase 1: Ingest

Raw data flows in from multiple sources:

- **Obsidian Web Clipper** converts web articles into clean `.md` files with locally downloaded images
- **Papers and repos** from arXiv, GitHub, and datasets get collected into a `raw/` staging directory
- Everything lands in `raw/` first - the LLM reads from here

## Phase 2: Compile

The LLM incrementally reads `raw/` and builds a structured wiki:

- **Index files** with brief summaries of all documents - these serve as the entry point for queries
- **Concept articles** (~100 articles, ~400K words) organized by topic with backlinks and cross-references
- **Derived outputs** like Marp slide decks, matplotlib charts, and filed-back query answers
- The LLM auto-maintains the **link graph** between concepts, finding connections for new article candidates

## Phase 3: Query and Enhance

This is where the knowledge base becomes useful:

- **Obsidian IDE** for browsing the wiki and visualizations
- **Q&A Agent** for complex research questions across articles - answers get rendered as markdown, slides, or charts
- **Search Engine** - a vibe-coded naive search over the wiki, usable via web UI or as a CLI tool for the LLM
- Critically, outputs from queries get **filed back into the wiki**, so every exploration adds up

## Phase 4: Lint and Maintain

The LLM performs health checks on the wiki:

- Scans for inconsistent data
- Imputes missing information via web search
- Finds connections between concepts that could become new articles
- Suggests further questions to explore

After linting, the cycle returns to Phase 2 - the wiki keeps growing and improving.

## Why This Works

A few things stand out about this approach:

1. **No vector database needed** - at personal knowledge base scale (~100 articles), the index files + LLM context window are sufficient for retrieval
2. **Explorations always add up** - every query, chart, and answer gets filed back into the wiki
3. **The LLM does the writing** - you rarely edit the wiki manually; the LLM compiles, links, and maintains it
4. **Incremental compilation** - new raw data gets integrated into the existing wiki structure, not reprocessed from scratch

## What's Next

Karpathy mentions a future direction: using the wiki to generate **synthetic training data** and fine-tune an LLM so it "knows" the data in its weights rather than just through context windows. That would turn a personal knowledge base into a personalized model.

## Try It Yourself

The tools needed are straightforward:

- **Obsidian** as the IDE and file viewer
- **Obsidian Web Clipper** for ingesting articles
- Any LLM with a large enough context window for compilation
- A markdown directory structure as the wiki

The key insight isn't the tooling - it's the workflow pattern of having an LLM incrementally compile and maintain a structured knowledge base from raw sources, with every interaction feeding back into the system.

## My Approach: Agent-Powered Research Indexing

I've been building a similar personal knowledge base for my own agents. Like Karpathy, I use Obsidian for my markdown vaults. Where my approach differs is in the ingestion layer - I curate research papers daily and have tuned a Skill over months to find high-signal, relevant papers automatically. What started as manual review and curation is now fully automated, and it's gotten remarkably good at capturing the best of the best.

The papers are indexed using the [qmd CLI tool](https://github.com/tobi/qmd) - all in markdown files with useful metadata. It's excellent for semantic search and surfacing insights across hundreds of papers in ways that nothing else out there can match.

I then feed this indexed knowledge base into an interactive artifact generator built with MCP tools inside my agent orchestrator. The result is hundreds of papers with all sorts of insights visualized and explorable. The visual artifacts are interactive and can be changed dynamically - different views, different interactions, different data thrown at them on demand. It feels like the most personalized research system I've ever built, and it's not even close.

The knowledge that the agents surface from this setup is already extremely useful as I experiment with new agentic engineering concepts. The research is only as good as the research questions, and the research questions are only as good as the insights the agents have access to. Where I'm spending time now is on how to make this more actionable - the automations and research loops are easier to build but are only as good as what you feed them. Work in progress.

---

*Want to go deeper on this topic? Join our free virtual event **[Building LLM Knowledge Bases](https://academy.dair.ai/events/cmnivyzyp001n04k1rnozju2n)** on April 29 - we'll walk through the methodology, tools, and best practices for building effective knowledge bases for your AI agents. [Register here](https://academy.dair.ai/events/cmnivyzyp001n04k1rnozju2n).*

## Key Comments

不適用／未抓取（DAIR.ai blog 無公開留言區）。
