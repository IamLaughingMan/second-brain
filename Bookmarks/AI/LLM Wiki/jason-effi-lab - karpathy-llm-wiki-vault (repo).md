---
type: bookmark
para: resource
domain: ai-tools
title: "jason-effi-lab / karpathy-llm-wiki-vault"
url: "https://github.com/jason-effi-lab/karpathy-llm-wiki-vault"
summary: "杰森的效率工坊 YouTube 配套 GitHub repo（607★）：一個可下載嘅 Karpathy LLM Wiki Obsidian vault 範本 —— 含 ingest/query/lint 三個 SKILL.md、CLAUDE.md、完整 wiki 結構（concepts/entities/sources/syntheses + index/log）。可直接借鏡 skill 寫法。"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]]"
  - "[[karpathy - LLM Wiki gist]]"
  - "[[skills]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - obsidian
  - karpathy
  - llm-wiki
  - agent-skill
  - github
  - template
---

# jason-effi-lab / karpathy-llm-wiki-vault

- URL: https://github.com/jason-effi-lab/karpathy-llm-wiki-vault
- Repo: 607 ★ ・ 198 forks ・ 建立 2026-04-13 ・ **無 license 聲明** ・ 主分支 main
- Saved date: 2026-06-19
- Topic: Karpathy LLM Wiki Obsidian vault **範本**（ingest/query/lint skill + CLAUDE.md + 完整 wiki）
- Status: active

## Why I saved this

[[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)|杰森條片]]嘅**配套 repo**，亦正係我之前標「可借鏡 skill 化」嗰套嘢嘅真身。本 vault 而家 **project skill = 0**（ingest/query/lint 靠 Claude 手動執行），呢個 repo 有三個寫好嘅 `SKILL.md` 做 concrete reference。已 archive 全文防 link-rot。

## Summary

- **結構**（鏡 Karpathy）：`raw/`（01-articles / 02-papers / 03-transcripts / 09-archive）+ `wiki/`（concepts / entities / sources / syntheses + index.md + log.md）+ `assets/` + `CLAUDE.md` + `.claude/skills/`。
- **三個 skill**（`user-invocable: true`，打 `/ingest` `/query` `/lint`）：
  - **ingest**：raw→編譯成 sources 摘要 + entities/concepts 頁，建雙鏈、更新 index/log，**完成後源檔移去 `raw/09-archive/`**；發現知識衝突即暫停問用戶。
  - **query**：**永遠先讀 `wiki/index.md`** 定位→深讀→雙鏈引用作答；禁止憑記憶答；高價值答案問用戶存唔存做 synthesis。
  - **lint**：掃 wiki/ 查死鏈／孤兒頁／未同步索引／認知衝突，出🩺體檢報告 + 下一步（只報告、待確認先改）。
- **內容範例**：提示詞工程領域（Gemini/Anthropic/Google 白皮書 + 5C Prompt Contracts 論文）。

## My Notes — 對本 vault 嘅借鏡價值

- **直接可參考**：三個 SKILL.md 嘅 frontmatter（`name`/`description`/`user-invocable`）+ 工作流寫法，係本 vault 若要 skill 化 ingest/query/lint 嘅現成藍本。
- **但要適配本 vault convention（唔好照抄）**：
  - repo 用**简体中文** + `type: source/entity/concept/synthesis`；本 vault 用繁體 + 多 type（moc/comparison/resource…）。
  - repo 用 **`raw/09-archive/` 搬檔歸檔**；本 vault **status-over-folder、唔搬檔**（衝突點，要改成標 status）。
  - repo log 格式 `## [YYYY-MM-DD] ingest | …`；本 vault 要 **HKT 時間 + dual-log CSV**（repo 冇）。
  - repo frontmatter `sources:`/`last_updated:`；本 vault 係 `created/updated` + `domain`/`para`。
- **結論**：適合做「skill 化操作」嘅起點藍本，但要改 archive→status、加 HKT/dual-log、轉繁體、對齊 type 詞彙。**無 license** → 借鏡寫法可以，照搬檔案要小心（無授權）。

