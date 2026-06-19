---
type: bookmark
para: resource
domain: ai-tools
title: "Claude Code 最佳实践全攻略：Karpathy Skills + claude-mem + Best Practice 三件套"
url: "https://zhuanlan.zhihu.com/p/2027705686390313096"
author: "柒星栈（知乎）"
status: active
created: 2026-06-19
updated: 2026-06-19
related:
  - "[[雷蒙 Lifehacker - Claude Code 學習資源 hub]]"
  - "[[hooks]]"
  - "[[skills]]"
tags:
  - bookmark
  - ai-tools
  - claude-code
  - karpathy
  - claude-mem
  - best-practice
  - hooks
  - subagents
---

# Claude Code 最佳实践三件套（Karpathy Skills + claude-mem + Best Practice）

- URL: https://zhuanlan.zhihu.com/p/2027705686390313096
- Author: 柒星栈（知乎）・ 17 赞同
- Saved date: 2026-06-19
- Topic: 三個 GitHub 開源項目（合計 10 萬+★）組成嘅 Claude Code 效率體系
- Status: active
- **抓取備註**：知乎封自動抓取（defuddle / WebFetch / curl 全部 403，login + anti-bot），**全文由使用者登入後 paste 提供**（非 Claude 自動抓）。

## Why I saved this

呢篇直接講到本 vault／本機 setup 嘅**根**：`andrej-karpathy-skills`（Forrest Chang，13.7K★）**正正係你 `~/.claude/CLAUDE.md` 嗰四原則**（Think Before Coding / Simplicity First / Surgical Changes / Goal-Driven Execution）。文章把佢同 `claude-mem`（記憶）+ `claude-code-best-practice`（配置體系，已喺 [[雷蒙 Lifehacker - Claude Code 學習資源 hub|雷蒙 hub]] 出現）三件套串埋講。對照本 vault 已有/未有嘅機制好有用。

## Summary（三件套）

| 項目 | ★ | 解決 | 角色 |
|------|----|------|------|
| **andrej-karpathy-skills**（forrestchang）| 13.7K | 行為失控（過度工程/亂加依賴/自信犯錯）| 行為校準器 = 一個 CLAUDE.md + 四原則 |
| **claude-mem**（thedotmack）| 46.1K | Claude「失憶症」每次 session 清零 | 記憶系統（語義壓縮存 SQLite，三層檢索）|
| **claude-code-best-practice**（shanraisshan）| 42.3K | 配置散亂 | 生產級配置藍圖（L1-L4 分層）|

## Key Takeaways

**Karpathy 四原則**（= 你 `~/.claude/CLAUDE.md`）：① Think Before Coding（先用自然語言講點做+點解，你睇完先動手）② Simplicity First（3 行唔寫 30 行、用現有工具、唔搞 design pattern；作者實測碼量 -40%）③ Surgical Changes（只改該改、唔順手「優化」周邊）④ Goal-Driven Execution（持續對齊目標、偏離即停問）。局限：寫畀 solo engineer，缺「做啱嘢」（PM/創辦人最貴失敗係做錯功能）。

**claude-mem**：session 開始注入最近 10 次 context → 工具執行自動捕獲 → Claude Agent SDK 語義壓縮成結構化觀察存 SQLite → session 結束生成總結。**三層檢索**（會話摘要層自動注入／語義搜尋層按需 `claude-mem://` URI／資料夾 context 層自動生成 CLAUDE.md）。省 ~2250 token/session。有多機 SSH 同步、雙標籤隱私（標 private 唔注入，處理 .env/密鑰用）。裝：`npx claude-mem install`。

**best-practice 四層配置體系**：
- **L1 CLAUDE.md**（項目記憶，**建議性**）：技術棧/命名/目錄，**控制 <150 條指令**
- **L2 Skills**（可複用工作流，自動觸發）
- **L3 Hooks**（**強制執行**：禁改 .env、自動格式化）
- **L4 Subagents**（分工：code-reviewer 等，獨立 context window）
- **關鍵認知**：Hooks 強制、CLAUDE.md 只建議 → 安全規則放 Hooks/`permissions.deny`，唔好淨靠 CLAUDE.md 寫「唔好碰」。

**上下文管理（隱形殺手）**：① 勤 `/clear`（感覺跑偏即清，重要嘢 claude-mem 已存）② 主動 `/compact 保留 <X>`③ 按 context 單元拆任務（會話1 規劃 Plan Mode → /clear → 會話2 實現 → /clear → 會話3 測試）。

**效果對比（加搜尋功能）**：裸奔 vs 三件套 = 新依賴 3→0、碼量 287→164 行(-43%)、偏離需求 5→0 處、人工修正 4→1 次、第二 session 記憶 ❌→✅。同模型同 Claude，配置差 ≥3 倍效率。

