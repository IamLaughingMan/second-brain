---
type: meta
title: "Hot Cache"
updated: 2026-06-18
---

# Recent Context

## Last Updated
2026-06-18 — bookmark 全文預設 + backfill 9 篇 + 研究「Obsidian 記錄 Claude 對話」

## 2026-06-18 session 摘要（最新，session 前重開）
- **Bookmark 改預設**：每個 bookmark **自動連全文 + 重要留言一齊存入 bookmark 檔本身**（`## Full Content (archived)` / `## Key Comments`，防 link-rot 尤其社媒）；留言抓唔到明寫「未能抓取」、唔扮抓。`raw/` 不受影響（`raw_source` 仍為 Layer 2 bridge pointer）。
- **降掃描成本**：全文移檔尾 + 分隔線、frontmatter 加 `summary:`（triage 用 `get_frontmatter`/`Read --limit` 零 body 成本）、search-first 守則。`.base` 本來只讀 frontmatter。改 raw/ 唔慳 disk（搬層問題、非空間問題）。
- **Backfill**：9 個現有 bookmark 全部套用（defuddle 全文、剝 badge/圖片/空連結殼、natto trim sidebar）。全屬 reference source（非社媒）→ Key Comments 不適用 → **社媒留言抓取路徑仍未真正測過**。
- **工具**：全局裝 `defuddle 0.19.0`。cleanup 慣例（剝 badge/圖片/空連結殼 + trim nav + 驗 0 殘跡）已寫入 parent `~/AI/Claude/CLAUDE.md` pipeline。
- **研究歸檔**：[[Recording Claude Conversations in Obsidian]]（兩派哲學：存原始 vs 蒸餾；本 vault 屬 **mixed-mode**——`wiki/` 跟蒸餾派、其他 root folder 各有邏輯，原始對話 archive 唔屬 Karpathy 範圍；GitHub 高星 peer：NicholasSpisak/second-brain 400★、SamurAIGPT/llm-wiki-agent 2.97k★、ballred/obsidian-claude-pkm 1.5k★；補 raw archive gap 工具 = jimmc414/cctrace 195★）。
- 未 push commit 多個（bookmark convention + backfill + research）→ 用戶喺自己終端機 push。

## Key Recent Facts
- Most severe perio = **Stage IV / Grade C** (2018 classification): risk of losing whole dentition.
- Treatment ladder: control inflammation (deep cleaning + systemic antibiotics, aPDT/laser adjuncts) → regenerate salvageable teeth (EMD/GTR/LANAP) → replace lost teeth (implants) → lifelong maintenance.
- Lost teeth today: only **implants** — All-on-4 ($18-35k US / £12.5-15k UK / arch), zygomatic for severe bone loss ($30-60k US full mouth). Tourism (Turkey/Hungary/Mexico) saves 50-70%.
- Near-future: stem-cell perio (2025 Nature RCT, not yet FDA/EMA approved) and **TRG-035 anti-USAG-1** drug ([[Toregem BioPharma]], [[Katsu Takahashi]]) — Phase I 2024, ~2030 target, but first indication is congenital tooth absence, NOT perio loss.
- Asia prices: China cheapest single implant (集采 cap ~¥4,500/~US$640, -55% since 2023); Korea cheapest open-market full-arch (~30% of US); Singapore most expensive; Taiwan All-on-4 NT$30-80萬. Top centers: Institute of Science Tokyo (ex-TMDU), Tokyo Dental College, SNU, HKU, PKU School of Stomatology, Shanghai 9th Hospital, West China; in TW use NTU/VGH/TMU perio depts + board-certified periodontist. Italy = global perio-regeneration clinical leader (Cortellini, Zucchelli; Siena & Bologna), All-on-4 avg ~€10,800. See [[Asia Dental Implant Cost Guide 2025-2026]], [[Top Asian Periodontal and Implant Centers]].

## Recent Changes
- **2026-06-12 改混合結構**：22 個牙周病檔（3 hub＋`.base`＋20 內容頁）`git mv` 入 `wiki/Health/Oral/Periodontal Disease/`，鏡射 MOC 階層。`CLAUDE.md` 由「扁平禁建資料夾」改為混合模型：meta／方法頁平放、領域內容入領域夾。git 全認純 rename、零內容改、零斷連（wikilink 不帶路徑、`.base` 靠 `domain` filter）。同步更新 `index.md`／`hot.md`。
- **2026-06-11 領域歸檔**：牙周病 20 篇研究歸入三層 MOC hub [[Health]] → [[Oral]] → [[Periodontal Disease]]，各頁加 `domain: periodontal-disease`。「Gum disease」採臨床標準名 **Periodontal Disease（牙周病）**。
- **2026-06-11 結構重構**：wiki/ 攤平成扁平 Karpathy 結構——21 篇內容頁從 6 個分類資料夾搬到 `wiki/` 根層，刪掉 9 個空 `_index.md` 與所有分類資料夾。重寫 `index.md`（單一目錄、frontmatter type 分組）、`CLAUDE.md`（compiler 模型＋四階段迴圈＋禁建資料夾）。新增根層 [[OBSIDIAN-SETUP]]（Karpathy + kepano 建置藍圖）。更新 [[Karpathy LLM Wiki Pattern]]（DAIR.ai：compiler 框架、no vector DB、合成訓練資料）。WIKI.md 加覆蓋聲明。wikilink 不帶路徑故零損壞。
- 14 pages created: 6 sources, 5 concepts, 2 entities, 1 synthesis.
- Synthesis: [[Research - Severe Periodontitis and Tooth Loss]]
- 全部內容已中文化、價格改 HKD 為主；新增 [[Karpathy LLM Wiki Pattern]]。
- 已啟用 git 版本控制；採用 claude-obsidian 外掛內建的「改完 wiki 自動 commit」(PostToolUse)。已補 `raw/.gitkeep`、`.vault-meta/.gitkeep` 修復自動 commit（先前因缺目錄/無追蹤檔而靜默失敗）。

- Zygomatic vs grafted implants: both >90% long-term. Zygomatic ~96%@5yr / 95.21%@12yr + same-day teeth; main risk sinusitis (anatomy-guided cuts it to ~4.4%). Grafted-sinus 90-98% but +months healing. Zygomatic wins as atrophy worsens. See [[Zygomatic Implants vs Bone Graft Implants]].

- 日常產品（證據＋價格）：機械清潔最硬（牙間刷＞牙線、沖牙機 Waterpik、電動牙刷）；含氟錫牙膏=中；氯己定 CHX 僅短期；益生菌 L. reuteri（BioGaia Prodentis ~HK$195–273/US$25–35 月）與 Omega-3=中度輔助；CoQ10/Vit D/C=低-中。全為輔助，不取代 SRP。見 [[Periodontal Daily Products and Supplements]]。

## Active Threads
- Open: efficacy of anti-USAG-1 for adult perio loss; stem-cell approval timeline; Asia (Taiwan/HK/Japan) local prices & top specialists not yet researched.
