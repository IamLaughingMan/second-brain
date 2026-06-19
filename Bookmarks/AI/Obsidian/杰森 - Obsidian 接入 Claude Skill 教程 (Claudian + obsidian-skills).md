---
type: bookmark
para: resource
domain: ai-tools
title: "Obsidian 接入 Claude Skill 教程：CEO親自下場寫的Skill如何使用？"
url: "https://jasonai.me/blog/obsidian-ceo-claude-skill-tutorial/"
author: "Jason（杰森的效率工坊）"
published: 2026-01-16
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]]"
  - "[[skills]]"
  - "[[plugins]]"
tags:
  - bookmark
  - ai-tools
  - obsidian
  - claude-code
  - claudian
  - obsidian-skills
  - kepano
  - tutorial
---

# Obsidian 接入 Claude Skill 教程：CEO 親自下場寫的 Skill 如何使用？

- URL: https://jasonai.me/blog/obsidian-ceo-claude-skill-tutorial/
- Author: Jason（杰森的效率工坊，同 [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)|LLM Wiki 影片]]同一人）
- Published: 2026-01-16
- Saved date: 2026-06-19
- Topic: 喺 Obsidian 內用 **Claudian 插件** + **kepano `obsidian-skills`** 接 Claude Code
- Status: active

## Why I saved this

同一個 Jason 嘅部落格教學，講點喺 **Obsidian 內**接 Claude（Claudian 插件）+ 裝 **kepano `obsidian-skills`**（即本 vault 用緊嗰個 skill 包）。對本 vault 嘅價值喺**對照路線**：本 vault **唔用 Claudian**（用 Claude Code CLI + native hook），但**用緊同一套 obsidian-skills**。文中仲有「用 GLM-4.6 / DeepSeek 經 `ANTHROPIC_BASE_URL` override 換走 Claude model」嘅技巧，同 kepano local-first 理念解析，值得留。

## Summary

- **兩個核心組件**：① **Claudian** —— Obsidian 第三方插件（未上架官方市場），喺 Obsidian 內適配 Claude Code。② **obsidian-skills** —— Obsidian CEO Kepano（Stephan Ango）發佈嘅 skill 包（`obsidian-markdown` / `json-canvas` / `obsidian-bases`）。
- **裝 Claudian**（手動 sideload）：GitHub `claudian` repo 下載 3 個核心檔 → 放 `.obsidian/plugins/claudian/` → 重啟啟用。
- **換 model**（可選）：Claudian 設定 `ANTHROPIC_BASE_URL` 指向智譜/DeepSeek，用 `GLM-4.6` 等替 Claude。
- **裝 skills**：`kepano/obsidian-skills` ZIP → `skills/` 放入 `[Vault]/.claude/skills/` → Claudian 對話框打 `/skills` 驗證。
- **實戰**：叫 AI「用 canvas 畫地中海飲食知識結構圖存根目錄」→ 自動調 `json-canvas` skill 生成 `.canvas`。
- **優化**：skill 定義係英文，中文指令易 match 偏 → 顯式指定工具名 或 加 system prompt「優先思考匹配最合適 Skill」。
- **理念**：Kepano 揀喺**個人** GitHub 而非官方帳號發佈 = 非官方強制；堅持 **Local-first / Privacy-first**，唔建封閉官方 AI 環境、唔參與 AI 軍備競賽（vs Notion 雲端封閉）。

## My Notes

- **路線對照（重要）**：本 vault **唔行 Claudian** —— 早前移除 `AgriciDaniel/claude-obsidian` plugin（永久 ban，見 [[plugins]] 歷史），改用 **Claude Code CLI 直駁 + native PostToolUse hook**。但文中第二半（kepano obsidian-skills）**正是本 vault 採用嘅**（user-level enable，見 [[skills]]）。⇒ 呢篇 = 「Obsidian 內嵌 agent」路線，本 vault = 「CLI-first」路線，兩條都用 kepano skills。
- **可留意技巧**：`ANTHROPIC_BASE_URL` override 換 model（GLM/DeepSeek）—— 若日後想試非 Claude model 跑 vault 操作可參考（但本 vault 預設 Opus）。
- 注意文中 `obsidian-skills` 講係 3 個 skill（markdown/canvas/bases），實際 kepano 包有 5 個（仲有 `defuddle`、`obsidian-cli`，見本 vault [[skills]]）—— 文章寫於 2026-01，版本較舊。

