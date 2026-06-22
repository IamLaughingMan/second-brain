---
type: bookmark
para: resource
domain: Tech
title: "2021 年 Q3 硬碟可靠性資料出爐：有一款竟然零故障"
url: "https://www.techbang.com/posts/91728"
author: "cnBeta（轉載；T客邦 TechBang 刊登）"
published: 2021-11-18
summary: "TechBang 2021-11 轉載 cnBeta：Backblaze 2021 Q3 hard drive reliability report — 4 個資料中心 / 190,826 顆採樣硬碟。**HGST 12TB（HUH721212ALE600，阿姆斯特丹資料中心 Dell server 用）係唯一零故障**型號（Hitachi 已被 WD 收購）。4 款僅 1 次故障：Seagate 6TB（ST6000DX000）／Toshiba 4TB（MD04ABA400V）／Toshiba 14TB（MG07ACA14TEY）／WDC 16TB（WUH721816ALE6L0）；前兩者平均壽命 > 75 個月。Backblaze lifetime AFR（2013-04 至 2021-09）= **1.43%**。SSD 故障率較 HDD 低但兩者皆隨時間老化 AFR 上升。"
status: active
related:
  - ""
tags:
  - bookmark
  - tech
  - storage
  - hdd
  - ssd
  - reliability
  - backblaze
  - afr
  - reference
  - data-center
created: 2026-06-22
updated: 2026-06-22
---

# TechBang — Backblaze 2021 Q3 硬碟可靠性報告（HGST 12TB 零故障）

- URL: <https://www.techbang.com/posts/91728>
- Saved date: 2026-06-22
- Topic: Backblaze 2021 Q3 hard drive reliability statistics
- Source: **T客邦 TechBang**（轉載自 cnBeta）
- Primary source: Backblaze Drive Stats 2021 Q3 report — <https://www.backblaze.com/blog/category/cloud-storage/drive-stats/>
- Published: 2021-11-18
- Status: active

## Summary

Backblaze（雲端 backup／storage 公司）每季公開資料中心硬碟故障統計，業界 long-running benchmark。2021 Q3：

- **規模**：4 個資料中心、3,537 顆使用中（1,557 HDD + 1,980 SSD）、合共 **190,826 顆**經採樣
- **零故障 winner**：**HGST 12TB HUH721212ALE600**（Hitachi → WD 收購）— 用喺阿姆斯特丹 Dell server
- **僅 1 次故障**：Seagate 6TB ST6000DX000、Toshiba 4TB MD04ABA400V、Toshiba 14TB MG07ACA14TEY、WDC 16TB WUH721816ALE6L0
- **Lifetime AFR**（2013-04-20 → 2021-09-30 累積）：**1.43%**
- **HDD vs SSD**：SSD 故障率較低但兩者隨時間老化、AFR 都會上升

## Key Takeaways

1. **HGST 12TB 神級可靠性**：呢個型號喺 Backblaze 統計裡多季都壓榨頂端；Hitachi enterprise-grade HDD 系列（Ultrastar）品質歷史 strong。
2. **Toshiba 4TB MD04 系列耐用性高**：>75 個月平均壽命 = 約 6.25 年，超越主流預期。
3. **Backblaze AFR 1.43% lifetime** 比廠商 MTBF spec implied（通常 0.5-1.0%）高 — **真實 data center 環境老化／high duty cycle 唔似 spec sheet 樂觀**。
4. **SSD 唔等於萬無一失**：雖然 SSD failure rate < HDD，但時間 + workload accumulation 後 AFR 仍上升；NAND wear-out 真實。
5. **品牌格局**：Hitachi/HGST（now WD）→ 高端；Seagate IronWolf／Toshiba MG/N300 → 中端可靠；WD Red 系列 → consumer-tier；廠商 enterprise vs consumer 線重要。

## My Notes

- **時效檢查（2026 角度）**：2021 Q3 data 已過 4-5 年。Backblaze 持續 publish 季度 + 年度 stats：
  - 後續 reports（2023-2025）中 HGST 12TB 已逐步被 14/16/20/22TB 取代；新一代仍係 HGST/WDC enterprise 領先
  - 2025-2026 趨勢：**HAMR HDD（Seagate Exos M）、enterprise SSD（Samsung PM1733/Solidigm D5-P5430）**逐步入 Backblaze fleet
  - 新 reports 直接查 <https://www.backblaze.com/blog/category/cloud-storage/drive-stats/>（每季更新、authoritative）
