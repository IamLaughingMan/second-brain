---
type: resource
para: resource
domain: nmn
title: "Website IA (multi-product)"
status: draft
version: v3
created: 2026-06-28
updated: 2026-06-28
tags:
  - nmn
  - business
  - web
  - ia
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[overview]]"
---

# Website IA (multi-product)

HYGIEIAS multi-product information architecture (IA). Replaces the current single-product NMN-only site (home + one PDP). Built as a **branded house**: one masterbrand, two named lines (Foundations, Longevity), Stacks as the front door, and the transparency engine (the Five Decodes + `/verify` + Transparency Standard + Evidence Grade) wired into the IA as the organizing system — not a feature page. Every structure below is **data-driven from one product schema** so adding roadmap SKUs (Stock Keeping Units) is fill-in-the-template, not a redesign.

Conventions: routes are illustrative on `hygieias.com`; the platform is Shopify own-store + Amazon (this doc covers the Shopify own-store; Amazon mirrors PDP content as A+ where allowed). Exact Shopify app choices are marked **To confirm**.

> ### ⚠️ Reality vs roadmap (data status, 2026-06-27 — read first)
> Only **NMN** has confirmed product data today, as **two SKUs**: **NMN Capsule** (300 mg × 60, ≥99% per COA) and **NMN Powder** (100 g, 500 mg/serving, ≥99% per COA). **Everything else below** — the **Foundations** line, all non-NMN products, every **Stack**, and all of their doses, prices, lot numbers, certifications, and Evidence Grades — is **illustrative placeholder / To confirm**, not committed.
> The IA is built multi-product-ready on purpose, but **at launch only NMN's two SKUs are published**; every non-NMN node stays dark until its schema + posted COA exist (the extensibility contract, §10). This is exactly how the house earns its "NMN-first" launch while staying ready for the line.
> Two further honesty notes: (a) HYGIEIAS currently holds **no** USP / NSF / Clean Label Project certification — the real, live proof is the **published lot-COA + cGMP manufacture + NDI-compliant ingredient**; cert seals/filters render only for SKUs that actually earn them. (b) The framework names coined in this doc (the **Five Decodes**, **Transparency Standard**, **Evidence Grade**, **Naming Constitution**) are **proposed here, not yet ratified**.

---

## 1. Sitemap

```
/                                   Home (masterbrand, multi-product house)
│
├── /collections/foundations        Line: HYGIEIAS Foundations (navy) — roadmap, no SKUs live yet
├── /collections/longevity          Line: HYGIEIAS Longevity (navy + orange stripe) — NMN live
├── /collections/all                Full A–Z catalog (power-user)
│
├── /stacks                         Stacks index (THE FRONT DOOR) — roadmap until member SKUs exist
│   ├── /stacks/foundation          S-FOUND  The Foundation Stack
│   ├── /stacks/nad-protocol        S-NAD    The NAD+ Protocol
│   └── /stacks/healthspan          S-HEALTHSPAN  The Healthspan Stack (bridge)
├── /stack-builder                  Guided Stack/Regimen Builder (goal in → protocol out)
│
├── /goals                          Browse by GOAL index
│   └── /goals/<goal>               e.g. /goals/daily-foundations, /goals/energy, /goals/healthspan
├── /proof                          Browse by PROOF index (the transparency-max axis)
│
├── /products/<slug>                Reusable PDP (Product Detail Page) — every SKU
│   LIVE:     /products/nmn-300 (capsule), /products/nmn-powder-100g
│   roadmap:  /products/magnesium-glycinate, /products/creatine-monohydrate, … (illustrative)
│
├── /verify                         House-wide lot-number COA (Certificate of Analysis) lookup
│   └── /verify/<lot>               Deep-link to a specific lot's COA
│
├── /transparency-standard          The HYGIEIAS Transparency Standard (versioned constitution)
├── /evidence                       Evidence Grade explainer + honesty clause
│
├── /learn                          Education hub
│   ├── /learn/<article>            Plain-language science (e.g. what-is-nad)
│   └── /learn/<molecule>           Per-molecule explainers (retrieval anchors)
│
├── /about                          Masterbrand: who we are, the spine
│   └── /about/hygieia              The Hygieia (goddess of health) story (masterbrand only)
│
├── /account                        Account dashboard
│   ├── /account/subscriptions      Subscribe-and-save management
│   ├── /account/orders             Orders → lot-matched COA for what you received
│   ├── /account/addresses
│   └── /account/profile
│
├── /search                         Global search (molecule-first)
├── /cart  /checkout                Purchase flow
│
└── Footer/legal: /shipping /returns /contact /privacy /terms
                  /transparency-standard /verify /evidence
```

