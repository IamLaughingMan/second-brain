---
type: resource
para: resource
domain: nmn
title: "NMN — PDP (wireframe + copy)"
status: draft
version: v3
created: 2026-06-28
updated: 2026-06-28
tags:
  - nmn
  - business
  - pdp
  - copy
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[overview]]"
---

# NMN — PDP (wireframe + copy)

> **SKU:** `L-NMN-300` (capsule) · `L-NMN-500` (powder format) — HYGIEIAS **Longevity** line
> **Visual:** navy ink `#1B2A4A`, single **orange `#D9531E` accent stripe** (the Longevity tell), monospace for all numbers/specs. No photography — SVG bottle + typographic lab-sheet only.
> **Voice:** calm, literal, numerate, anti-hype. State facts and limits; never promise outcomes.
> **Claims posture:** most conservative tier. Structure/function only → NAD+ / cellular-energy support. No anti-aging / disease / longevity-as-lifespan language. Every claim carries a linked-disclaimer marker `[†]` → resolves to the FDA disclaimer at page foot.

**How to read this doc:** each section gives **▸ WIREFRAME** (order + purpose + layout) then **▸ COPY** (the literal customer-facing text). Internal notes are in `//` comments.

---

## Page map (top → bottom)

1. Utility/announcement bar
2. Breadcrumb
3. **Hero** (SVG bottle + name/spec + Evidence Grade badge + buy box w/ format toggle + subscribe)
4. **The Decoded Panel** (the Five Decodes — the transparency block: purity %, COA, price/gram + dose)
5. **Product & dosing** (what's in the bottle, how to take it, formats compared)
6. **What is NMN / NAD+** (claims-safe education + the two citations + honest evidence box)
7. **Trust row** (cGMP / NDI / COA-published / /verify / Transparency Standard)
8. **Comparison** (Five Decodes vs the typical NMN listing + market price-per-gram context)
9. **Cross-sell** (The Healthspan Stack bridge bundle)
10. **Reviews** (placeholder, honest empty-state)
11. **FAQ**
12. **FDA disclaimer + footer**

---

## 1. Utility / announcement bar

**▸ WIREFRAME** — Full-width navy strip, single line, dismissible. Reinforces the operating system, not a promo. Center one rotating fact.

**▸ COPY**
> Every batch ships with a lot-matched Certificate of Analysis. **Verify yours at hygieias.com/verify.**

`// Alt rotations: "Free US shipping over $50." / "Subscribe & save 15% — cancel anytime."`

---

## 2. Breadcrumb

**▸ WIREFRAME** — Monospace, small, navy. Signals catalog logic.

**▸ COPY**
`HYGIEIAS / Longevity / NMN 300 mg`

---

## 3. Hero

**▸ WIREFRAME** — Two columns (stacks on mobile).
**Left:** SVG capsule/pouch bottle mockup — navy label, orange accent stripe, deep-blue HYGIEIAS wordmark, `NMN`, `300 mg`, `≥99% β`. (Reuse existing SVG bottle asset.)
**Right (buy box):** product name → one-line descriptor → Evidence Grade badge → format toggle (Capsule / Powder) → price block (price + price/dose + price/gram, recomputed per format) → purchase mode toggle (One-time / Subscribe & save 15%) → primary CTA (orange) → micro-trust line → in-stock/ship note.

**▸ COPY**

**Product name (H1):**
> NMN 300 mg

**Descriptor (under name, monospace):**
> β-Nicotinamide Mononucleotide · ≥99% beta-form · `L-NMN-300`

**Masterbrand line (small, above name):**
> HYGIEIAS — the molecule, not the marketing.

**Evidence Grade badge (orange-outlined chip):**
> **EVIDENCE GRADE: EARLY** — the research is real but still early, and we'll show you exactly how early. [↓ see the evidence]

**One-liner:**
> NMN is a precursor your body converts to NAD+ — the coenzyme every cell uses to make energy.[†] We show the molecule, the form, the dose, the assayed purity, the lot-matched COA, and the price per dose. Then we show you what the trials do and don't prove.

**Format toggle (segmented control):**

| | Capsule | Powder |
|---|---|---|
| **Spec** | 300 mg × 60 caps · ~60-day supply · 1/day | 500 mg/serving · 100 g · ~200 servings (~6.6 mo) |
| **Code** | `L-NMN-300` | `L-NMN-500` |

**Price block — Capsule (default):**
> **$34.95** one-time · **$29.95** subscribe (−15%)
> `$0.58 / dose · $1.94 / g` → subscribe `$0.50 / dose · $1.66 / g`

**Price block — Powder (on toggle):**
> **$44.95** one-time · **$38.20** subscribe (−15%)
> `$0.22 / serving · $0.45 / g` → subscribe `$0.19 / serving · $0.38 / g`
> *Lowest price per gram in our lineup.*

**Purchase mode toggle:**
> ◯ One-time purchase  ●  Subscribe & save 15% — cancel or skip anytime, no lock-in.

**Primary CTA (orange `#D9531E`):**
> Add to cart

**Micro-trust line (under CTA, monospace):**
> Lot-matched COA published before this batch shipped · cGMP facility · NDI-compliant ingredient[†]

---

## 4. The Decoded Panel — the Five Decodes

**▸ WIREFRAME** — The transparency block and the heart of the page. Identical monospace spec template used on every HYGIEIAS PDP and label. Render as a bordered lab-sheet card; numbers in monospace; orange left rule (Longevity). The COA line links to **/verify**; "EVIDENCE GRADE" links to §6. Swaps values with the format toggle.

**▸ COPY (Capsule shown — monospace block):**

```
THE DECODED PANEL · L-NMN-300 · NMN 300 mg

1  THE MOLECULE   β-Nicotinamide Mononucleotide (NMN)
                  300 mg per capsule · 60 capsules · 1/day

2  THE PURITY     ≥99% beta-form, assayed        // To confirm assay method (HPLC)
                  beta-form is the form your body uses

3  THE PROOF      Lot-matched Certificate of Analysis (COA):
                  purity % · heavy metals · microbial
                  → verify your batch at hygieias.com/verify
                  (e.g. L-NMN-300 · Lot 2406A)

4  THE PRICE      $0.58 / dose   ·   $1.94 / g
                  subscribe:  $0.50 / dose · $1.66 / g
                  priced on formulation cost, not marketing

5  THE REASONING  Beta-form — the bioactive form; alpha-form is
                  inactive.                       // To confirm synthesis method (enzymatic)
                  EVIDENCE GRADE: EARLY  → see the evidence
```

**Caption under the panel:**
> This is the same five-point panel on every HYGIEIAS product — Foundations and Longevity alike. It's not a feature. It's how the company works. [Read the HYGIEIAS Transparency Standard →]

`// Powder variant swaps lines 1 & 4: "500 mg per serving · 100 g (~200 servings)" and "$0.22 / serving · $0.45 / g (subscribe $0.19 / $0.38)".`
`// To confirm: is the published COA third-party / independent-lab? Brief's transparency spine specifies a third-party COA. State "third-party" only if true; if manufacturer-only, keep current wording.`

---

## 5. Product & dosing

**▸ WIREFRAME** — Two-part: (a) "What's in the bottle" — full-disclosure mini Supplement Facts incl. inactives (the no-proprietary-blend promise); (b) "How to take it" — dosing, timing, format guidance. Plain, honest, no overreach.

**▸ COPY**

**What's in the bottle**
> One molecule. No blends, no fillers dressed up as actives, no hidden inactives.

```
Serving size:    1 capsule
Servings:        60
Per serving:     β-NMN ........... 300 mg  (≥99% beta-form)
Other ingredients: vegetable cellulose capsule (HPMC)   // To confirm — final capsule shell
                   — no fillers, no flow agents          // To confirm vs final formulation
```

> Full label disclosure — actives **and** inactives — is required of every HYGIEIAS SKU by the Transparency Standard.

**How to take it**
> **Capsule:** 1 capsule (300 mg) daily, with or without food. A 60-capsule bottle is a ~60-day supply.
> **Powder:** 500 mg (one level scoop / `// scoop size To confirm`) daily in water. A 100 g pouch is ~200 servings (~6.6 months).
>
> **On the dose:** our 300 mg capsule sits in the range used in published human safety work.[†] The 500 mg powder serving is offered for those who prefer a higher daily amount — but more is not proven to be better. The functional-benefit trials are small and early (see below), so we let you choose the format and dose rather than pushing the bigger number.
>
> **Storage:** cool, dry, sealed. NMN is hygroscopic — reseal the pouch promptly.

---

## 6. What is NMN / NAD+ — the science, honestly

**▸ WIREFRAME** — The conversion engine for an education-market category. Three blocks: (a) plain-language mechanism; (b) **honest evidence box** with the two citations — the self-grading move competitors can't copy; (c) the linked honesty clause. Neutral diagram (SVG, no photo): NMN → NAD+ → cellular energy. Every sentence claims-reviewed.

**▸ COPY**

**What NMN is**
> NMN (β-Nicotinamide Mononucleotide) is a small molecule found naturally in your body and in trace amounts in food. Your cells use it as a direct building block to make **NAD+** (Nicotinamide Adenine Dinucleotide) — a coenzyme involved in cellular energy production and hundreds of metabolic reactions.[†] NAD+ levels are reported to decline with age.[†]

**What the research does — and doesn't — show**

> **The honest version.** We grade our own science, and we grade NMN's evidence **Early**.
>
> **What's reasonably established:** In human trials, oral beta-NMN has been studied for safety and tolerability in healthy adults. A 2022 trial (66 participants, 60 days) supported the safety of oral beta-NMN supplementation in healthy adults.¹
>
> **What's still early:** The *functional* benefits people hope for are not yet proven. A 2024 systematic review of randomized controlled trials on physical performance found that **most outcomes were not statistically significant.**² The outcome trials are small, short, and early.
>
> **So we say exactly this:** NMN reliably participates in NAD+ metabolism, but the evidence that it changes how you feel, perform, or age is not there yet. **The research is real but still early — and we'll show you exactly how early.**[†]
>
> ¹ Fukamizu Y, et al. *Scientific Reports*, 2022 — safety of oral beta-NMN in healthy adults.
> ² Wen J, et al. *Cureus*, 2024 — systematic review of RCTs on physical performance (most outcomes not statistically significant).

`// To confirm: the "66 participants, 60 days" figures come from the 2022 dosing-basis trial in the source data, which lists the Fukamizu 2022 Scientific Reports safety citation SEPARATELY. Verify these are the same study before pinning n/duration to footnote ¹; if not, drop the parenthetical or source the correct citation. Only the two cited papers (Fukamizu 2022, Wen 2024) are approved for use here.`

**Why beta-form and synthesis method matter**
> NMN exists as two mirror-image forms. The **beta-form** is the one your body uses; the alpha-form is inactive. We source **≥99% beta-form** and put the assayed purity on the page. Many listings state neither the form nor the purity — which is exactly where quality hides.

`// To confirm production/synthesis method before adding "enzymatic synthesis" claim (not in source data).`

---

## 7. Trust row

**▸ WIREFRAME** — Horizontal row of 4–5 monospace chips/icons (SVG line icons, navy). Each links out. This is where "third-party tested" is *replaced* by concrete, named facts.

**▸ COPY**

> ▪ **cGMP facility** — manufactured in a current-Good-Manufacturing-Practice facility.[†]
> ▪ **NDI-compliant ingredient** — sourced to ingredients covered by New Dietary Ingredient notifications (SyncoZymes NDI #1247 · Kingdomway NDI #1259). `// To confirm both grades fall under accepted NDIs`
> ▪ **COA published, not "tested"** — we don't say "third-party tested." We publish the lot-matched Certificate of Analysis: purity %, heavy metals, microbial. [See a sample COA →] `// To confirm whether COA is third-party/independent-lab; brief spine specifies a third-party COA — surface "independent lab" if accurate.`
> ▪ **/verify** — enter your lot number, read your batch's results. [hygieias.com/verify →]
> ▪ **USP / NSF certification** — *not currently held for this SKU.* `// To confirm — pursuing; we will not display a seal we don't hold.`
> ▪ **The HYGIEIAS Transparency Standard v1.0** — the public, versioned rulebook every SKU must meet. [Read it →]

---

## 8. Comparison — the Five Decodes vs. the typical NMN listing

**▸ WIREFRAME** — Two tables. **(A)** proof-point matrix, HYGIEIAS vs. "typical NMN listing" — honest, generic (no named brand disparagement). **(B)** market price-per-gram context strip, numbers marked *To confirm* (prices move). Monospace.

**▸ COPY**

**(A) What gets shown on the page**

| Proof point | HYGIEIAS NMN | Typical NMN listing |
|---|---|---|
| Assayed purity % stated | **≥99% beta, on the page** | Often "high purity," no number |
| Beta- vs alpha-form disclosed | **Yes** | Rarely |
| Lot-matched COA, published | **Yes — before the batch ships** | Often "on request," or none |
| Price per dose **and** per gram | **Both, computed** | Almost never shown |
| Evidence honestly graded | **Early — honestly graded** | Frequently implies anti-aging |
| Proprietary blend / hidden inactives | **None** | Common |

**(B) Market price-per-gram context** — *we'd rather you check our math than trust our adjective.*

```
HYGIEIAS NMN powder (subscribe) ....... ~$0.38 / g   ← this product
HYGIEIAS NMN capsule (subscribe) ...... ~$1.66 / g
— market check, 2026-06 (To confirm — prices change) —
Neurogan NMN 900 (subscribe) .......... ~$0.59 / g
Neurogan NMN 500 (subscribe) .......... ~$1.07 / g
Renue By Science (sublingual 250 mg) .. ~$1.26 / g
Toniiq NMN 300 (98%, COA on request) .. ~$1.7–2.0 / g
ProHealth NMN Pro (premium) ........... ~$1.2–3.9 / g
```

> We're priced on formulation and testing cost, not on marketing. On powder, that lands among the lowest cost-per-gram shown here; on capsules, mid-pack for the convenience of a fixed daily dose. Either way, we show the number so you can decide.

---

## 9. Cross-sell — keep your base, add the frontier

**▸ WIREFRAME** — Single bridge-bundle card (anti-paradox-of-choice; do not dump SKUs). Feature **The Healthspan Stack** (Wave 1). Mention The NAD+ Protocol as forthcoming.

**▸ COPY**

> **The Healthspan Stack** — `S-HEALTHSPAN`
> A daily Foundation Stack of well-established essentials + this NMN. The literal expression of the idea: build a verifiable daily base on well-established nutrients, then add the NAD+ frontier on top. [Build my stack →]
>
> *Coming soon:* **The NAD+ Protocol** (`S-NAD`). `// Wave 2`

`// To confirm Foundation Stack components and the NAD+ Protocol pairing — specific foundational SKUs (e.g. creatine, magnesium glycinate, D3+K2, omega-3) and any companion ingredient are illustrative pending the confirmed Foundations lineup. Do not publish named SKUs until they exist.`

---

## 10. Reviews

**▸ WIREFRAME** — Standard review module, but an **honest empty-state at launch** (no seeded or fake reviews — that would contradict the Standard). Aggregate-rating slot, verified-buyer filter, write-a-review CTA, distribution bars — all empty until real reviews arrive.

**▸ COPY (launch empty-state)**

> **No reviews yet.**
> This batch just launched. When reviews come in, we'll show them from verified buyers only — including the critical ones. We don't seed, edit, or pay for reviews.
> [Be the first to review →]

`// Post-launch: show aggregate ★ rating, verified-buyer badge, rating distribution, most-recent + most-helpful sort. Surface negative reviews; never filter them out.`

---

## 11. FAQ

**▸ WIREFRAME** — Accordion, claims-safe answers, plain language. Lead with the honest "will this make me live longer" question — answering it *no* is the brand.

**▸ COPY**

> **Will this make me live longer or reverse aging?**
> No — and we won't claim it does. NMN supports NAD+ metabolism, but the trials that would prove anti-aging or lifespan effects in humans don't exist yet. We grade the evidence **Early** and tell you it's still early. Anyone promising otherwise is ahead of the science.[†]
>
> **What does NMN actually do?**
> It's a precursor your body converts to NAD+, a coenzyme central to cellular energy production.[†] What's well-studied is the biochemistry and short-term safety; the functional benefits are still early (see "the science, honestly" above).
>
> **Is NMN legal? Is it FDA-approved?**
> NMN is lawful to sell as a dietary supplement in the US, following the FDA's 2025 reversal of its earlier (2022) position. The FDA does **not** approve dietary supplements — no supplement is "FDA-approved." We source to ingredients covered by New Dietary Ingredient notifications and keep documentation on file.[†] `// Exact reversal date To confirm (source data: "2025 reversal"; NMN returned to Amazon Dec 2025). Re-verify Amazon listing policy before FBA/MCF.`
>
> **Capsule or powder — which should I pick?**
> Capsule = convenience and a fixed 300 mg/day. Powder = lowest price per gram (~$0.38/g subscribed) and an adjustable 500 mg serving. Same molecule, same ≥99% beta purity. More milligrams is not proven to be better.
>
> **Beta-form vs alpha-form — does it matter?**
> Yes. Only the beta-form is bioactive. We source ≥99% beta and publish the assay. If a listing doesn't state the form, you can't know what you're getting.
>
> **How do I verify my bottle?**
> Find the lot number on the label (e.g. `Lot 2406A`), enter it at **hygieias.com/verify**, and read that exact batch's COA — purity, heavy metals, microbial.
>
> **Is it third-party tested or certified?**
> We publish a lot-matched COA for every batch (we think that's stronger than the undefined phrase "third-party tested"). This SKU does **not** currently carry a USP or NSF seal, and we won't display one we don't hold. `// To confirm — pursuing; and confirm whether the COA lab is independent/third-party so we can say so plainly.`
>
> **How should I take it and when?**
> Once daily, with or without food. Timing isn't critical. Store cool, dry, and resealed — NMN absorbs moisture.
>
> **Can I cancel my subscription?**
> Anytime. Skip, pause, or cancel — no lock-in, no fees. We don't do subscription-only.
>
> **Is it vegan? Any allergens?**
> Capsule shell: vegetable cellulose (HPMC); powder is the pure molecule. `// To confirm final formulations and allergen statement.`

---

## 12. FDA disclaimer + footer

**▸ WIREFRAME** — Disclaimer block directly above footer; every `[†]` marker on the page links here. Footer carries masterbrand, descriptor, and the standing transparency links.

**▸ COPY**

**Disclaimer (required):**
> **[†]** This statement has not been evaluated by the Food and Drug Administration. This product is not intended to diagnose, treat, cure, or prevent any disease.

**Footer:**
> **HYGIEIAS** — Supplements, decoded.
> Every HYGIEIAS product shows its molecule, its form, its dose, its purity %, its lot-matched COA, and its price per dose — from daily foundations to the NAD+ frontier.
> [The Transparency Standard] · [/verify] · [Browse by Proof] · [Foundations] · [Longevity]

---

### Build notes (internal, not customer-facing)

- **Claims gate:** every `[†]`-marked line must pass DSHEA/FTC review before publish; structure/function only; no disease/anti-aging/lifespan language. Longevity = strictest gate.
- **Evidence grade = EARLY (changed from MODERATE):** the cited evidence (safety supported; most efficacy outcomes not statistically significant; "still early") does not support a "Moderate" grade. Keep the grade consistent across hero badge, §4 panel, §6, §8 table, §11 FAQ.
- **To confirm before launch:** final capsule shell + inactives; powder scoop size; whether both NMN grades (G1/G3) fall under accepted NDIs; whether the published COA is third-party/independent-lab (brief spine says it is); assay method (HPLC) and synthesis method (enzymatic) claims; that the 66-participant/60-day trial = the Fukamizu 2022 citation; exact FDA 2025 reversal date; USP/NSF status; Amazon NMN listing policy; current competitor price/gram figures; live COA lot in /verify before this batch ships; Foundation Stack + NAD+ Protocol components (do not publish named SKUs until they exist).
- **Pricing note for legal:** capsule subscribe ($29.95 vs $34.95) is a 14.3% discount but is labeled "save 15%" per locked source pricing; powder ($38.20 vs $44.95) is a true 15%. Either keep "15%" as locked or relabel capsule "~14%".
- **Reuse:** the §4 Decoded Panel template and §3 SVG bottle (label text only) port to every SKU — Foundations drop the orange stripe.
- **Numbers are computed from HARD DATA** (capsule $34.95/$29.95 → $1.94/$1.66 per g, $0.58/$0.50 per dose; powder $44.95/$38.20 → $0.45/$0.38 per g, $0.22/$0.19 per serving). All verified. Do not alter without re-deriving.
