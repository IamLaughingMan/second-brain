---
type: resource
domain: nmn
para: resource
title: "NMN — PDP Capsule (wireframe + copy)"
status: draft
created: 2026-06-24
updated: 2026-06-24
tags:
  - nmn
  - business
  - ecommerce
  - pdp
  - copy
  - wireframe
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[Brand & Web Design Brief]]"
  - "[[Offer Architecture]]"
  - "[[Brand Story & Proof]]"
---

# PDP — HYGIEIAS NMN Capsules (300mg × 60)

> Hero PDP（thin-slice 先行）。Mobile-first 單欄。視覺 = Direction A（Lab Sheet / clinical transparency）。**`[…]` = 待補真數據**(純度 %、lab 名、COA、cGMP 廠名)。劑量假設 **1 粒 = 300mg/日 = 60 日**(待 confirm)。

## 視覺基調（Direction A，全頁通用）
- 色:紙白底 #FAFAF8 ・ 深藍 ink(取自 logo)#1B2A4A ・ 單一 accent CTA(深藍實底 or 安全橙)・零 gradient。
- 字:grotesk body + **mono 做所有數據**(mg / % / $/g)。
- 留白:結構化 —— hairline rules、spec table、密而有序。
- 圖:product-on-seamless、top-down、COA 當圖、膠囊微距。無 model、無 stock、無 lifestyle。

---

## Wireframe（mobile,由上而下）

```
┌─────────────────────────────┐
│ [≡]   HYGIEIAS         [🛒]  │  sticky header
├─────────────────────────────┤
│                             │
│     [ product-on-white ]    │  1. HERO 圖(可左右掃 COA/膠囊微距)
│                             │
│ NMN Capsules                │  H1
│ Nicotinamide mononucleotide │  sub
│ ┌────┐┌────┐┌──────┐┌─────┐ │  spec chips(mono)
│ │300mg││60ct││3rd-pty││NDI ✓│ │
│ └────┘└────┘└──────┘└─────┘ │
│                             │
│ ( ) One-time      $34.95    │  price toggle
│ (•) Subscribe −15% $29.95   │  (subscribe 預選)
│     $0.50 / day · cancel any │
│ ┌─────────────────────────┐ │
│ │     ADD TO CART  →       │ │  CTA(高對比)
│ └─────────────────────────┘ │
│ cGMP · 3rd-party tested ·    │  trust micro-row
│ NDI-compliant · 60-day MBG  │
├─────────────────────────────┤
│ 2. SPEC SHEET(datasheet)    │  純度/劑量/servings/$g/$serving/clean label
├─────────────────────────────┤
│ 3. READ THE LAB REPORT      │  COA viewer + download + lab/batch
├─────────────────────────────┤
│ 4. WHAT YOU PAY FOR         │  誠實 $/g 對比表(vs premium / budget)
├─────────────────────────────┤
│ 5. HOW TO TAKE IT           │  1 粒/日 + 時機
├─────────────────────────────┤
│ 6. WHAT IS NMN(claims-safe)│  教育 + footnote 引用
├─────────────────────────────┤
│ 7. WHY HYGIEIAS(故事 snippet)│  Hygieia / decoded + link About
├─────────────────────────────┤
│ 8. SUBSCRIBE & SAVE         │  −15% 機制
├─────────────────────────────┤
│ 9. 60-DAY GUARANTEE         │  空樽都收
├─────────────────────────────┤
│ 10. REVIEWS(誠實 cold-start)│  verified-only policy
├─────────────────────────────┤
│ 11. FAQ(手風琴)             │
├─────────────────────────────┤
│ FDA disclaimer · footer     │
└─────────────────────────────┘
 [ sticky bottom bar: $29.95 · ADD TO CART ]  ← mobile 常駐
```

---

## Copy（section-by-section,English customer-facing）

### 1. Hero
- **H1:** NMN Capsules
- **Sub:** Pure nicotinamide mononucleotide. Documented, third-party tested, fairly priced.
- **Spec chips:** `300 mg / capsule` · `60 capsules` · `Third-party tested` · `NDI-compliant`
- **Price:** One-time **$34.95** · Subscribe & Save **$29.95** (−15%, cancel anytime) · **$0.50 / day**
- **CTA:** ADD TO CART
- **Trust micro-row:** Made in a cGMP facility · Third-party tested · NDI-compliant ingredient · 60-day money-back

