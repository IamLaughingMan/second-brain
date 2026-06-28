---
type: resource
para: resource
domain: nmn
title: "Product Line Architecture & Roadmap"
status: draft
version: v3
created: 2026-06-28
updated: 2026-06-28
tags:
  - nmn
  - business
  - product
  - roadmap
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[overview]]"
---

# Product Line Architecture & Roadmap

The HYGIEIAS portfolio is a **branded house**: one masterbrand running one transparency engine across two named collections. Foundations is the trust base and recurring-revenue engine; Longevity is the halo, the higher-AOV (Average Order Value) acquisition engine, and the home of the NMN (Nicotinamide Mononucleotide) flagship. Both lines run the *identical* Decoded Panel, the same COA (Certificate of Analysis) / QA (Quality Assurance) program, the same /verify lot-lookup portal, and the same design system. The only differences between the two lines are (1) the claims/price posture and (2) a single orange accent stripe. Everything else is shared infrastructure — and that shared infrastructure is the moat.

This document defines the two lines, the SKU (Stock Keeping Unit) naming/numbering system, how each product expresses the transparency spine, the phased launch roadmap, and the portfolio/cross-sell logic.

---

## 1. The Two Lines

### HYGIEIAS Foundations — the trust base / retention engine

**What it is.** Daily essentials. Commodity molecules where the purchase decision is purity, dose, form, and price-per-dose — the decoded-commodity wedge in its purest form.

**Why it exists.** It is the recurring-revenue base (illustrative industry benchmarks: category repurchase ~38%; subscription LTV [Lifetime Value] $300–600 — *To confirm against our own cohort once live*) and, just as importantly, it is the **proof-of-character layer**: most Foundations SKUs are *independently verifiable by the customer* (anyone can confirm creatine is monohydrate, or check elemental magnesium math). That easy-to-verify honesty is what underwrites belief in the harder-to-verify Longevity grades.

**Claims posture.** Confident, established RDI (Recommended Daily Intake) structure/function language ("supports normal energy metabolism," "supports muscle and nerve function"). Mostly old/established ingredients → no NDI (New Dietary Ingredient) burden → **Amazon-safe from day one.** Lowest enforcement risk.

**Pricing posture.** Pure commodity pricing positioned *between* NOW Foods (cheap but opaque/downmarket) and Thorne/Pure Encapsulations (premium but COA-gated). "Fair price, shown math."

**Label tell.** Navy-only label (`#1B2A4A`).

### HYGIEIAS Longevity — the halo / acquisition / AOV / margin engine

**What it is.** The healthspan hero category, led by the NAD+ (Nicotinamide Adenine Dinucleotide) system. NMN is the flagship.

**Why it exists.** Higher-AOV hero category (~14% CAGR [Compound Annual Growth Rate], reportedly several times the broader supplement industry — *To confirm current figures*). It is an **education market** — awareness of NMN/NAD+ is still low and purchase conversion lags interest (specific penetration figures *To confirm*) — so clinical transparency and plain-language science, not hype, are the conversion levers. The Longevity halo ("we did radical transparency where everyone overclaims") flows credibility *downward* to Foundations; Foundations' everyday verifiability flows belief *upward* to Longevity.

**Claims posture.** The MOST conservative in the house. NAD+ / cellular-energy support ONLY; never anti-aging, never disease. The Evidence Grade badge is prominent, paired with the honesty clause: **"The research is real but still early — and we'll show you exactly how early."** Hardest claims-review gate; each novel active gated on its own NDI + substantiation review.

**Pricing posture.** Still fair / no-luxury-markup, but justifiably pricier on rare-ingredient cost. "Price reflects formulation cost" carries the weight.

**Label tell.** Navy label + a single orange accent stripe (`#D9531E`).

### Why two lines under one masterbrand (the branded-house logic)