**Stable URL grammar (extensibility contract):** products always `/products/<ingredient-form-dose>` (capsule and powder are different forms → different slugs); lines always `/collections/<line>`; stacks always `/stacks/<slug>`; COA always `/verify/<lot>`. New SKU = new `/products/` slug only; it auto-appears in its line collection, its goal pages, and proof filters from metadata. No new templates.

---

## 2. Primary navigation

Persistent header, two zones. **Left/center = browse + trust; right = utility.** The two lines, Learn, About, and COA-lookup are all reachable from the top level, per the locked nav requirement.

```
[ HYGIEIAS wordmark ]   Foundations ▾   Longevity ▾   Stacks ▾   Learn ▾   The Standard   ⟂        🔍  Verify  Account  Cart(n)
        (navy logo)        (line)         (line)       (front     (edu)    (constitution)            (search)(COA)
                                                        door)
```

Decisions:
- **Foundations / Longevity** are top-level (not buried under a generic "Shop") — the line split is the brand architecture and must be legible. Each opens a **mega-menu**. (At launch Foundations shows a "coming soon / roadmap" state; Longevity carries the live NMN SKUs.)
- **Stacks** is given equal top-level weight as the deliberate anti-paradox-of-choice front door (populates once member SKUs publish).
- **The Standard** = the Transparency Standard constitution, surfaced in nav (not just footer) because the public constitution is a signature moat asset.
- **Verify** = the `/verify` COA-lookup, top-right as a standing utility (it is printed on every label, so customers arrive looking for it). This is the nav home of "COA" per the brief.
- **Learn / About** present; About holds the Hygieia masterbrand story.
- No single product (not even NMN) sits in the top nav — the house leads, products are reached via line/stack/goal/proof.

**Mega-menu — Foundations ▾**  *(roadmap — illustrative; no SKUs live yet, doses To confirm)*
```
SHOP FOUNDATIONS  *               BY GOAL                    THE LINE
  Creatine Monohydrate             Daily foundations          Navy label · established
  Magnesium Glycinate              Energy & metabolism        structure/function claims
  Vitamin D3 + K2                  Muscle & performance       Amazon-safe · commodity-fair
  Omega-3 (EPA/DHA)                Sleep & relaxation         price
  Zinc Bisglycinate              BROWSE BY PROOF            → See all Foundations
  B-Complex (Methylated)           Published lot-COA
  * specs/doses To confirm         Evidence grade (per SKU)
                                   Lowest price-per-dose
```

**Mega-menu — Longevity ▾**
```
SHOP LONGEVITY                          BY GOAL                    THE LINE
  NMN 300 mg (≥99%)  ★ [LIVE]            Healthspan / NAD+          Navy + orange stripe
  NMN Powder 100 g (≥99%) [LIVE]         Cellular energy            "The research is real but
   — $/g leader                        EVIDENCE                     still early."
  CoQ10 Ubiquinol  * (roadmap)           Every grade shown openly   Most conservative claims
  Urolithin A  * (gated)               → Evidence Grade explained → See all Longevity
  * specs/doses To confirm
```

**Mega-menu — Stacks ▾**  *(roadmap — go live as member SKUs publish)*
```
PRE-BUILT PROTOCOLS              BUILD YOUR OWN
  The Foundation Stack             Stack Builder →
  The NAD+ Protocol                (goal in → protocol out)
  The Healthspan Stack ★ (bridge)
```

**Mobile:** hamburger → accordion in the same order (Foundations, Longevity, Stacks, Learn, The Standard); Verify + Search + Account + Cart as persistent icons. Stacks/Stack Builder pinned to top of the drawer (front-door priority).

---

## 3. Page types