- **個人用戶 takeaway**：
  - **NAS／home server 揀牌**：HGST/WDC Ultrastar、Toshiba N300／MG、Seagate IronWolf Pro 都係 safe；avoid consumer-tier Seagate Barracuda、WD Blue／Green 喺 24/7 場景
  - **唔好淨係信 MTBF spec**：要對住真實 fleet AFR（Backblaze data）+ 用戶反饋（Reddit r/DataHoarder）
  - **3-2-1 backup rule** 比揀邊個品牌仲重要（3 份 copy／2 種媒介／1 份離 site）
- **應用場景 mapping**：
  - **照片／video master**：HGST 12-16TB enterprise → 高容量、低故障
  - **OS／VM／database**：SSD enterprise grade（Samsung PM、Intel/Solidigm DC）
  - **冷備份**：LTO tape > HDD 長期儲存
- **同 dataset**：此 bookmark 屬「**hardware reliability reference**」class；其他可能 add：
  - Backblaze quarterly reports（直接 source）
  - Tom's Hardware／AnandTech 嘅 reliability deep dive
  - Reddit r/DataHoarder build-log（community wisdom）
- **本文 limitations**：
  - 樣本 = data center 環境（24/7、constant temp/humidity），**唔等於 home use** 嘅 burst load + 溫差 + 震動 profile
  - Survivorship bias：Backblaze procurement 早 reject 已知有問題嘅 batch，bad apples 唔入統計
  - 個別型號 sample size 唔均；大量 deployment 嘅型號（如 Seagate 4TB）統計顯著、小批量型號 (HGST 12TB 喺阿姆斯特丹) sample 細不可一概而論

## Related

- *(未連入 wiki；如要做 storage stack research 可 promote 到 [[補充品行業]] 同類 entry-research framework)*
- **Primary source**：Backblaze Drive Stats — <https://www.backblaze.com/blog/category/cloud-storage/drive-stats/>
- 對讀：Tom's Hardware / r/DataHoarder community wisdom

<!-- ===== ARCHIVE BELOW · 防 link-rot 全文與留言 ===== -->

## Full Content (archived)

日前，Backblaze 發佈 2021 年 Q3 硬碟故障資料。作為雲端儲存和備份公司，Backblaze 擁有 4 個資料中心，共有 3,537 塊使用中的硬碟（1,557 塊 HDD 和 1,980 塊 SSD），以及 191,212 塊資料儲存硬碟。剔除不滿足標準的硬碟樣本，本次資料採樣共包含 **190,826 塊硬碟**。

其中**日立 HGST 12TB 是唯一一款零故障的硬碟產品**（日立已被 WD 收購），具體型號為 **HUH721212ALE600**，這款產品用於 Backblaze 在阿姆斯特丹資料中心的戴爾儲存伺服器上。

另外，希捷 6TB 硬碟（**ST6000DX000**），東芝 4TB 硬碟（**MD04ABA400V**），東芝 14TB 硬碟（**MG07ACA14TEY**），WDC 16TB 硬碟（**WUH721816ALE6L0**），這 4 款硬碟產品在 Q3 季度僅記錄了一次硬碟故障。其中，希捷 6TB 硬碟（ST6000DX000）與東芝 4TB 硬碟（MD04ABA400V）平均壽命已超 **75 個月**，表現更為出色。

Backblaze 還統計了自 2013 年 4 月 20 日至 2021 年 9 月 30 日，Backblaze 所有參與採樣硬碟型號的壽命 **AFR（年故障率）**，涵蓋從 4TB 到 16TB 的硬碟，平均使用時間從 1 個月到 6 年不等，最終數值為 **1.43%**。

Backblaze 還表示，根據對 HDD 和 SSD 資料的監測，儘管 SSD 故障率更低，但隨著時間的過去，無論是 SSD 還是 HDD，都會受到性能老化的影響，AFR 逐漸提升。

## Key Comments

*(TechBang 文章頁無公開留言欄；defuddle 只取 article body。Primary source Backblaze blog 評論區有 community discussion，但 cnBeta／TechBang 譯介層唔包含。)*
