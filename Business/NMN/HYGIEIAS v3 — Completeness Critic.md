---
type: resource
para: resource
domain: nmn
title: "HYGIEIAS v3 — Completeness Critic"
status: draft
version: v3
created: 2026-06-28
updated: 2026-06-28
tags:
  - nmn
  - business
  - review
  - qa
related:
  - "[[NMN]]"
  - "[[NMN (project)]]"
  - "[[HYGIEIAS v3 — Executive Summary]]"
---

# HYGIEIAS v3 — Completeness Critic

> 跨文件最終 QA pass(workflow completeness-critic,2026-06-28)。檢 gap / 矛盾 / claims-safety flag / 建議。

## Overall
The six v3 deliverables (in /Users/masterdr/AI/Claude/second-brain-2026-06-06/Business/NMN/) are unusually disciplined on claims-safety and densely cross-referenced; the transparency-max strategy is coherent and the NMN unit economics check out arithmetically. Three structural weaknesses remain. (1) The "locked" backbone (Company Strategy (backbone).md) and the Executive Summary now LAG the downstream deliverables on several load-bearing facts — NMN Evidence Grade, SKU count/code, the S-NAD launch wave, shock-isolation wording, the longevity-CAGR multiple, and the debunked "Ingredient Traceability Code" — so the supposed source-of-truth contradicts the documents built from it. (2) The build is strategy-complete but execution-thin: the very assets repeatedly called "the moat" and "the launch" (the Transparency Standard v1.0 text, the Evidence Grade rubric, the /verify portal build, the QA/lab spec) do not yet exist, and there is no company-level financial model, no Foundations economics, and no legal/insurance/IP layer for a from-zero company. (3) A few residual claims constructions need a final legal pass. None are fatal; all are fixable pre-launch, but the locked docs should be re-synced and the missing execution/finance/legal layer is the real gap between "strategy" and "company."