For HYGIEIAS the entire moat IS trust/transparency — a compounding asset. A branded house concentrates that one asset in ONE name: PR, SEO, the COA program, the Transparency Standard, /verify, and the Evidence Grade all accrue to HYGIEIAS. A house-of-brands would force us to rebuild trust N times (capital-prohibitive for a startup, and self-defeating when trust *is* the product). Deciem itself consolidated its sprawling house of brands down to a focused core, running its transparency engine inside essentially ONE brand (The Ordinary).

**The trade-off we accept (and fund for).** In a branded house, every SKU inherits HYGIEIAS trust — so one bad batch, one missed COA, or one over-optimistic grade hits ALL SKUs and contradicts our own published Standard. Therefore the per-lot COA, the named certification, and the full-label promise are **not marketing overhead — they are the product.** QA is staffed and funded as the moat from day one, and **no batch ships before its COA posts to /verify.**

### Line differentiation = ONE accent device, nothing more

| | Foundations | Longevity |
|---|---|---|
| Label | Navy-only | Navy + one orange accent stripe |
| Claims voice | Confident, established RDI structure/function | Most conservative; "real but still early" + Evidence Grade |
| Pricing | Pure commodity, "fair price, shown math" | Fair, "price reflects formulation cost" |
| NDI burden | Mostly none (Amazon-safe) | Per-active NDIN (New Dietary Ingredient Notification) gate |
| Role | Trust base, retention/LTV | Halo, acquisition/AOV/margin |

Same bottle/label kit, same monospace Decoded Panel. The stripe is the only visual tell — and it signals the claims/price posture. This solves the no-photography constraint: the label *text* is the only thing that changes, scaling to ~16 SKUs at near-zero design cost.

---

## 2. SKU Naming & Numbering System

Two layers. The consumer **name** is literal and human; the SKU **code** is operational and drives COA/lot lookup. The literalness of the name is itself the front-line transparency expression (the anti-NIOD rule: never let an internal code be the consumer-facing name).

### Layer 1 — Consumer-facing NAME

**Name = Ingredient + Form/Salt + Dose-per-serving (+ format if needed).**

The name IS the spec sheet, IS the search/AI retrieval anchor, IS the differentiator on a uniform label. No invented hero names, no acronyms-as-names. Always disclose FORM, and for minerals always disclose ELEMENTAL dose.

### Layer 2 — Operational SKU CODE

**Code = [Line]-[Ingredient]-[Dose].**
- Line prefix: **F** = Foundations, **L** = Longevity, **S** = Stack.
- Ingredient = 3–5 char mnemonic.
- Dose = numeric, in the label's unit (per-serving dose distinguishes format variants of the same molecule — e.g. capsule `L-NMN-300` vs powder `L-NMN-500`).

The COA panel appends the lot — the key into /verify. The code is for catalog order, batch/COA lookup, and shelf logic only — never the primary consumer name.

**Lot convention: YYMM + run letter** (`2406A` = 2024-06, run A).

### Worked examples

| Consumer name | SKU code | COA-panel form (with lot) |
|---|---|---|
| NMN 300 mg (≥99% beta) | `L-NMN-300` | `L-NMN-300 · Lot 2406A` |
| NMN Powder 500 mg/serving (100 g, ≥99% beta) | `L-NMN-500` | `L-NMN-500 · Lot 2406A` |
| Creatine Monohydrate 5 g (Creapure) | `F-CREA-5000` | `F-CREA-5000 · Lot 2406A` |
| Magnesium Glycinate 200 mg (elemental) | `F-MAG-200` | `F-MAG-200 · Lot 2407B` |
| The Healthspan Stack (Foundation Stack + NMN) | `S-HEALTHSPAN` | n/a (bundle of member COAs) |

### The ~16-line system (codes are stable; doses/forms can extend)

