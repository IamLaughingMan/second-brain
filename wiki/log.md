---
type: meta
title: "Wiki Log"
updated: 2026-06-07
---

# Wiki Log

Append-only. New entries go at the TOP. Never edit past entries.

---

## [2026-06-08] save | Karpathy LLM Wiki 模式參考頁

- 研究 Karpathy 如何用 Obsidian（原始 gist ＋ claude-obsidian 外掛）
- Resources: [[Karpathy LLM Wiki Pattern]]（中文＋括號英文）
- 涵蓋：三層結構（raw/wiki/CLAUDE.md＋index/log/hot）、ingest/query/lint 操作、複利理念、Obsidian 搭配 tips（Web Clipper、圖片落地、graph view、git）
- Key insight: 維護的瓶頸是 bookkeeping；LLM 把維護成本壓到趨近零，解了 Memex 的「誰來維護」

---

## [2026-06-08] convert | 全部價格改為 HKD 為主＋（原幣）

- 換算所有價格為港幣（HKD）主顯示，括號保留原始貨幣
- 採用匯率（約2025）：US$1≈7.8｜£1≈9.9｜€1≈8.5｜NT$1≈0.25｜JPY¥1≈0.05｜S$1≈5.8｜₩1≈0.0057｜CNY¥1≈1.08（均加註於各頁）
- 更新頁面：Global Dental Implant Price Comparison、Global/Asia Cost Guide、Full-Arch Dental Implants、Periodontal Daily Products and Supplements、綜合頁亞洲價格表
- 註：各 source 頁 frontmatter 的 key_claims（英文原幣）保留為原始來源紀錄

---

## [2026-06-08] autoresearch | 牙周病日常產品、益生菌、補充品（證據＋價格）

- Rounds: 1 | Searches: 5
- Resources: [[Periodontal Daily Products and Supplements]]
- 涵蓋：牙間刷／沖牙機／電動牙刷、含氟錫牙膏、氯己定漱口水、L. reuteri 益生菌（BioGaia Prodentis）、Omega-3／CoQ10／維生素 D/C
- 依證據強度（高／中／低）分級，附 2025 約略零售價與 RCT／系統性回顧出處
- Key finding: 機械清潔（牙間刷＞牙線、沖牙機）證據最硬；益生菌 L. reuteri 與 Omega-3 為中度證據之輔助；CHX 僅短期；補充品（CoQ10/Vit D/C）證據較弱。全部皆為輔助，不能取代 SRP 與專科治療。

---

## [2026-06-08] enrich | 加入出處連結與影片

- 8 個 source 頁加上「出處連結（Sources）」可點 URL（皆為搜尋取得的真實連結）
- 影片（真實 YouTube／France24）加到：Full-Arch Dental Implants、Zygomatic Implants vs Bone Graft Implants、Tooth Regeneration Anti-USAG-1，以及兩個費用 source 頁
- 顴骨植牙手術：youtube QaPz0NWcSDM / QINVmvRR7PE；All-on-4：youtube IW4VFtb7OHU / ggDZY-mPwoA；長牙藥：France24 報導
- 綜合頁 Sources 區段加註指引

---

## [2026-06-08] translate | 牙周病研究叢集翻成繁體中文

- 將 18 頁內文翻成繁體中文，專有名詞／機構／人名／術語後加註（英文／當地用語）
- 翻譯範圍：8 sources、5 concepts、2 entities、1 resource、2 comparisons
- 未改動：檔名、frontmatter（YAML 中繼資料）、[[wikilinks]]、connections — 連結圖完整
- 綜合頁 [[Research - Severe Periodontitis and Tooth Loss]] 原已為中文，維持不動

---

## [2026-06-08] autoresearch | Italy prices & periodontal leaders (addendum)

- Rounds: 1 | Searches: 2
- Updated: [[Global Dental Implant Price Comparison]] (Italy rows), [[Global Dental Implant Cost Guide 2025-2026]] (Italy + leaders), [[Research - Severe Periodontitis and Tooth Loss]] (institutions)
- Pages created: 0 (updates only)
- Key finding: Italy mid-priced in Europe (All-on-4 avg ~€10,800; single €850-1,500) but a top global clinical leader in periodontal regeneration — Cortellini & Zucchelli; Univ. of Siena & Bologna.