## My Notes（對本 vault 嘅映射）

- **andrej-karpathy-skills = 你 `~/.claude/CLAUDE.md`** —— 四原則逐字對上（machine-wide 行為守則）。即係你早就裝咗三件套嘅第一件。
- **claude-code-best-practice 已 bookmark**（喺 [[雷蒙 Lifehacker - Claude Code 學習資源 hub]] 清單內，shanraisshan）。
- **claude-mem vs 本 vault 記憶**：本 vault 有自家 memory（`memory/*.md`）+ **Claude history Stop hook**（per-turn mirror）+ dual-log。claude-mem 係另一條路（語義壓縮 SQLite + 自動注入）。**可評估**：claude-mem 自動注入 vs 你手動 curated memory，邊個適合 —— 但你 vault memory 係 curated、claude-mem 係 auto-capture，哲學唔同（你偏 curation）。
- **L1-L4 分層 ≈ 本 vault `[[extensions]]` catalog**（skills/plugins/hooks/mcp）。但文章「CLAUDE.md <150 條指令」**值得留意**：本 vault `CLAUDE.md` 偏長（mixed-mode 多規矩）—— 可考慮係咪部分搬去 skill（你 project skill 現為 0）。
- **Hooks 強制 vs CLAUDE.md 建議**：本 vault 已用 native hook（auto-commit / Stop / PreToolUse RTK…），同文章主張一致。`permissions.deny` 保護敏感檔嘅招本 vault 未用，可考慮。

## Related
- [[雷蒙 Lifehacker - Claude Code 學習資源 hub]] —— 內含 claude-code-best-practice
- [[hooks]] —— 本 vault hooks（強制層）
- [[skills]] —— 本 vault skills（project skill 現 0）
- [[Bookmarks]]

<!-- ===== ARCHIVE BELOW — 全文（使用者 paste 2026-06-19，知乎封自動抓取），掃描/triage 時可跳過 ===== -->

## Full Content (archived)
> 來源：https://zhuanlan.zhihu.com/p/2027705686390313096（柒星栈，知乎）。知乎封自動抓取（403），**全文由使用者登入後 paste**；已略去 Unsplash 圖片來源行。

### 导语
打开 Claude Code，信心满满地说"帮我重构这个模块"，然后眼睁睁看着它：加了三个你从没听过的依赖，搞出一堆你根本没要求的抽象层，还顺手把你的命名规范改了个遍。最后你花了比手写还多的时间来收拾残局。我也是，直到我发现了 GitHub 上三个加起来超过 10 万 Star 的开源项目，这彻底改变了我和 Claude Code 的协作方式。

### 一个推文所引发的"配置革命"
2026 年初，Andrej Karpathy（OpenAI 联合创始人、前 Tesla AI 负责人、"vibe coding" 一词发明者）在 X 发推，没分享新工具或框架，只是冷静地把 LLM 写代码反复出现的毛病列出来：**过度工程**（让它修个按钮，反倒搭了一整个组件库）、**无视现有模式**（项目用 Zustand 偏要引入 Redux）、**乱加依赖**（没要求过的 npm 包悄悄装上）、**自信地犯错**（不确定时不询问直接猜，猜错还表现得特别笃定）。Karpathy 的洞察："如果这些错误是可预测的，那它们就是可预防的。"

开发者 Forrest Chang 把 Karpathy 的观察提炼成一个 CLAUDE.md 文件放上 GitHub，即后来狂揽 13.7K Star 的 **andrej-karpathy-skills**。同时另两个项目爆发式增长：thedotmack 的 **claude-mem（46.1K⭐）** 解决 Claude Code 的"失忆症"；shanraisshan 的 **claude-code-best-practice（42.3K⭐）** 把 Skills、Hooks、Subagents 的配置体系整理成生产级模板。三件套各有分工，组合形成完整的 Claude Code 效率体系。

### Karpathy 四原则：给 AI 装上"刹车"
andrej-karpathy-skills 本质做一件事：借四条规则，把 Claude Code 从"自信的初级程序员"调教成"谨慎的高级工程师"。

**原则一：Think Before Coding** —— 编写任何代码前，必须先用自然语言描述清楚打算做什么、为什么。解决"自信地犯蠢"。Claude 会先输出思考过程（如：在 UserService 新增 validateEmail、复用 utils/regex.ts、不引入新依赖用项目已有 validator 库，原因：保持一致性）。先"说出来"你再决定要不要"做出来"，方向偏一句话纠正，比改代码快。

**原则二：Simplicity First** —— 针对"过度工程"：能 3 行别写 30 行、能用现有工具别引入新依赖、能简单实现别搞设计模式。作者体感碼量平均 -40% 而功能不变；之前动不动 Factory/Strategy 模式，现在老实写 if-else 反而更清晰。