```
FOUNDATIONS (F)
  F-CREA-5000   Creatine Monohydrate 5 g (Creapure)        [Wave 1]
  F-MAG-200     Magnesium Glycinate 200 mg (elemental)     [Wave 1]
  F-D3K2-5000   Vitamin D3 + K2 5000 IU                    [Wave 1]
  F-OMG3-1000   Omega-3 1000 mg (660 EPA / 330 DHA)        [Wave 2]
  F-ZINC-15     Zinc Bisglycinate 15 mg                    [Wave 3]
  F-BCMX-1      B-Complex (Methylated)                     [Wave 3]
LONGEVITY (L)
  L-NMN-300     NMN 300 mg (≥99% beta)                     [Wave 1 — FLAGSHIP, capsule]
  L-NMN-500     NMN Powder 500 mg/serv · 100 g (≥99% beta) [Wave 1 — flagship, value format]
  L-UBQL-100    CoQ10 Ubiquinol 100 mg (Kaneka)            [Wave 2]
  L-UROA-500    Urolithin A 500 mg (Mitopure)             [Wave 3, gated]
STACKS (S — the front door)
  S-FOUND       The Foundation Stack (CREA+MAG+D3K2+OMG3)  [Wave 1/2]
  S-NAD         The NAD+ Protocol (NMN + CoQ10)            [Wave 2]
  S-HEALTHSPAN  The Healthspan Stack (Foundation Stack+NMN)[Wave 1 — bridge]
PARKED (documented, not launched)
  L-NR-300      NR / Niagen — ChromaDex license-or-litigate
  L-RESV-500    Resveratrol — too weak to lead honestly
  L-SPD         Spermidine — early + wheat-allergen hazard
  L-FIS         Fisetin — too early + senolytic framing claims-risky
```

12 active SKUs (6 Foundations + 3 Longevity + 3 Stacks; the NMN line ships in two formats — capsule + powder — which count as one product line) + 4 parked = a 16-line system. **Adding SKU #17 is fill-in-the-template, not a redesign.**

### Naming Constitution (one page, part of the Transparency Standard)

Every new SKU must:
1. **Name** = Ingredient + Form + Dose (disclose elemental mg for minerals; EPA/DHA mg for omega-3; per-ingredient dose for combos — e.g. D3 in IU **and** K2 in mcg).
2. Belong to **exactly ONE line** (F or L; S for bundles only).
3. Receive an **F/L/S code**.
4. Use the **shared label template + Decoded Panel + lot COA**.
5. Ship **ALL required data fields BEFORE it can launch**: purity %, elemental/EPA-DHA where relevant, form rationale, price-per-dose AND price-per-gram, Evidence Grade, named certification if held, DSHEA (Dietary Supplement Health and Education Act)/FTC (Federal Trade Commission)-reviewed copy, and its COA posted to /verify.

Prune ruthlessly; resist needless form/dose proliferation (the Deciem lesson).

---

## 3. How Each Product Expresses the Transparency Spine

*Note: only NMN is locked on spec (≥99% beta, 300 mg capsule / 500 mg-serving powder). All other ingredient specs below — forms, branded ingredients, doses — are **proposed targets pending sourcing and COA**, not finalized facts.*

### The shared template — THE FIVE DECODES

Stamped identically (same monospace block) on every PDP (Product Detail Page) and every label, both lines:

1. **THE MOLECULE** — ingredient + form/salt + exact dose per serving. Form is where cheap brands hide quality; naming it IS the flex.
2. **THE PURITY** — assayed purity % as a number (NMN ≥99% beta-form; omega-3 adds TOTOX [Total Oxidation value] + exact EPA/DHA mg). Never "high quality."
3. **THE PROOF** — lot-matched COA pulled by batch via /verify, plus a named third-party certification where held (USP Verified / NSF / Clean Label Project). Never the empty phrase "third-party tested."
4. **THE PRICE** — price-per-dose AND price-per-gram, computed and shown, with a one-line "priced on formulation cost, not marketing" note.
5. **THE REASONING** — a one-line FORM RATIONALE plus an honest **EVIDENCE GRADE** (Strong / Moderate / Early).