| # | Page type | Route pattern | Template? | Purpose |
|---|---|---|---|---|
| 1 | Home (house) | `/` | unique | Masterbrand front door; lead with engine + stacks |
| 2 | Line collection | `/collections/<line>` | shared collection | Foundations / Longevity grids + proof filters |
| 3 | Full catalog | `/collections/all` | shared collection | Power-user A–Z |
| 4 | Goal collection | `/goals/<goal>` | shared collection | Health-need grouping (Thorne-style) |
| 5 | Proof index/filter | `/proof`, filter states | shared collection | Browse-by-PROOF (signature axis) |
| 6 | Stacks index | `/stacks` | shared collection | Curated protocols |
| 7 | Stack detail | `/stacks/<slug>` | **stack PDP template** | Bundle PDP + member roll-up |
| 8 | Stack Builder | `/stack-builder` | unique tool | Guided regimen → multi-SKU basket |
| 9 | **Product (PDP)** | `/products/<slug>` | **reusable PDP template** | Every SKU (see §4) |
| 10 | Verify / COA portal | `/verify`, `/verify/<lot>` | unique tool | House-wide lot lookup |
| 11 | Transparency Standard | `/transparency-standard` | unique | Versioned constitution |
| 12 | Evidence Grade | `/evidence` | unique | Grade scale + honesty clause |
| 13 | Learn hub + article | `/learn`, `/learn/<x>` | hub + article | Education / retrieval anchors |
| 14 | About / Hygieia | `/about`, `/about/hygieia` | content | Masterbrand story (only place) |
| 15 | Account suite | `/account/*` | app | Dashboard, subs, orders, COA-by-order |
| 16 | Search | `/search` | results | Molecule-first global search |
| 17 | Cart / Checkout | `/cart`, `/checkout` | commerce | Purchase, with trust reassurance |
| 18 | Legal/support | footer routes | content | Shipping, returns, policy |

Only **5 reusable templates** carry the whole catalog (PDP, stack PDP, collection, article, account). Everything scales off them.

---

## 4. Reusable PDP template (works for any product)

The PDP is the load-bearing template. It renders from the **product schema** (§9, §10) so NMN, and any future magnesium, omega-3, or later SKU all use the identical layout — only field values and the line accent change. The **Decoded Panel (the Five Decodes)** is byte-for-byte identical in structure on every SKU; that uniformity *is* the transparency signal.

**Module order (top → bottom):**

```
┌────────────────────────────────────────────────────────────────────┐
│ Breadcrumb:  Home › Longevity › NMN 300 mg        [LINE STRIPE]      │  navy, or
│                                                    navy+orange (Long.)│
├──────────────────────────────┬─────────────────────────────────────┤
│  A. SPEC HERO                │  B. BUY BOX                          │
│  • SVG bottle/label mockup   │  • Price | price-per-dose | per-gram │
│    (NO photography)          │  • Format selector (capsule ⟷ powder)│
│  • Product NAME = the spec   │  • One-time ⟷ Subscribe & save toggle │
│    "NMN 300 mg (≥99%)"       │    (never sub-only)                  │
│  • SKU code: L-NMN-300       │  • Add to cart / Add to a stack      │
│  • One-line literal descr.   │  • Cert seals (only those a SKU      │
│  • PURITY % big callout      │    actually holds — none for NMN;    │
│  • "Verify this batch → /verify    lot-COA always shown)            │
│     · current lot [# from COA]"  • Evidence Grade badge             │
├──────────────────────────────┴─────────────────────────────────────┤
│  C. THE DECODED PANEL  — monospace, identical on every SKU          │
│  ┌──────────────────────────────────────────────────────────────┐  │
│  │ 1 THE MOLECULE   NMN · β-nicotinamide mononucleotide · 300 mg │  │
│  │ 2 THE PURITY     ≥99% (per COA)                               │  │
│  │ 3 THE PROOF      Lot-matched COA → /verify · cGMP-made ·      │  │
│  │                  NDI-compliant ingredient                    │  │
│  │ 4 THE PRICE      $X.XX / dose · $XX.XX / g · priced on        │  │
│  │                  formulation cost, not marketing              │  │
│  │ 5 THE REASONING  Form: β-NMN (form used in human studies)     │  │
│  │                  · Grade: EARLY                               │  │
│  └──────────────────────────────────────────────────────────────┘  │
├────────────────────────────────────────────────────────────────────┤
│  D. EVIDENCE BOX (honest)  — "What the research does / doesn't show" │
│     + Longevity honesty clause: "The research is real but still      │
│       early — and we'll show you exactly how early."                 │
├────────────────────────────────────────────────────────────────────┤
│  E. COA VIEWER  — lot selector → embedded COA (purity, heavy metals, │
│     micro); pulled from /verify by lot                              │
├────────────────────────────────────────────────────────────────────┤
│  F. SUPPLEMENT FACTS  — full label disclosure incl. inactives;      │
│     NO proprietary blends (Transparency Standard requirement)       │
├────────────────────────────────────────────────────────────────────┤
│  G. FORM RATIONALE / education  ("β-NMN", "glycinate not oxide")     │
├────────────────────────────────────────────────────────────────────┤
│  H. HOW TO USE / dosing                                             │
├────────────────────────────────────────────────────────────────────┤
│  I. CLAIMS + DSHEA disclaimer linked to each structure/function     │
│     claim (claims-review-gated copy)                                │
├────────────────────────────────────────────────────────────────────┤
│  J. PAIRS IN A STACK  — cross-sell to S-NAD / S-HEALTHSPAN /        │
│     "member of" callout (the regimen bridge)                        │
├────────────────────────────────────────────────────────────────────┤
│  K. Reviews   L. FAQ   M. Subscription terms + 60-day guarantee +   │
│     shipping                                                        │
├────────────────────────────────────────────────────────────────────┤
│  Footer: → The Transparency Standard · → /verify · DSHEA disclaimer │
└────────────────────────────────────────────────────────────────────┘
```