## Related
- [[杰森的效率工坊 - Karpathy LLM Wiki (Claude Code + Obsidian 進階)]] —— 配套教學影片
- [[karpathy - LLM Wiki gist]] —— 原始理念
- [[skills]] —— 本 vault skills catalog（project skill 現為 0）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — repo 結構 + 三個 SKILL.md 全文（GitHub API + raw fetch 2026-06-19），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：GitHub `jason-effi-lab/karpathy-llm-wiki-vault@main`（API tree + raw README/SKILL.md，2026-06-19 HKT）。

### 檔案樹（top-level）
```
.claude/skills/ingest/SKILL.md
.claude/skills/query/SKILL.md
.claude/skills/lint/SKILL.md
CLAUDE.md
README.md
assets/ (Karpathy LLM Wiki.png, hq720.jpg)
raw/01-articles/ (4 篇：Prompt Engineering 2025 指南、Anthropic prompting best practices、AI Prompt Engineering 2025-2026、Gemini 提示设计策略)
raw/02-papers/ (5C Prompt Contracts.pdf、Google Prompt Engineering whitepaper.pdf)
raw/03-transcripts/ (Prompt Engineering Full Course.md)
raw/09-archive/ (The Complete Prompt Engineering Guide 2025.md)
wiki/index.md, wiki/log.md
wiki/concepts/ (5C_Framework, Chain_of_Thought, Context_Engineering, Few_Shot_Prompting, Prompt_Engineering)
wiki/entities/ (Anthropic, Claude, Gemini, Google)
wiki/sources/ (7 篇摘要-*.md)
wiki/syntheses/ (5c-prompt-markdown-note-taking.md)
```

### README 摘要
LLM Wiki Knowledge Base，基於 Karpathy LLM Wiki 概念嘅 Obsidian vault，將碎片資訊編譯成「結構化、高度互聯嘅知識網絡」。`raw/` 五個子目錄（articles/papers/transcripts/meeting notes/archive）；`wiki/` 五件（index 主目錄字典、log grep-friendly 流水、concepts 第一性原理、entities 人/公司/工具/專案、sources 摘要、syntheses 深研報告）。`.claude/skills/` 含 ingest/query/lint + 兩個 Obsidian-native skill（API 整合 + URL→Markdown）。CLAUDE.md 定全局協定、讀寫權限、schema。透過 Claude Code 或 Claudian plugin 用 `/query` `/ingest` `/lint`。

---

### `.claude/skills/ingest/SKILL.md`（全文）

```markdown
---
name: ingest
description: 将 raw/ 目录下的原始资料编译到 wiki/ 中。处理完成后，将源文件自动移动到 raw/09-archive/ 归档。支持 /ingest (扫描 raw/ 下所有未归档文件) 或 /ingest <path> (处理指定文件)。当用户提到"摄取"、"导入"、"收入"资料，或要求将文件加入知识库时，也应该触发此技能。绝对忽略 raw/09-archive/ 目录。
user-invocable: true
---

# ingest 技能

## 核心工作流：Inbox & Archive
raw/ 是"待处理收件箱"，wiki/ 是"编译输出层"。
目录约定：raw/01-articles（网页剪藏）/ 02-papers（论文PDF）/ 03-transcripts（转录）/ 09-archive（已处理，禁止读取）；wiki/sources（摘要）/ entities（人物公司工具产品）/ concepts（框架方法论理论）。

## 触发逻辑
1. /ingest：扫描 raw/ 所有子目录（排除 09-archive），找待处理文件。
2. /ingest <path>：仅处理指定文件。
3. 隐式触发：用户说"把这个资料摄入知识库"时自动执行。

## 编译流水线（每个源文件严格按序）
步骤1 读取源文件（.md 完整读取；.pdf 尝试提取，失败则记录文件元信息）。
步骤2 提炼核心并翻译：核心主旨（1-2句）、实体（人/公司/工具/产品）、概念（框架/方法论/理论）；非中文则译成中文。
步骤3 在 wiki/sources/ 创建 Markdown（frontmatter: title/type:source/tags/sources/last_updated；## 核心摘要 + ## 关联连接），文件名 kebab-case 摘要-{slug}.md。
步骤4 知识网络化：实体→wiki/entities/，概念→wiki/concepts/；不存在则按 CLAUDE.md Frontmatter 创建，已存在则增量合并，发现冲突立即暂停报告询问。页面模板含 ## 定义 / ## 关键信息 / ## 关联连接。
步骤5 更新全局注册表：index.md（Sources/Entities/Concepts 分类下加 [[页面]] — 主旨）；log.md append-only（## [YYYY-MM-DD] ingest | 简述；变更/冲突）。
步骤6 归档源文件：确认 sources/实体/概念/index/log 全部完成后，将源文件移到 raw/09-archive/。绝对禁止修改源文件文字。

## 冲突处理：暂停→报告→询问（A 保留两者标注知识冲突 / B 新覆盖旧 / C 放弃）→继续。
## 注意：绝不读 09-archive；每页必须有 ## 关联连接（无孤岛）；简体中文；实体 TitleCase，概念/来源 kebab-case。
```