### Foundations — transparency expression per SKU

- **Creatine Monohydrate 5 g (`F-CREA-5000`)** — "monohydrate is the only form that matters — ignore the blends." Creapure (German) as the reference grade; trivially cheap price-per-gram shown proudly. Customer-verifiable. Evidence Grade: **Strong.**
- **Magnesium Glycinate 200 mg (`F-MAG-200`)** — **disclose ELEMENTAL mg** (most labels hide low elemental %); glycinate-vs-cheap-oxide form rationale; honest "low elemental density = multi-capsule dose" note. Claims kept to "supports normal muscle and nerve function" (no unsubstantiated sleep/relaxation claims). Evidence Grade: **Strong.**
- **Vitamin D3 + K2 5000 IU (`F-D3K2-5000`)** — IU disclosure (and disclose K2 in mcg — "5000 IU" names the D3 only, per our per-ingredient disclosure rule); D3-vs-D2 and MK-7-vs-MK-4 education. Evidence Grade: **Strong** (D3), **Moderate** (K2 synergy).
- **Omega-3 1000 mg / 660 EPA / 330 DHA (`F-OMG3-1000`)** — the transparency-ARBITRAGE SKU: publish TOTOX + exact EPA/DHA mg + heavy-metals COA in a category plagued by oxidation and mislabeling; algae option for vegan. Honest evidence framing (supports triglyceride levels already within the normal range; cardiovascular primary-prevention RCTs [randomized controlled trials] largely null). Evidence Grade: **Moderate.**
- **Zinc Bisglycinate 15 mg (`F-ZINC-15`)** — disclose elemental mg + bisglycinate-vs-oxide form rationale; "supports normal immune function" structure/function. Evidence Grade: **Strong.**
- **B-Complex, Methylated (`F-BCMX-1`)** — methylfolate/methylcobalamin vs cheap folic acid/cyanocobalamin is a genuine decoded story; full label disclosure, no proprietary blend. Claims kept to structure/function (energy metabolism, nervous-system support); we do NOT frame it as treating deficiency, and "energy" is deliberately not overhyped. Evidence Grade: **Moderate.**

### Longevity — transparency expression per SKU

- **NMN 300 mg (`L-NMN-300`, FLAGSHIP; also powder `L-NMN-500`)** — ≥99% beta-NMN purity %; beta- vs alpha-form disclosure; enzymatic-vs-chemical synthesis note; lot COA (purity + heavy metals + microbial); price-per-gram vs market; NDIN/supplier-coverage statement; and an honest evidence box: *"NMN is a precursor the body uses to make NAD+ (which is involved in cellular energy metabolism). Human functional-outcome trials remain small and early, with improvements often not reaching statistical significance (Wen et al. 2024); safety/tolerability has been good in trials (Fukamizu et al. 2022)."* Evidence Grade: **Early.**
- **CoQ10 Ubiquinol 100 mg (`L-UBQL-100`, Kaneka)** — ubiquinol-vs-ubiquinone form rationale; Kaneka branded callout; dose disclosure; lot COA. Honest note that the strongest data sits in disease contexts we cannot claim → cellular-energy/heart structure/function only. Evidence Grade: **Moderate.**
- **Urolithin A 500 mg (`L-UROA-500`, Mitopure)** — mitophagy mechanism in plain language; Mitopure (Amazentis) GRAS/branded form for COA/IP (Intellectual Property) integrity; "trials largely sponsor-funded" honesty note. **Do NOT sell uncertified generic — it breaks the spine.** Evidence Grade: **Moderate**, gated.

---

## 4. Phased Roadmap