**Cross-format $/g honesty (NMN today):** because NMN ships as capsule *and* powder, the buy-box format selector surfaces **both formats' price-per-gram side by side** — the documented "we'll even tell you which form is cheaper per gram" move (capsule ≈ $1.94/g, powder ≈ $0.45/g). Showing the cheaper option openly is the transparency play, not a dark pattern.

**How the one template flexes per SKU (no new layout, just schema-driven slots):**
- **Line accent:** Foundations renders navy-only stripe; Longevity renders navy + orange stripe. Single boolean.
- **THE PURITY (Decode 2) is type-aware:** NMN → `≥99% (per COA)`; **Omega-3 → adds `TOTOX` + `EPA/DHA mg`** (values To confirm); **minerals → elemental mg** (e.g. Magnesium Glycinate → `elemental mg`, To confirm); creatine → Creapure grade *if sourced*. One field with conditional sub-fields.
- **THE PROOF (Decode 3):** the **actual lot-COA is always shown** (not a bare "third-party tested" badge); a named cert (Creapure/Kaneka/Mitopure, or USP/NSF/Clean Label Project) renders *only if the SKU actually holds it* — none do today.
- **Evidence box (D):** the honesty clause + Evidence Grade badge render prominently for Longevity, lighter for Strong-graded Foundations — same module, different emphasis from `evidence_grade`.
- **Claims block (I):** copy is per-SKU but every claim auto-pairs the DSHEA disclaimer; Longevity SKUs route through the strictest claims-review gate.
- **Gated/parked SKUs:** Urolithin A renders only when its gate flags clear; parked SKUs (resveratrol, NR, etc.) have no published PDP.

**Stack PDP variant (`/stacks/<slug>`):** same skeleton, but the Decoded Panel becomes a **roll-up table** of each member SKU's five decodes; THE PROOF reads "bundle of member COAs — verify each lot at /verify"; THE PRICE shows **bundle price + price-per-day**; buy box = "Add whole stack" with per-member swap/remove and stack-level subscription. The Healthspan Stack PDP is the explicit "keep your base, add the frontier" bridge. (Stacks publish only once their member SKUs exist.)

---

## 5. How COA / transparency surfaces site-wide

Transparency is the operating system, so it appears at **every layer**, not on one page:

| Surface | What appears |
|---|---|
| **Header (global)** | `Verify` link → `/verify`; `The Standard` link → constitution |
| **`/verify` portal** | House-wide lot-number lookup (Nordic-Naturals mechanic, whole catalog): enter lot → purity, heavy metals, micro COA. Deep-linkable `/verify/<lot>`. Printed on every physical label. |
| **Home** | Five Decodes explainer block; `/verify` lot-entry strip; Transparency Standard + Evidence Grade callouts |
| **Collection cards** | Each product card shows **purity %, Evidence Grade chip, price-per-dose, posted-COA link, line stripe** — proof is visible *before* the click (a cert seal appears only if that SKU holds one) |
| **Browse-by-PROOF** | Filter/sort axis on every collection: **Published lot-COA**, Evidence (Strong/Moderate/Early), purity %, lowest price-per-dose. (A certification filter — USP/NSF/Clean Label Project — appears only for SKUs that actually hold one; none today.) |
| **PDP** | The Decoded Panel + COA viewer + full Supplement Facts + linked DSHEA disclaimers (see §4) |
| **Stack pages** | Member-COA roll-up; per-day price math |
| **Search** | Results render purity / Evidence Grade / price-per-dose inline; a **lot number** typed into search resolves to its COA |
| **Cart / checkout** | Reassurance line: "Every batch's COA is published before it ships · 60-day money-back"; subscribe-and-save with no lock-in |
| **Account → Orders** | Each past order links the **lot-matched COA for the exact units received** (ties verification to the actual purchase) |
| **Footer (every page)** | `The Transparency Standard` · `/verify` · `Evidence Grade` · DSHEA disclaimer |
| **`/transparency-standard`** | The versioned (v1.0) public constitution: the Five Decodes, no proprietary blends, full label incl. inactives, COA published before any batch ships |
| **`/evidence`** | The grade scale (Strong / Moderate / Early) + the honesty clause; explains *why we grade our own science* |

Rule enforced in IA: **no SKU can be published whose schema lacks** purity %, price-per-dose + price-per-gram, form rationale, Evidence Grade, DSHEA/FTC-reviewed copy, and a posted lot COA. The CMS blocks publish on missing required fields — the Naming Constitution made literal.

---

## 6. Home page architecture (multi-product house vs current NMN-only home)

**What changes from today.** The current home (`web/index.html`) is a single-product NMN page: hero "NMN you can actually verify," a `Shop` (formats), `What you pay for`, `Lab reports`, `FAQ`. That structure cannot represent a two-line house and over-indexes one volatile SKU on the front door. The new home leads with the **transparency engine + Stacks**, demotes NMN to flagship-within-Longevity, and routes by line/stack/goal/proof. (At launch, Foundations and Stacks present roadmap/coming-soon states; only NMN's two SKUs are shoppable.)

**New home section stack (top → bottom):**

1. **Masterbrand hero** — wordmark + **"The molecule, not the marketing."** / descriptor **"Supplements, decoded."** + the one-liner ("Every HYGIEIAS product shows its molecule, its form, its dose, its purity %, its lot-matched COA, and its price per dose — from daily foundations to the NAD+ frontier."). Primary CTA → **Stacks / Stack Builder** (a *front door*, not a single product); until stacks are live, the primary CTA routes to the NMN flagship within Longevity. Secondary → Foundations / Longevity.
2. **The Five Decodes** — the proof-system as the company's operating system (Molecule · Purity · Proof · Price · Reasoning), each linking to where it lives (a PDP example, `/verify`, the Standard).
3. **Start here: curated Stacks** — Foundation Stack, NAD+ Protocol, **Healthspan Stack (bridge)** cards + **Stack Builder** entry. This is the deliberate anti-paradox-of-choice front door (do NOT dump SKUs here). Shows roadmap state until member SKUs publish.
4. **Two lines** — Foundations (the trust base; navy; everyday-verifiable, Amazon-safe) and Longevity (the frontier; orange stripe; "real but still early"). Shows the accent device that distinguishes them.
5. **Browse by PROOF teaser** — entry chips reflecting what's actually filterable: "≥99% purity" · "Published lot-COA" · "lowest price-per-dose" · "Evidence grade (Early/Moderate/Strong)." The signature navigation move.
6. **`/verify` strip** — "Enter your lot number" inline field → COA.
7. **The Transparency Standard** — versioned public constitution callout.
8. **Evidence Grade + honesty clause** — "we grade our own science, and label early items Early."
9. **Hygieia masterbrand story (brief)** — the goddess-of-health romance, masterbrand level **only**, kept short.
10. **Learn teaser** + email capture (lab reports / launch updates) + footer (Standard, Verify, Evidence, DSHEA).

**NMN's new home placement:** the flagship is reached via Longevity, the NAD+ Protocol / Healthspan Stack, and the launch-narrative ("we did the hardest thing — radical transparency where everyone overclaims") — featured, but as one SKU on a stable base, satisfying NMN shock-isolation. The loud launch story can spotlight NMN seasonally **within** the house frame, never as the brand identity.

---

## 7. Collection / regimen pages

**a) Line collections — `/collections/foundations`, `/collections/longevity`** (one shared template):
- Header band states the line's **claims posture + price posture + accent device** (Foundations = established structure/function, commodity-fair, Amazon-safe; Longevity = most conservative, "real but still early," fair-but-rare-ingredient priced).
- **Product grid of cards**, each card = name(=spec) + purity % + Evidence Grade chip + price-per-dose + posted-COA link + line stripe + "Add to cart / Add to a stack." (A cert seal shows only if that SKU holds one.)
- **Left filter rail = Browse by PROOF + Goal** (Published lot-COA, Evidence Grade, purity %, price-per-dose, goal; a certification filter appears only once a SKU earns a cert). Filter state is URL-encoded (e.g. `/collections/longevity?proof=evidence-early`) so proof-filtered views are shareable/SEO-able (Search Engine Optimization).