## Related
- [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] —— 同作者 LLM Wiki 影片
- [[skills]] —— 本 vault 用緊 kepano obsidian-skills
- [[plugins]] —— Claudian / claude-obsidian 路線（本 vault 唔用）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文 snapshot（defuddle 2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://jasonai.me/blog/obsidian-ceo-claude-skill-tutorial/　・　defuddle 抽取 2026-06-19 HKT，已去站點雜訊。原文簡體中文。

## Obsidian AI Agent 配置指南：Claudian + Obsidian Skills

### 1. 核心組件
- **Claudian**: Obsidian 第三方插件（暫未上架官方市場），適配 Claude Code。
- **Obsidian Skills**: 由 Obsidian CEO (Kepano) 發佈的 Skill 包，賦予 AI 處理 Canvas、Markdown 及數據庫的能力。

### 2. 環境部署流程

#### 2.1 安裝 Claudian 插件 (手動旁加載)
1. **獲取文件**: 訪問 GitHub 倉庫 `claudian`，下載三個核心文件。
2. **放置插件**: 進入 Obsidian 倉庫根目錄 → `.obsidian/plugins/` → 新建文件夾 `claudian` → 將三個文件放入。
3. **啓用**: 重啓 Obsidian，在"第三方插件"中開啓 Claudian。

#### 2.2 配置模型參數
1. 打開 Claudian 設置頁。
2. **基礎設置**: 設置 `User Name` (如 Jason)。
3. **自定義AI模型**: 使用智譜GLM或DeepSeek來替換Claude模型：
```bash
ANTHROPIC_BASE_URL=https://open.bigmodel.cn/api/anthropic
ANTHROPIC_API_KEY=你的智譜api key
ANTHROPIC_DEFAULT_OPUS_MODEL=GLM-4.6
```
4. **連通性驗證**: `Ctrl/Cmd + P` 調出命令面板 → 輸入 `claudian` → 選擇 `Open chat view` → 發送"你好"，回覆正常則成功。

#### 2.3 部署 Obsidian Skills
1. **下載**: 訪問 GitHub 倉庫 `kepano/obsidian-skills`，下載 ZIP 並解壓。
2. **安裝**: 複製解壓後的 `skills` 文件夾 → 進入 Obsidian 倉庫根目錄 → 進入或新建 `.claude` 隱藏文件夾 → 粘貼（最終路徑 `[Vault Root]/.claude/skills/`）。
3. **驗證**: 在 Claudian 對話框輸入 `/skills`，應顯示三個 Skill：`obsidian-markdown`（專有 Markdown 語法）、`json-canvas`（生成/編輯無限畫布）、`obsidian-bases`（數據庫管理）。

### 3. 實戰應用與技巧

#### 3.1 典型用例：生成知識圖譜
- **指令**: "使用無限畫布 canvas 畫出地中海飲食的知識結構圖，並保存到根目錄。"
- **流程**: AI 自動調用 `json-canvas` skill → 分析邏輯 → 在根目錄直接生成 `.canvas` 文件。

#### 3.2 優化
Skill 定義為英文，中文指令可能導致匹配偏差，建議：
- **顯式指令**: 在 Prompt 中明確指定工具名（如"請使用 json-canvas skill…"）。
- **系統提示詞**: 在插件設置中添加規則 ——"收到指令後優先思考並匹配最合適的 Skill"。

### 4. 理念解析：Why Local Agent?
- **官方態度 (Stephan Ango/Kepano)**: 選擇在個人 GitHub 賬號而非 Obsidian 官方賬號發佈，體現"非官方強制"的定位。核心哲學：知行合一，堅持 **Local-first** 和 **Privacy-first**，不構建封閉的官方 AI 環境，也不參與 AI 軍備競賽。
- **差異化優勢**: 不同於 Notion 的雲端封閉生態；Obsidian 文件完全本地化，鼓勵用户基於隱私安全"手搓"適合自己的 AI Agent。

## Key Comments
（部落格文章，原頁無公開留言區 → 不適用。reference source link-rot 風險中等，已 archive 全文。）