## Gaps
- NO company-level financials. Only NMN product-cost unit economics exist (Offer Architecture §3). Missing: startup capital requirement + runway, marketing/CAC budget (LTV:CAC >=3:1 is asserted everywhere with NO CAC dollar figure), and a company-level break-even. Cannot fund or pace a launch from this.
- Foundations economics are entirely absent. The whole strategy rests on 'foundationals fund cash flow and the QA moat from day one,' yet there is zero cost/price/margin data for creatine/magnesium/D3K2/omega-3, and no foundational sourcing or COA has started. The cash engine has no numbers.
- The QA/COA program — the declared moat — has no operational spec: no named ISO-17025/accredited lab, no per-batch COA cost, no QA owner/headcount/hire plan, no pass-fail thresholds or SOP. 'QA funded as the product from day one' is asserted ~20 times but never costed or staffed on paper.
- The /verify portal has no build plan. It is a 'Phase 0 hard gate' and 'IS the launch' (Website IA, backbone) but has no owner, tech stack, timeline, cost, or lot->COA data-pipeline spec.
- The HYGIEIAS Transparency Standard v1.0 actual text does not exist. It is referenced as the launch-day constitution in every doc, but the rules, versioning policy, audit/enforcement mechanism, and self-violation remedy are undrafted.
- The Evidence Grade methodology/rubric is undefined: no criteria distinguishing Strong vs Moderate vs Early, no named grader or qualification, no auditable published process. The #1 stated differentiator is currently an unsubstantiated process claim (the /evidence page exists in the IA but its rubric content does not).
- No contract manufacturer (CMO) named for either format; no foundational MOQs/lead times/co-packer; bottling cost exists ($3.61/$2.50) with no vendor. The brand-owner's OWN cGMP 21 CFR 111 obligations (not just the CMO's) are unaddressed.
- Product liability insurance is not mentioned anywhere — essential for any supplement company, doubly so selling NMN (litigation expected) and publishing a constitution that raises the accountability bar.
- Corporate/legal setup absent: entity formation, FDA facility registration (brand-owner responsibilities), and the legally-mandated Serious Adverse Event Reporting (AER) system + on-label contact address are all missing.
- Brand IP: no HYGIEIAS trademark clearance/registration plan — the name is near-identical to widely-used 'Hygeia/Hygieia' health/pharma marks, a real clearance risk. The coined moat terms (Five Decodes, Transparency Standard, Evidence Grade) are unprotected; Website IA itself notes they are 'not yet ratified.'
- Subscription legal compliance gap: 'cancel anytime' is described only as UX. It must satisfy the FTC negative-option / Click-to-Cancel rule and state auto-renewal laws (CA ARL etc.). No compliance mechanics planned.
- California Prop 65 is named as a risk but has NO mitigation: no warning-text plan for label/site, no link between the heavy-metals COA spec and Prop 65 action levels, no CA geo-handling.
- Amazon execution gap despite Amazon being ~half the channel: no A+ content build, no listing/title/keyword plan, and no resolution of Amazon's REQUIRED real product photography (main image must be an actual product on white) — which directly conflicts with the SVG-only/no-photography design system. Also no plan for how /verify and COA-on-page translate on a platform that limits outbound links.
- Cold-start reviews: the honest empty-state is correct, but launching at zero reviews with a no-seeding policy needs a legitimate review-generation plan (post-purchase ask, Amazon Vine). Unaddressed; a real conversion risk.
- Stack/bundle pricing and discount logic are undefined (S-FOUND/S-NAD/S-HEALTHSPAN all 'To confirm'). The cross-sell 'bridge' thesis cannot be modeled or instrumented without bundle prices.
- Analytics/measurement spec missing: 'instrument cross-sell / churn / attach-rate' is repeated, but there is no analytics stack, event taxonomy, or KPI dashboard defined.
- Inventory/demand planning beyond the 3,000-unit first batch: no reorder/forecast/safety-stock logic, and the NMN-re-ban write-off exposure (the volatile-SKU financial risk) is architecturally isolated but never quantified in dollars.
- Higher-dose safety basis: the 500 mg/day powder serving has no stated safety substantiation, and even the 300 mg capsule's 'in the range of published safety work' is itself flagged To-confirm (the Fukamizu 2022 dose may not match). A documented safe-dose basis per format is needed before the dose copy ships.
- Returns/reverse logistics + customer support undefined: the 60-day money-back guarantee implies a returns process (supplements cannot be restocked/resold), plus CS channel/staffing — operationally blank.
- Open finance reconciliations (Offer Architecture §3/§8) left unresolved: on-file contribution implies ~$6.8/$8.2 per-unit fulfillment vs the $5-6/$6-7 estimate, and the stated ~1,800-unit product-cost break-even contradicts the arithmetic (~920 units). Both must be resolved before any capital decision.