---

## [2026-06-08] synthesis | Global price comparison table

- No new searches; consolidated existing price data into one master table
- Comparisons: [[Global Dental Implant Price Comparison]]
- Updated: index, [[Research - Severe Periodontitis and Tooth Loss]]
- Pages created: 1
- Key finding: Cheapest single implant = China public (集采 ~$640) & Turkey ($400-800); cheapest full-arch = Turkey ($3-5.5k); US most expensive overall; Singapore highest in Asia.

---

## [2026-06-08] autoresearch | Zygomatic vs grafted implant survival

- Rounds: 1 | Searches: 2
- Sources: [[Zygomatic vs Grafted Implant Survival Reviews]]
- Comparisons: [[Zygomatic Implants vs Bone Graft Implants]]
- Updated: [[Research - Severe Periodontitis and Tooth Loss]] (added finding; closed zygomatic-vs-graft open question)
- Pages created: 2
- Key finding: Both >90% long-term. Zygomatic ~96% @5yr / 95.21% @12yr, main risk sinusitis (9.53%→4.39% with anatomy-guided technique) + same-day fixed teeth; grafted-sinus 90-98% but adds months of healing and depends on graft success. Zygomatic pulls ahead as atrophy severity rises; few head-to-head RCTs.

---

## [2026-06-08] autoresearch | Mainland China prices & institutions (addendum)

- Rounds: 1 | Searches: 2
- Updated: [[Asia Dental Implant Cost Guide 2025-2026]] (China row + 集采 note), [[Top Asian Periodontal and Implant Centers]] (PKU/Shanghai 9th/West China), [[Research - Severe Periodontitis and Tooth Loss]] (table + institutions)
- Key finding: China's volume-based procurement (集采, 2023) cut implant prices ~55%; public-hospital single implant capped ~CNY 4,500 (~US$640), now cheapest single-implant market in Asia. Top centers: PKU School of Stomatology, Shanghai Ninth People's Hospital, Sichuan Univ West China.

---

## [2026-06-08] autoresearch | Asia local prices & top perio/implant specialists

- Rounds: 1 | Searches: 5
- Sources: [[Asia Dental Implant Cost Guide 2025-2026]]
- Resources: [[Top Asian Periodontal and Implant Centers]]
- Updated: [[Research - Severe Periodontitis and Tooth Loss]] (added Asia price table + institutions section; closed Asia open question)
- Pages created: 2
- Key finding: Korea is the regional value leader for full-arch implants (~30% of US price); Singapore the most expensive. TMDU renamed to Institute of Science Tokyo (Oct 2024 merger). For severe cases, seek board-certified periodontist, not general dentist.

---

## [2026-06-08] autoresearch | Severe periodontitis & tooth loss

- Rounds: 2 | Searches: 6 | WebFetch: 1
- Sources found: [[2018 Periodontitis Classification]], [[Regenerative Therapies in Periodontology 2025]], [[TRG-035 Anti-USAG-1 Antibody]], [[Allogeneic Dental Pulp Stem Cell RCT 2025]], [[Global Dental Implant Cost Guide 2025-2026]], [[EFP Adjunctive Therapy Stage III-IV Periodontitis]]
- Concepts: [[Stage IV Grade C Periodontitis]], [[Periodontal Regenerative Therapy]], [[Full-Arch Dental Implants]], [[Stem Cell Periodontal Therapy]], [[Tooth Regeneration Anti-USAG-1]]
- Entities: [[Toregem BioPharma]], [[Katsu Takahashi]]
- Synthesis: [[Research - Severe Periodontitis and Tooth Loss]]
- Pages created: 14
- Key finding: Lost teeth are still only replaceable by implants today (All-on-4 / zygomatic); "regrow a real tooth" drug TRG-035 is in Phase I but targets congenital tooth absence, not perio loss, ~2030.

---

## [2026-06-07] scaffold | Initial vault setup

- Mode: D+C+E (Personal + Projects + Research)
- Structure created: wiki/, .raw/, _templates/, _attachments/
- Pages created: overview, index, log, hot, all _index.md files
- Key folders: goals/, areas/, learning/, people/, resources/, projects/, concepts/, entities/, domains/, questions/, comparisons/, sources/, meta/
