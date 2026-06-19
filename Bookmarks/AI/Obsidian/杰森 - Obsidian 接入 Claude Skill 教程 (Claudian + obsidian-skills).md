---
type: bookmark
para: resource
domain: ai-tools
title: "Obsidian 接入 Claude Skill 教程：CEO亲自下场写的Skill如何使用？"
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

### 1. 核心组件
- **Claudian**: Obsidian 第三方插件（暂未上架官方市场），适配 Claude Code。
- **Obsidian Skills**: 由 Obsidian CEO (Kepano) 发布的 Skill 包，赋予 AI 处理 Canvas、Markdown 及数据库的能力。

### 2. 环境部署流程

#### 2.1 安装 Claudian 插件 (手动旁加载)
1. **获取文件**: 访问 GitHub 仓库 `claudian`，下载三个核心文件。
2. **放置插件**: 进入 Obsidian 仓库根目录 → `.obsidian/plugins/` → 新建文件夹 `claudian` → 将三个文件放入。
3. **启用**: 重启 Obsidian，在"第三方插件"中开启 Claudian。

#### 2.2 配置模型参数
1. 打开 Claudian 设置页。
2. **基础设置**: 设置 `User Name` (如 Jason)。
3. **自定义AI模型**: 使用智谱GLM或DeepSeek来替换Claude模型：
```bash
ANTHROPIC_BASE_URL=https://open.bigmodel.cn/api/anthropic
ANTHROPIC_API_KEY=你的智谱api key
ANTHROPIC_DEFAULT_OPUS_MODEL=GLM-4.6
```
4. **连通性验证**: `Ctrl/Cmd + P` 调出命令面板 → 输入 `claudian` → 选择 `Open chat view` → 发送"你好"，回复正常则成功。

#### 2.3 部署 Obsidian Skills
1. **下载**: 访问 GitHub 仓库 `kepano/obsidian-skills`，下载 ZIP 并解压。
2. **安装**: 复制解压后的 `skills` 文件夹 → 进入 Obsidian 仓库根目录 → 进入或新建 `.claude` 隐藏文件夹 → 粘贴（最终路径 `[Vault Root]/.claude/skills/`）。
3. **验证**: 在 Claudian 对话框输入 `/skills`，应显示三个 Skill：`obsidian-markdown`（专有 Markdown 语法）、`json-canvas`（生成/编辑无限画布）、`obsidian-bases`（数据库管理）。

### 3. 实战应用与技巧

#### 3.1 典型用例：生成知识图谱
- **指令**: "使用无限画布 canvas 画出地中海饮食的知识结构图，并保存到根目录。"
- **流程**: AI 自动调用 `json-canvas` skill → 分析逻辑 → 在根目录直接生成 `.canvas` 文件。

#### 3.2 优化
Skill 定义为英文，中文指令可能导致匹配偏差，建议：
- **显式指令**: 在 Prompt 中明确指定工具名（如"请使用 json-canvas skill…"）。
- **系统提示词**: 在插件设置中添加规则 ——"收到指令后优先思考并匹配最合适的 Skill"。

### 4. 理念解析：Why Local Agent?
- **官方态度 (Stephan Ango/Kepano)**: 选择在个人 GitHub 账号而非 Obsidian 官方账号发布，体现"非官方强制"的定位。核心哲学：知行合一，坚持 **Local-first** 和 **Privacy-first**，不构建封闭的官方 AI 环境，也不参与 AI 军备竞赛。
- **差异化优势**: 不同于 Notion 的云端封闭生态；Obsidian 文件完全本地化，鼓励用户基于隐私安全"手搓"适合自己的 AI Agent。

## Key Comments
（部落格文章，原頁無公開留言區 → 不適用。reference source link-rot 風險中等，已 archive 全文。）