**b) Full catalog — `/collections/all`:** same template, all active SKUs, power-user A–Z; the explicit "everything" view kept *underneath* the curated front door.

**c) Goal collections — `/goals/<goal>`:** Thorne-style health-need grouping (e.g. `daily-foundations`, `energy`, `muscle-performance`, `sleep`, `healthspan-nad`). Same card grid, filtered by `goals[]` metadata; spans both lines (a goal can mix Foundations + Longevity SKUs once they exist).

**d) Browse by PROOF — `/proof`:** a landing for the signature axis explaining the proof filters, then deep-links into pre-filtered collection states. The transparency-max differentiator made a navigable destination.

**e) Stacks index — `/stacks`:** curated protocols as the front door (Foundation Stack, NAD+ Protocol, Healthspan Stack), plus the Stack Builder entry. Populates as member SKUs publish.

**f) Stack / regimen detail — `/stacks/<slug>`** (stack PDP template, see §4): protocol rationale, member-SKU list each with its Decoded summary + per-member COA link, **bundle price + price-per-day**, "Add whole stack," per-member swap/remove, stack-level subscribe-and-save. The Healthspan Stack is the foundation→Longevity bridge bundle.

**g) Stack Builder — `/stack-builder`:** the guided regimen engine (goal in → protocol out → multi-SKU basket). Keep it **simple rules-based** (goal/diet/format inputs → recommended stack), not heavy personalization tech (the Care/of lesson). Output is an editable basket that drops into cart, with one-time or subscription. This is the anti-paradox-of-choice antidote for a growing multi-SKU catalog (it earns its keep once the catalog is more than NMN).

---

## 8. Account & subscription

`/account` dashboard → next shipment, active subscriptions, recent orders, saved stacks, quick "verify my last lot."

- **`/account/subscriptions`** — full self-serve, **never lock-in** (avoid Ritual friction / Care/of failure): skip, change cadence, swap SKU, **add a SKU to an existing subscription**, pause, cancel. Supports **stack-level subscriptions** (subscribe to a whole protocol). Subscribe-and-save is the Foundations LTV (Lifetime Value) engine; the IA makes managing it frictionless to fight the well-known **first-month subscription churn cliff** toward a lower steady-state (specific churn benchmarks **To confirm** — not yet measured for HYGIEIAS). App: Shopify subscriptions — **To confirm** (native Shopify Subscriptions vs a third-party app).
- **`/account/orders`** — order history; **each line item links the lot-matched COA for the exact units shipped** (ties `/verify` to the real purchase — the Nordic/Momentous mechanic at the account level).
- **`/account/addresses`, `/account/profile`, payment methods** — standard.
- **Onboarding (post-purchase, email-driven):** education-led sequence that reinforces the transparency story (what your molecule is, how to read your COA, when to expect effects, honest "early" framing for Longevity) — engineered against trial drop-off, converting trial into the steady-state cohort. (Email content lives outside the site IA but is wired from order + SKU metadata.)

---

## 9. Search

**Molecule-first global search** — names are the spec *and* the retrieval anchor, so search is a primary navigation tool, not an afterthought.