## Cross-document inconsistencies
- NMN Evidence Grade conflict (highest priority). EARLY in Company Brand Strategy §4 (line 120), Product Line §3 + roadmap table (lines 172, 198), and throughout the PDP (build note line 351 explicitly changed it from Moderate). But MODERATE in the backbone (lines 93, 166) and the prompt's own 'LOCKED' brief, and 'Emerging' in Offer Architecture (line 23 + header) — 'Emerging' is not even on the official Strong/Moderate/Early scale.
- NMN powder SKU code has THREE values for one product: L-NMN-500 (Offer, PDP, Product Line), L-NMN-P100 (Company Brand Strategy §5 line 160), and L-NMN-PWDR-100 (Website IA §10 line 360). Latent flaw: the dose-based code cannot encode format, so a future 500 mg capsule would collide with the 500 mg-serving powder.
- SKU-system size: '~15-line / 11 active + 4 parked' (backbone line 148; Company Brand Strategy §5 line 153; Exec Summary) vs '~16-line / 12 active + 4 parked' (Product Line line 132). The second NMN format was added downstream but not propagated to the backbone, brand strategy, or summary.
- S-NAD launch wave logic error: the backbone Wave 1 (line 164) lists S-NAD as launching in Wave 1, but S-NAD = NMN + CoQ10 and CoQ10 (L-UBQL-100) is Wave 2 — so S-NAD cannot exist in Wave 1. Correctly fixed in Product Line (line 192), Offer (line 44), and PDP §9; the 'locked' backbone carries the impossible sequence.
- NMN shock-isolation described as 'ONE SKU (L-NMN-300)' in the backbone (line 67) and Exec Summary (line 42), but 'one molecule, two formats/SKUs' everywhere else. The de-risking story now spans two SKUs; the locked/index docs were not updated, and this is also a quiet expansion of the prompt's literal 'contained as ONE SKU' lock that should be explicitly ratified.
- Free-shipping threshold contradicts itself: '$50' in PDP §1 announcement bar (line 56) vs '$35' in Offer Architecture §5 (line 128).
- Longevity CAGR multiple: backbone says '~14% CAGR, ~3x industry' (line 88) but Market §1.3 says '~14.3% CAGR (~1.7x the broader ~8.5%)' (line 61). 14.3/8.5 = 1.68, so the backbone's '3x' is arithmetically wrong.
- The 'FDA Ingredient Traceability Code (Oct 2026)' is stated as a real label requirement in the backbone (line 160) and Exec Summary (line 49), but debunked as unverified / likely-FSMA-204-confusion in Market §4.5, Offer §7, and Product Line Phase 0. The locked/index docs lag the correction.
- Launch scope is contradictory. Website IA's data-status box (lines 27-29) says only NMN's two SKUs publish at launch and the Foundations line is 'illustrative placeholder / not committed,' but backbone / Product Line / Exec-Summary Wave 1 = NMN + creatine + magnesium + D3K2 + two stacks. A reader cannot tell whether launch is 2 SKUs or 6+2 — and if it is NMN-only, the core premise that NMN 'sits on a stable Foundations base from day one' is false at launch.
- Discount labeling: the capsule 'Subscribe & save 15%' is actually 14.3% ($34.95 -> $29.95); the powder is a true 15%. The PDP build note (line 353) flags it, but the announcement bar and buy box still say 15%.
- Target customer skews conflict: '40-65, female-skew' (Company Brand Strategy §6; Market §1.4) vs '35-60, gender unspecified' from the offer/project work. Self-flagged with a reconciliation note but left unresolved.
- NMN reversal-date confidence: stated as a hard fact '29 Sep 2025' (backbone; Market §4.4 timeline) but 'exact date To confirm' in the PDP FAQ (line 307) — inconsistent confidence level across customer-facing vs internal docs.

## Claims-safety flags
- PDP §6 highest-risk construction: 'NAD+ levels are reported to decline with age.[†]' paired with 'NMN is a precursor your body converts to NAD+' creates a net impression of an anti-aging benefit even though no such claim is stated. FTC judges NET IMPRESSION, not individual sentences — this implication chain is the single most exposed item in the PDP and needs explicit legal scrutiny (consider removing the 'declines with age' line).
- Education-vs-evidence tension: 'the coenzyme every cell uses to make energy' (PDP hero + §6) read alongside the dosing context can leave an implied 'energy' benefit — which the Evidence box explicitly says is NOT proven (graded Early). Claims-gate the juxtaposition, not just the individual lines.
- 'Save 15%' where the capsule discount is actually 14.3% is a truth-in-advertising (FTC) exposure and is uniquely corrosive for a brand whose entire equity is honesty. Either set the capsule subscribe price to a true 15% or relabel '~14%.'
- The Evidence Grade is itself a claim surface: 'Evidence Grade: Strong' on a Foundations SKU can be read as a performance/efficacy claim requiring competent-and-reliable substantiation. Without a defensible, published rubric (see gaps), the grades are attackable as arbitrary/self-serving. Have the grade rubric reviewed AS claims, not just as marketing.
- Stack Builder ('goal in -> protocol out') can generate implied claims via its recommendation logic/copy (e.g., recommending products for 'energy' or 'healthspan'). The claims-review gate must cover the builder's output, not only PDPs — currently not addressed.
- Live PDP copy asserts 'cGMP facility' and 'NDI-compliant ingredient' (§3/§7) that are currently To-confirm (no CMO named; NDI coverage of grades G1/G3 unconfirmed). These are factual claims that are unsubstantiated until verified — must hard-block publish until true.
- Per-claim substantiation does not exist yet: every structure/function claim (Foundations + NMN) needs the FDA 30-day notification + competent-and-reliable evidence on file before use. The docs require this but no claim currently has a dossier attached.
- Legally-mandated Serious Adverse Event Reporting (AER) contact is absent from the label plan, and DSHEA disclaimer placement/linking is still 'To confirm' against current FDA guidance (Company Brand Strategy §4 line 132).
- Unverified regulatory assumptions still embedded in locked/index docs could shape labels incorrectly: the 'FDA Ingredient Traceability Code Oct 2026' (debunked elsewhere) and the rumored 'Dec 2025 FDA enforcement-discretion on the disclaimer' (Company Brand Strategy §4 says explicitly NOT verified). Ensure neither drives label design.