**原则三：Surgical Changes** —— 只改需要改的，不顺手"优化"周围代码。修一个 bug 顺手重构旁边三行、牵扯另两个模块一测全错——精准修改：改一行是一行，不碰不该碰的。

**原则四：Goal-Driven Execution** —— 执行中持续对齐目标，偏离原始意图就停下确认。给列表加搜索框不会中途自作主张优化分页。

**安装**：`git clone https://github.com/forrestchang/andrej-karpathy-skills.git`，把项目里的 CLAUDE.md 复制到项目根目录即可。**局限**：规则写给独自编码的工程师；若你是 PM 或 SaaS 创始人，最贵的失败或许不是"过度工程"而是"做错了东西"（没定义清楚用户痛点就开写）——这缺口需自己填补。

### claude-mem：让 Claude 拥有"长期记忆"
解决每次新会话记忆清零。核心流程：会话开始→注入最近 10 次会话上下文；输入 Prompt→创建会话记录保存提示；工具执行→自动捕获观察结果（Read/Write）；Worker 处理→通过 Claude Agent SDK 提取语义摘要；会话结束→生成总结备用。关键：不存原始对话（token 爆炸），用**语义压缩**成结构化观察存本地 SQLite；下次新会话检索相关上下文只注入当前任务所需部分。据 DataCamp 测试每会话省 ~2250 token。

**三层检索**：会话摘要层（最近 10 次概要，自动注入）；语义搜索层（MCP 工具按需检索，`claude-mem://` URI 引用具体观察）；文件夹上下文层（项目目录自动生成 CLAUDE.md 含活动时间线）。

**安装**：`npx claude-mem install`，或插件市场 `/plugin marketplace add thedotmack/claude-mem` → `/plugin install claude-mem`，重启生效。首次较"饥渴"需学习项目，几轮后稳定。**多机同步**：claude-mem-sync 借 SSH 同步观察与摘要。**隐私控制**：双标签隐私系统，可标某些内容为私密不注入未来会话（处理 .env/密钥必要）。

### Best Practice 仓库：生产级配置模板
Karpathy Skills 是"行为校准器"、claude-mem 是"记忆系统"，shanraisshan 的 claude-code-best-practice 是完整配置蓝图（42.3K Star，Anthropic 黑客松获奖者实战配置）。

**四层配置体系**：
- L1 **CLAUDE.md** — 项目记忆（建议性）：技术栈、命名规范、目录结构
- L2 **Skills** — 可复用工作流：代码审计、品牌文案检查
- L3 **Hooks** — 强制执行规则：禁止修改 .env、自动格式化
- L4 **Subagents** — 分工协作：代码审查员、迁移专员

不少人把各类内容都往 CLAUDE.md 塞，文件越来越长，每次会话都读一遍浪费 token。正确做法：CLAUDE.md 只放最核心项目信息并控制在 **150 条指令以内**，详细流程放 Skills，安全规则放 Hooks，复杂任务交 Subagents。

**Hooks：不可逾越的红线** —— Hooks 强制、CLAUDE.md 建议。CLAUDE.md 写"不要修改 .env"Claude 大概率遵守但非 100%；Hooks 配 PreToolUse 在系统层拦截，Claude 连文件内容都看不到。示例 settings.json 用 PreToolUse matcher `Write|Edit` + command `echo 'Blocked' && exit 1`。也可在 settings.json 把敏感文件设 deny，比 Hooks 拦截更干净。

**Skills：可复用工作流** —— 2026 最重要功能升级之一，比旧 Commands 强大，支持附加文件、自动触发、Subagent 执行。典型结构 `.claude/skills/quick-audit/`（SKILL.md / references/ / scripts/ / examples/）。核心特性自动触发：在 SKILL.md 的 description 写明触发条件（如"当编写或编辑内容文件时使用"），Claude 依上下文自动匹配执行。

**Subagents：让 Claude 团队作战** —— 每个 Subagent 有自己的上下文窗口、工具权限、模型配置。实用模式"test time compute"：一个 Subagent 写代码、另一个同模型 Subagent 审查（独立 context，审查者不被写码时的假设偏见影响）。示例 `.claude/agents/code-reviewer.md`（name / model / tools: Read,Grep,Glob；职责：发现 bug 和安全漏洞、检查规范、不改代码只给意见）。仓库还有天气 Agent 例子（预加载 Open-Meteo API 调用方式，主 Agent 委派而不在主上下文塞 API 文档）。

**配置层级**：`~/.claude/CLAUDE.md`（全局个人，所有会话生效）→ 项目根目录/CLAUDE.md（项目级）→ src/CLAUDE.md（目录级，进入 src 时生效）。渐进式披露：全局保持精简，细节按需加载。

