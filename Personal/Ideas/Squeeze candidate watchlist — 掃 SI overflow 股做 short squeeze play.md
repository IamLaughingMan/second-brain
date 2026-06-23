---
type: idea
stage: 未做
status: active
para: inbox
created: 2026-06-23
updated: 2026-06-23
tags:
  - idea
  - finance
  - stocks
  - short-squeeze
  - trading-strategy
  - watchlist
---

# Squeeze candidate watchlist — 掃 SI overflow 股做 short squeeze play

## Why / 動機

由 [[冷知識]] 嗰篇「**Overflow Attack（短倉溢出攻擊）**」延伸：當 short interest > float（尤其 >100%）+ borrow fee 飆+FTD 累積，係 [[GME]] 式 infinity squeeze 嘅 setup。**Idea**：起一個 watchlist screener，定期（每兩星期 / SI 公佈日）掃 US small/mid-cap，篩出 squeeze candidate，做事件驅動 long play。

## 核心 thesis

1. **Reported SI 並非 lagging indicator if 配合即時 signals**：
   - SI > 20%（必要條件）
   - Cost-to-borrow > 30-50%（緊絀）
   - FTD 上升（settlement stress）
   - Days-to-cover (DTC) > 5（exit 困難）
   - 同時有 retail catalyst（X／reddit／TikTok meme）
2. **進場時機唔靠 fundamentals**：呢類 play 食 reflexivity（短倉 panic cover → momentum → 更多 retail buy → 更多 cover），FOMO 一爆就盡量唔接 last leg。
3. **退場規矩比進場重要**：因 leveraged ETF 式 path dependency（[[TQQQ 10 年漲 7298% 但 WSJ 不建議貿然購買 槓桿衰減（風傳媒轉載 WSJ 2020）]] 嘅 vol decay 規律喺 squeeze 反向 applicable）—— up-then-collapse 通常 < 5 個交易日。

## Setup checklist

- [ ] **Universe filter**：US market cap $50M-$5B（micro-cap 流動性差、large-cap 難 squeeze）
- [ ] **SI**：>20% float（Ortex／S3 Partners 數據）
- [ ] **Borrow fee**：>30%（IB／Fintel）
- [ ] **FTD**：上升 trend（SEC FTD report）
- [ ] **Retail attention**：Reddit WSB mention 排名上升、X 提及暴增、Google Trends spike
- [ ] **Options activity**：unusual call volume（gamma squeeze 燃料）
- [ ] **Catalyst**：earnings／binary event／meme cycle re-ignition

## 進場規矩

- 分批入（3 等份），每升 50% 加倉一次
- 嚴格 stop loss：跌穿前低 = 全 cut
- Position size 限本金 5%（因為呢類 play 0/100 outcome）

## 退場規矩

- **Take profit**：3x → 出 50%；5x → 全部 cover
- **Time stop**：5 個交易日無 follow-through = 平倉
- **Trigger event 落空**：例如 SI 公佈下降、borrow fee 滑落 → 即出

## 風險

- **Robinhood／IB 等券商再「關廁所」**：見 [[PTT Stock — GME 風波曾限制交易券商名單 4 組分級（disp.cc 鏡像 2021）]]——squeeze 高潮時可能被限購、無法加倉
- **股價可任意 gap**：overnight / pre-market 可跌 50%+
- **稅務**：US-stock 短炒 ordinary income 課稅（HK 居民非 US resident 多數豁免，但要確認 ETF／RIC routing）
- **Borrow recall**：long 倉冇 short pressure 但要留意 lender 召回會打亂 thesis

## 替代 vehicle

- **Direct long stock**（最簡單）
- **Long call options**（OTM, 1-3 mth）—— gamma exposure 但 theta decay 兇
- **Vertical call spreads**（限制 max gain，降 cost）
- **NOT inverse short**（呢類 plays 反方向）

## Next

- [ ] 試用 **Ortex** 免費 trial / **Fintel** 睇 borrow fee real-time
- [ ] 搵 X／Reddit screener tool（如 **swaggystocks**，monitoring WSB sentiment）
- [ ] 模擬 backtest（用 2021 GME／AMC／BBBY／CVNA 過去 squeeze 樣本）
- [ ] 訂閱 Ihor Dusaniwsky (S3 Partners) 嘅 weekly squeeze report
- [ ] 開 alert：SI > 30% + borrow fee > 50% 同時觸發

## Related

- [[冷知識]] —— Overflow Attack 機制詳解
- [[PTT Stock — GME 風波曾限制交易券商名單 4 組分級（disp.cc 鏡像 2021）]] —— 上次 squeeze 嘅券商風險記錄
- [[TQQQ 10 年漲 7298% 但 WSJ 不建議貿然購買 槓桿衰減（風傳媒轉載 WSJ 2020）]] —— path-dependency 警示
- [[神魚 4 大賺錢攻略（1000 鎂到 1 億鎂）]] —— 高 conviction 細 position 嘅 size 規矩