### 2. Spec sheet（datasheet block — mono）
| | |
|---|---|
| NMN per capsule | **300 mg** |
| Capsules | **60** (≈ 60-day supply at 1/day) |
| Purity | **≥ 99%** (per COA) |
| Form | Vegetable cellulose capsule |
| Price per serving | **$0.50** (subscribe) / $0.58 |
| Price per gram NMN | **$1.66** (subscribe) / $1.94 |
| Other ingredients | [None / rice flour — clean label, TBC] |
| Tested by | [Independent lab — name] |

### 3. Read the lab report
> Every batch is third-party tested for identity and purity. We don't ask you to take our word for it — read the report.
- [ COA viewer (embedded PDF) ] · **Download COA (PDF)** · Batch #[…] · Lab: [name]

### 4. What you pay for（誠實對比 — 非 dark pattern,用品類標籤非點名)
| | **HYGIEIAS** | Typical premium NMN | Typical budget NMN |
|---|---|---|---|
| Price / bottle | **$34.95** | $50–58 | $25–30 |
| NMN / serving | 300 mg | 250–500 mg | 250–500 mg |
| Purity stated | **≥ 99% ✓** | sometimes | rarely |
| Third-party COA shown | **Yes, on this page** | sometimes "on request" | rarely |
| NDI-compliant ingredient | **Yes** | varies | often unclear |
> We're not the cheapest. We're the one that shows you the lab report and skips the luxury markup.

### 5. How to take it
> Take 1 capsule daily, with or without food. Many people take it in the morning. That's it. [劑量待 confirm:1 vs 2 粒]

### 6. What is NMN?（claims-safe 教育 + footnote)
> NMN (nicotinamide mononucleotide) is a precursor your body uses to make NAD⁺ — a coenzyme involved in cellular energy metabolism.¹ NAD⁺ levels are an active area of healthy-aging research.² We share the science so you can make an informed choice — not because we're making a promise about it.
>
> ¹ [citation] · ² [citation]  *(中性引用,**禁** "reverses aging / cures / treats" 字眼)*

### 7. Why HYGIEIAS（故事 snippet)
> Named after Hygieia, the Greek goddess of health — prevention, not cure. We sell NMN we can document: cGMP-made, NDI-compliant, third-party tested. The milligrams, the purity, the price per gram — then you decide. → **Read our story**

### 8. Subscribe & Save
> Subscribe and save 15% on every order. Skip, change, or cancel anytime — no lock-in. Your NMN arrives before you run out.

### 9. 60-day money-back guarantee
> Try it for 60 days. If it's not for you, we'll refund you — even if the bottle's empty.

### 10. Reviews（誠實 cold-start)
> HYGIEIAS is new. Verified-buyer reviews will appear here as they come in. We will never post fake or incentivized reviews. [上線:用 verified-purchase 評價 app;未有評價前顯示此政策聲明,不留空、不作假]

### 11. FAQ
- **Is NMN legal to sell in the US?** Yes. In 2025 the FDA confirmed NMN is not excluded from the dietary supplement definition. Our ingredient is NDI-compliant.
- **Why are you cheaper than premium brands?** No luxury markup and no celebrity marketing — same documented purity, fairer price.
- **What's the purity?** ≥ 99%, confirmed by third-party COA (above).
- **How many capsules per day?** [1 / 2 — confirm].
- **Is it third-party tested?** Yes — full COA on this page.
- **Shipping & returns?** [Ships from US via Amazon · free over $39 · 60-day money-back].
- **Is it safe?** Made in a cGMP facility. Talk to your doctor if pregnant, nursing, or on medication.

### Footer（legal — 必備)
> *These statements have not been evaluated by the Food and Drug Administration. This product is not intended to diagnose, treat, cure, or prevent any disease.*
> Policies · Contact · COA library · © HYGIEIAS

---

## 待補 → 換走 `[…]`
~~G3 純度 %~~ ✅ ≥99% ・ COA PDF + lab 名 + batch ・ cGMP 廠名 ・ other ingredients ・ 劑量(1 vs 2 粒)・ NMN/NAD⁺ 兩條中性 citation ・ 運費/免運確認。
> 待 confirm:99% 係咪 G1 / G3 兩 grade 都一樣(分兩 grade 通常有差異)。

## Powder PDP（同骨架,差異)
Hero 改打 **$/g $0.45 hero number**;spec 加「scoop = 500mg」+ 量匙說明;對比表 powder $/g 殺全場;其餘 section 沿用。

## Log
- 2026-06-24:Capsule hero PDP wireframe + copy v1(Direction A,claims-safe,含 FDA disclaimer)。待真數據換 placeholder。