### 上下文管理："隐形杀手"
上下文窗口非无限，每轮对话整个上下文重新处理；越长 Claude 表现越降（忘约定、重复错误、幻觉）。SmartScope 观点：不是"坚持越久越好"，而是以"会话会被污染"为前提操作。

**三个关键操作**：① 勤用 `/clear`（感觉跑偏果断清，重要信息 claude-mem 已存）② 主动 `/compact`（压缩时告知保留内容，如 `/compact 保留 API 变更列表和已修改文件清单`；也可在 CLAUDE.md 加常驻指令"压缩上下文时始终保留：完整修改文件列表和当前测试状态"）③ 按上下文单元拆任务（会话1 需求分析+方案设计 Plan Mode → /clear → 会话2 核心实现 → /clear → 会话3 测试+清理）。

### 三件套整合：实战配置方案（作者两个月迭代）
**第一步 装 Karpathy Skills**：`curl -o CLAUDE.md https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/main/CLAUDE.md`，然后在 CLAUDE.md 末尾追加项目专属配置（技术栈 React19+TS5+Tailwind4 / Zustand 不用 Redux / Node22+Fastify；命名规范 PascalCase 组件、camelCase 工具函数、UPPER_SNAKE_CASE 常量、kebab-case 文件；关键约束 API 响应 {success,data,error}、迁移放 src/database/migrations/、不引入新 UI 库用已有 shadcn/ui）。

**第二步 装 claude-mem**：`npx claude-mem install`，重启，`npm run worker:status` 确认 Worker。首次几轮学习项目，运行几天起步速度明显变快。

**第三步 配 Hooks 和 Subagents**：`git clone https://github.com/shanraisshan/claude-code-best-practice.git`。至少配：自动格式化 Hook（PostToolUse matcher `Write|Edit` → `npx prettier --write $CLAUDE_FILE_PATH`）；敏感文件保护（permissions.deny: `.env`, `.env.*`, `*.pem`, `*.key`, `credentials/*`）；code-reviewer Subagent（model claude-sonnet-4，tools Read/Grep/Glob，检查是否遵循 CLAUDE.md 规范/bug/安全漏洞/多余依赖/修改是否精准，只给意见不改代码）。

**第四步 建立日常节奏**：每天开始→启动 Claude Code→claude-mem 自动注入；新功能→Plan Mode 规划→/clear→实现；修 Bug→精准描述→让 Claude 先思考再动手；代码审查→委派 code-reviewer Subagent；感觉跑偏→果断 /clear→从 CLAUDE.md 重新开始；每天结束→关闭会话→claude-mem 自动生成总结。

### 效果对比（同一任务：给现有项目添加用户搜索功能）
| 指标 | 裸奔 Claude Code | 三件套配装 |
|------|------|------|
| 新增依赖 | 3 个（lodash.debounce, react-select, fuse.js）| 0 个（复用已有）|
| 代码行数 | 287 行 | 164 行（-43%）|
| 偏离原始需求的改动 | 5 处 | 0 处 |
| 需要人工修正次数 | 4 次 | 1 次 |
| 第二次会话是否记得上下文 | ❌ 完全不记得 | ✅ 自动注入 |

同样的 Claude、同样的模型，配置不同效果差距巨大。

### 一些诚实的补充
- Karpathy Skills 四原则对个人开发者够用，但对产品团队缺"做对的东西"（masteringproducthq.com 分析：至少 1/3 AI 辅助开发问题不是"代码写错"而是"一开始就不该开发这个功能"）——CLAUDE.md 解决不了，靠你的产品判断力。
- claude-mem 项目初期有"学习期"，前几轮注入量大、token 偏高；语义搜索是否导致不同项目上下文"串台"——现有文档看更像"对过去会话的快速搜索"，跨项目隔离需自行留意。
- Best Practice 仓库全面也代表复杂；新手别一上来装 30 Skills + 9 Hooks + 5 Subagents，从 CLAUDE.md + 一个 Hook + 一个 Subagent 开始逐步加。

### 写在最后
Claude Code 的顶尖水准不在模型本身——同一个 Sonnet 4，未配置 vs 精调配置差距 ≥3 倍效率。Karpathy 四原则解决"行为规范"、claude-mem 解决"记忆持久化"、best-practice 解决"配置体系化"，三件套组合后 Claude Code 才从"工具"变"搭档"。配置只是手段非目的，真正目的是让你把时间花在需要人类判断的地方，而非反复纠正 AI 的低级错误。今天就能动手：先装 Karpathy Skills，再装 claude-mem，最后按需从 best-practice 仓库挑配置，一个下午搭好基础框架。

## Key Comments
（知乎文章，17 赞同；留言未抓取（login wall，全文亦由使用者 paste）。如需留言可日後補。）