### `.claude/skills/query/SKILL.md`（全文）

```markdown
---
name: query
description: 在本地 Wiki 知识库中回答用户提问。当用户使用 /query 命令、或用自然语言询问"我的笔记/历史决定/过往笔记/知识库"中的内容时调用。必须先读取 wiki/index.md 定位相关页面，再深度阅读，最后以双链引用格式回答。禁止凭模型记忆回答。如果知识库中没有相关内容，必须声明"本地知识库中未找到，以下为通用知识回答"。
user-invocable: true
---

# query 技能
## 核心目标：将提问转化为对本地 Wiki 的深度检索，综合出带明确引用来源的双链回答；高价值时主动固化为知识库一部分。
## 触发：/query <问题>；自然语言问"我的笔记里关于X"、"过去对Y的决策"；提及 wiki/知识库/笔记/记录。
## 降级策略：纯通用知识且 index 无相关 → 声明"本地知识库中未找到相关内容，以下为通用知识回答："

## 检索与综合流水线
步骤1 查阅全局索引：永远第一步读 wiki/index.md，定位 Entities/Concepts/Sources/Syntheses。
步骤2 深度阅读目标文件（最相关页面完整读取）。
步骤3 综合与回答；双链引用规范：引用某页用 [[页面名称]]，整段引用首尾各一次，引用原文用 > 块引用。
步骤4 高价值内容固化：回答超过2段 或 有分析对比/总结性 → 询问是否保存为 synthesis（frontmatter type:synthesis），存到 wiki/syntheses/ 并在 index Syntheses 分类注册。
步骤5 记录操作日志：无论是否生成 synthesis，查询结束在 wiki/log.md 末尾追加 ## [YYYY-MM-DD] query | 简述（输出：引用页面列表或"即时回答未保存"）。

## 强制约束：禁止凭记忆答（必先检索）；禁止过度引用；禁止静默回答（无相关内容必须声明）。
```

### `.claude/skills/lint/SKILL.md`（全文，報告格式段）

```markdown
---
name: lint
description: 知识库全局健康度检查。扫描 wiki/ 目录，检测死链、孤儿页面、未同步索引和知识冲突。当用户输入 /lint、/scan、/health 或要求"检查知识库状态/健康"时调用。
user-invocable: true
---

# lint 技能：知识图谱健康巡检
## 核心目标：将"静态代码分析"引入知识管理，找出死链、孤岛、未同步索引、认知冲突。
## 触发：/lint；"我的知识库健康状况如何"；"检查知识库状态/健康"。
## 路径：用 Glob 动态定位 wiki/。

## 巡检流水线
第1步 索引一致性：读 index.md 全部；扫 wiki/ 所有 .md（排除 index/log）；提取 index 注册的 [[页面]]；比对已注册但文件不存在 OR 文件存在但未注册。
第2步 双向链接健康：扫所有 .md 提取 [[双链]]；指向不存在页面→死链；统计被引用页面（排除 self）；从未被引用→孤儿页面。
第3步 认知冲突审查：全局搜含 ## 知识冲突 的页面；提取冲突描述；统计未解决冲突（认知技术债）。
第4步 收件箱积压（可选跳过，本 skill 仅扫 wiki/）。

## 报告输出（## 🩺 知识库健康体检报告 — YYYY-MM-DD）：
### ✅ 绿灯项 ### ⚠️ 黄灯项（孤儿页面/未同步索引）### ❌ 红灯项（死链/未解决知识冲突）### 🛠️ 下一步行动
```

## Key Comments
（GitHub repo，非社交媒體、原頁無公開留言區 → 不適用。reference source（repo）link-rot 風險低，但已 archive 三個 SKILL.md 全文以防。）