- **Indexes:** products (by ingredient, **form/salt**, dose, **SKU code**), articles, goals, stacks, the Transparency Standard, **and COA lots**.
- **Lot-number search:** typing a lot (e.g. your bottle's printed lot number) resolves directly to its COA via `/verify` — search doubles as a COA entry point.
- **Synonyms / aliases (critical for a spec-named catalog):** `NMN ↔ nicotinamide mononucleotide`; `magnesium glycinate ↔ bisglycinate`; `D3 + K2 ↔ vitamin D`; `ubiquinol ↔ CoQ10`; `omega-3 ↔ EPA/DHA / fish oil`. Autocomplete suggests molecule + form + dose.
- **Result cards carry proof inline:** purity %, Evidence Grade, price-per-dose, line stripe, posted-COA link — so search results are shoppable with the same transparency as collection cards.
- **Zero-result handling:** route to Stack Builder or the relevant goal/line collection rather than a dead end.
- App: Shopify native search vs Search & Discovery app vs third-party (e.g. for lot indexing) — **To confirm**.

---

## 10. Extensibility for roadmap SKUs (the contract)

Everything above is driven by **one product schema**. Adding the next SKU = populate the schema + write claims-gate copy + post the COA; no new templates, routes, or nav builds. **Note:** only the two NMN SKUs have confirmed data today; every SKU code, dose, and wave below is an **illustrative placeholder / To confirm**, not a committed product.

**Product schema (the single source that drives nav, filters, cards, PDP, search, `/verify`):**

```
sku_code            F|L|S-<MNEMONIC>-<DOSE>      e.g. L-NMN-300
consumer_name       Ingredient + Form/Salt + Dose   "NMN 300 mg (≥99%)"
line                foundations | longevity         → accent stripe, claims posture
molecule, form_salt, dose, unit
purity_pct          + type-aware extras: totox, epa_mg, dha_mg, elemental_mg
evidence_grade      strong | moderate | early
certifications[]    usp | nsf | clean_label | none  (+ branded grade: creapure|kaneka|mitopure)
                    (none held today; renders only when actually earned)
price, servings, price_per_dose, price_per_gram
form_rationale      one line
evidence_summary    honest "does/doesn't show"
claims[]            each paired with DSHEA disclaimer (claims-gate reviewed)
goals[]             daily-foundations | energy | sleep | healthspan-nad | muscle | ...
coa_lots[]          lot → COA doc (purity, heavy metals, micro)
status              active | gated | parked
wave                1 | 2 | 3
ndi_status          (ops/internal: company NDIN or supplier-covered)
```

**How the roadmap maps onto the IA without redesign** *(Wave 2+ doses/codes are illustrative, To confirm):*
- **Wave 1 — confirmed / launch (NMN only):** `L-NMN-300` (capsule, 300 mg × 60) and `L-NMN-PWDR-100` (powder, 100 g / 500 mg-serving) — the only SKUs with real data and a (pending) posted COA. Both publish at launch; the house frame is live around them but every non-NMN node stays dark.
- **Wave 2+ — illustrative roadmap:** Foundations essentials (`F-CREA`, `F-MAG`, `F-D3K2`, `F-OMG3`, `F-ZINC`, `F-BCMX`) and additional Longevity (`L-UBQL` CoQ10). Omega-3's PURITY decode auto-renders TOTOX + EPA/DHA via the type-aware field; CoQ10 slots into Longevity; the stacks (`S-FOUND`, `S-NAD`, `S-HEALTHSPAN`) and the Stack Builder go live as their member SKUs publish — all metadata, zero template work.
- **Gated** (`L-UROA` Urolithin A): publishes only when `status` flips from `gated` to `active` (Mitopure economics + GRAS + COA met).
- **Parked** (`L-NR`, `L-RESV`, `L-SPD`, `L-FIS`): `status: parked` → no published PDP, no nav entry; flip to `active` later with no rebuild.
- **New goals or proof filters** = new enum values, surfaced automatically in filter rails and `/goals`/`/proof`.

**Publish gate (enforced in IA, = the Naming Constitution):** a SKU cannot go live until its schema has name (Ingredient+Form+Dose), exactly one line, an F/L/S code, purity % (+ elemental/EPA-DHA where relevant), form rationale, price-per-dose **and** price-per-gram, Evidence Grade, named cert if held, DSHEA/FTC-reviewed claims, and a COA posted to `/verify`. Missing any field blocks publish. This is what keeps the system coherent from 1 SKU to a growing catalog (final count **To confirm**) and makes growth additive, not architectural.

---

*All customer-facing copy referenced here (PDP claims, Evidence boxes, stack descriptions, onboarding emails) passes the DSHEA structure/function + FTC claims-review gate before publish; the Longevity line is scripted most conservatively. Subscription app, search app, and `/verify` implementation choices on Shopify are **To confirm**.*