Phased to BOTH regulatory/NDI risk AND "earn trust on boring things, then spend it on the hero." **NMN ships first (locked), flanked by high-evidence foundationals.** The brand leads with the transparency engine; ad spend leads on Amazon-safe, NDI-free foundationals — so the foundationals fund cash flow and the QA/COA moat while the NMN halo provides the loud launch narrative.

### Phase 0 — Pre-launch gates (hard blockers; the infrastructure IS the launch)

- **NMN:** secure a company-specific NDIN OR contract a supplier who holds one — the two suppliers with public FDA letters are **SyncoZymes (NDI #1247)** and **Kingdomway (NDI #1259)** (self-affirmed GRAS does NOT suffice). Keep a documented pre-2022 "marketed as a supplement" evidence trail. Source ≥99% beta-NMN with per-batch COAs.
- **Stand up /verify + publish Transparency Standard v1.0 on day one** — they ARE the launch, not a follow-on.
- NMN was reinstated on Amazon as of **Dec 2025** (following the FDA NDI letters), but **re-verify Amazon's current NMN listing policy** before committing FBA/MCF (Fulfillment by Amazon / Multi-Channel Fulfillment). Contingency: Shopify DTC carries NMN; Amazon carries Foundations if NMN listing stays patchy.
- Confirm whether any FDA traceability/labeling rule applies to our products (e.g., the **FSMA 204 Food Traceability Rule**) — note most dietary supplements are exempt; *To confirm applicability and any effective date* before finalizing labels.
- Stand up the **claims-review gate**: structure/function only, disclaimer linked to each claim, FDA 30-day post-market notification per structure/function claim, FTC substantiation = competent-and-reliable (RCT-grade) scientific evidence.

### Wave 1 — Build trust around the hero (launch)

**`L-NMN-300` (+ powder `L-NMN-500`, the value format) + `F-CREA-5000` + `F-MAG-200` + `F-D3K2-5000`**, fronted by the **`S-FOUND`** starter and the **`S-HEALTHSPAN`** bridge bundle. (**`S-NAD`** follows in Wave 2 once CoQ10 is live.)

*Logic:* pairs the speculative hero with the three highest-evidence, lowest-risk, cheapest, Amazon-safe foundationals (creatine is the single best fit on all four axes). Customer-verifiable creatine/elemental-magnesium honesty underwrites the harder-to-verify NMN grade. Launch narrative leads with the halo: "we did the hardest thing — radical transparency where everyone overclaims."

| SKU | Evidence tier | Claims-safety note (DSHEA/FTC) | Sourcing feasibility |
|---|---|---|---|
| `L-NMN-300` NMN 300 mg | **Early** | NAD+ / cellular-energy support ONLY; "real but still early"; highest claims-gate; lawful post-29 Sep 2025 but volatile ground | Moderate–High (gated on NDIN). Raw NMN ≈ **USD 180/kg ($0.18/g)** at our recorded sourcing, ≥99% (*To confirm current spot pricing*); ≥99% assay + enzymatic-vs-chemical synthesis matter; **NDIN coverage mandatory (SyncoZymes #1247 / Kingdomway #1259 chains)** |
| `F-CREA-5000` Creatine Monohydrate 5 g | **Strong** | Muscle strength + exercise performance structure/function; phrase cognition carefully; LOW risk | Easy/cheap commodity; Creapure (German) as the honest reference grade vs generic |
| `F-MAG-200` Magnesium Glycinate 200 mg | **Strong** | Supports normal muscle and nerve function (structure/function); avoid unsubstantiated relaxation/sleep claims; LOW risk | Easy/cheap; low elemental density → multi-capsule dose (owned honestly) |
| `F-D3K2-5000` Vitamin D3 + K2 5000 IU | **Strong** (D3) / **Moderate** (K2) | Bone + immune support; LOW risk | Very cheap/easy; MK-7 K2 sourcing standard |

### Wave 2 — Transparency arbitrage + safe longevity

**`F-OMG3-1000` + `L-UBQL-100`.** Completes `S-FOUND`; `S-NAD` goes live.

*Logic:* Omega-3 is the strongest transparency-arbitrage play (dirty category → publishing TOTOX + exact mg + COA is a pure credibility win and deepens the repurchase base). Ubiquinol is the best-evidenced, safest second Longevity SKU and ensures the halo is **not single-molecule-dependent.**

| SKU | Evidence tier | Claims-safety note (DSHEA/FTC) | Sourcing feasibility |
|---|---|---|---|
| `F-OMG3-1000` Omega-3 1000 mg (660 EPA/330 DHA) | **Moderate** | Supports triglyceride levels already within the normal range (structure/function); NO heart-disease-prevention claims (CV primary-prevention RCTs largely null); LOW–Moderate risk | Moderate. Cheap base oil but high-EPA concentrates / algae cost more; rancidity/cold-chain risk = the reason TOTOX disclosure wins |
| `L-UBQL-100` CoQ10 Ubiquinol 100 mg (Kaneka) | **Moderate** | Cellular-energy / heart structure/function ONLY (strongest data is in disease contexts we cannot claim); LOW–Moderate risk | Moderate. Kaneka branded ubiquinol pricier than ubiquinone; no IP trap |

### Wave 3 — Evidence/COGS-gated expansion + low-cost components

**`L-UROA-500` + `F-ZINC-15` + `F-BCMX-1`.**

*Logic:* Urolithin A only if Mitopure licensing economics work — never uncertified generic (IP infringement + no GRAS/COA breaks the spine). Zinc and methylated B round out Foundations with genuine decoded stories at low AOV.

| SKU | Evidence tier | Claims-safety note (DSHEA/FTC) | Sourcing feasibility |
|---|---|---|---|
| `L-UROA-500` Urolithin A 500 mg (Mitopure) | **Moderate**, gated | Muscle / cellular-energy structure/function (a modest strength/endurance signal in largely sponsor-funded trials — *effect size To confirm*; GRAS helps); LOW–Moderate risk | High COGS + **IP gate** — Mitopure (Amazentis) license economics must clear; *To confirm licensing terms* |
| `F-ZINC-15` Zinc Bisglycinate 15 mg | **Strong** | Immune + structure/function; disclose elemental mg; LOW risk | Cheap/easy; low standalone AOV (component play) |
| `F-BCMX-1` B-Complex (Methylated) | **Moderate** | Structure/function (energy metabolism, nervous-system support); avoid "corrects deficiency" (disease) framing; do NOT overhype "energy"; LOW risk | Easy; methylated forms cost modestly more (the decoded story) |

### Parked (documented, not launched — re-evaluate as data/IP matures)

| SKU (code) | Why parked |
|---|---|
| `L-NR-300` NR / Niagen | Cleanest regulatory path (two NDINs + GRAS) BUT ChromaDex license-or-litigate IP lock-in — the exact trap NMN-first was chosen to avoid. Revisit only as a *licensed* second NAD+ SKU / evidence hedge. |
| `L-RESV-500` Resveratrol | WEAK human evidence (very low oral bioavailability). The classic NMN upsell, but leading with it would betray the spine — the litmus test of whether HYGIEIAS walks its talk. If ever offered: labeled "Early, low bioavailability." |
| `L-SPD` Spermidine | Early + a real wheat-allergen labeling hazard. |
| `L-FIS` Fisetin | Too early; the tempting senolytic/anti-aging framing is exactly what DSHEA/FTC forbid. |

Holding these back IS the spine working.

---

## 5. Portfolio & Cross-Sell Logic

### Navigation = transparency-first, dual-axis, curated STACKS as the front door

Do NOT dump SKUs on the homepage (the anti-paradox-of-choice rule — The Ordinary's own failure mode).

- **Front door = pre-built stacks + a guided Stack Builder** (goal in → protocol out → multi-SKU basket).
- **Power-user axes underneath:** by **LINE**, by **GOAL** (Thorne-style health-need), and — the transparency-max signature — **browse by PROOF** (filter/sort by "USP/NSF certified," "Evidence: Strong," "≥99% purity," "lowest price-per-dose"). Making transparency a *navigation axis* is what distinguishes HYGIEIAS from a generic spine.

### The Stacks (the front door, and the cross-sell machinery)

| Stack | Code | Members | Role |
|---|---|---|---|
| The Foundation Stack | `S-FOUND` | CREA + MAG + D3K2 + OMG3 | Foundations "start here"; subscribe-and-save LTV anchor (launches as a CREA+MAG+D3K2 starter in Wave 1; OMG3 added in Wave 2) |
| The NAD+ Protocol | `S-NAD` | NMN + CoQ10 Ubiquinol | Longevity AOV lift; halo not single-molecule-dependent (Wave 2, once CoQ10 is live) |
| **The Healthspan Stack** | `S-HEALTHSPAN` | Foundation Stack + NMN | **The bridge bundle** — "keep your base, add the frontier" |

`S-HEALTHSPAN` is the load-bearing cross-sell asset: it pulls the foundational base into the higher-margin Longevity upsell and is the literal expression of the branded house. It launches in Wave 1 (with the Wave 1 Foundation starter + NMN).

### Cross-subsidy of trust (why the portfolio compounds)

- **Longevity halo → downward:** radical honesty where everyone overclaims lends credibility to the whole house.
- **Foundations verifiability → upward:** customer-confirmable honesty on cheap, boring SKUs underwrites belief in the NMN Evidence Grade.
- Every reusable asset (Transparency Standard, /verify, COA program, Evidence Grade, browse-by-PROOF) accrues to ONE name.

### Commercial model

One-time purchase AND subscription — **never subscription-only** (Ritual's friction; Care/of's shutdown under Bayer). Foundationals = the subscribe-and-save LTV engine; Longevity = higher-AOV acquisition. Engineer onboarding against the first-month churn cliff (industry benchmarks suggest ~20–30% first-month, settling to a ~5–8% steady-state cohort — *To confirm against our own data*) with education-led, transparency-reinforcing onboarding to convert trial into the steady-state cohort. Target **≥3:1 LTV:CAC** (Customer Acquisition Cost). Monetize NMN's AOV/margin/PR pull to fund the per-batch testing and house-wide COA infrastructure the engine requires.

### Instrument the cross-sell (it is an assumption, not a fact)

The bridge thesis — that Longevity-acquired buyers convert into foundational subscribers — must be measured, not assumed. Instrument from day one: the `S-HEALTHSPAN` attach rate, the Longevity→Foundations cross-sell rate, and subscribe-and-save conversion. If the bridge underperforms, lean acquisition harder on Foundations and treat NMN as the margin/PR engine rather than the funnel top.

### NMN shock-isolation (the portfolio's risk firewall)

Because NMN's US status is volatile (2022 FDA exclusion → ~2023 Amazon delist → 29 Sep 2025 FDA reversal → Dec 2025 NDI letters reinstated; still NDI-gated and ground volatile), NMN is contained as **ONE molecule (two formats: capsule `L-NMN-300` + powder `L-NMN-500`)** inside Longevity, sitting on a stable Foundations revenue base. An NMN re-ban / Amazon delist / NDI problem damages one product line, not HYGIEIAS — and the Foundations line can carry Amazon alone. The architecture *enforces* the locked decision that NMN is the first product, never the brand.

### The one portfolio-level risk to never relax

In a branded house the moat is also a single point of failure: one bad batch / missed COA / over-optimistic grade hits ALL SKUs and contradicts the published Standard. The mitigation is non-negotiable and structural — **QA funded as the product, conservative Evidence Grades, and no batch shipped before its COA posts to /verify.** That discipline is what lets the portfolio compound instead of cascade.