## Recommendations / next actions
- Reconcile the NMN Evidence Grade to EARLY across ALL documents; delete 'Emerging' from Offer Architecture; update the backbone (lines 93, 166) and Exec Summary; and explicitly note this corrects the prompt's 'LOCKED Moderate,' ratifying EARLY as the new lock (the PDP build note's reasoning is sound — the evidence does not support Moderate).
- Pick ONE NMN-powder SKU code and propagate it; recommend amending the SKU convention to encode FORMAT (e.g., a -P suffix) rather than dose alone, to prevent a future dose collision (500 mg capsule vs 500 mg-serving powder).
- Resolve launch scope in writing: state whether day-one = NMN-only (2 SKUs) or NMN + the three Wave-1 foundationals + two stacks. If the foundationals slip, acknowledge that launch-day risk is NMN-concentrated and that 'stable Foundations base / foundationals fund the moat' is a Phase-2 state, not a launch fact; set a target ship date for the first foundational.
- Draft the two assets that every doc calls 'the launch' / 'the #1 moat' but that do not exist: the Transparency Standard v1.0 text (rules, versioning, audit, self-violation remedy) and the Evidence Grade rubric (tier criteria, grader qualification, review cadence). Nothing else should ship before these.
- Build the company financial model: startup capital + runway, Foundations unit economics, a real CAC and the resulting LTV:CAC math, and a company break-even — and resolve the Offer §3/§8 fulfillment and break-even reconciliations (~$6.8/$8.2 vs $5-6/$6-7; ~1,800 vs ~920 units).
- Spec the QA/COA engine as the gating Phase-0 workstream: name an ISO-17025 lab, per-batch COA cost + panels + pass thresholds, a QA owner/headcount, and the /verify build (owner, stack, timeline, cost).
- Stand up the legal/compliance layer for a from-zero company: entity, product-liability insurance, FDA facility registration + brand-owner cGMP duties, AER system + on-label contact, subscription auto-renewal compliance (FTC Click-to-Cancel + state ARL), a Prop 65 plan, and site privacy/CAN-SPAM/ADA. Run a HYGIEIAS trademark clearance + registration now given the name-collision risk.
- Fix the two truth-in-advertising items immediately (they directly contradict the brand promise): make the capsule subscribe a true 15% or relabel it ~14%, and align the free-shipping threshold to one number ($35 vs $50).
- Resolve the Amazon execution conflict: confirm Amazon's real-image requirement vs the SVG-only system (plan compliant product photography for Amazon even if the DTC site stays photo-free), and build the A+/listing plan plus how COA/verify translate on-platform.
- Tighten the highest-risk PDP claims: reword/remove 'NAD+ declines with age,' claims-gate the energy-education-vs-Early-evidence juxtaposition and the Stack Builder output, and do not publish 'cGMP/NDI-compliant' copy until verified.
- Re-sync the 'locked' backbone and Executive Summary with the downstream deliverables on grade, SKU count, S-NAD wave, shock-isolation wording, the CAGR multiple, and the traceability-code item — otherwise the source-of-truth keeps contradicting the docs derived from it.
- Create a per-claim substantiation dossier + a 30-day-FDA-notification tracker before any structure/function copy goes live, and document the safe-dose basis for both 300 mg and 500 mg/day NMN.

