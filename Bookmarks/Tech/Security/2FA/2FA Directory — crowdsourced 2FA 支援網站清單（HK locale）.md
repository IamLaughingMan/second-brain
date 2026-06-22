---
type: bookmark
para: resource
domain: Tech
title: "2FA Directory（HK locale）— List of sites with two factor auth support"
url: "https://2fa.directory/hk/"
author: "2factorauth（non-profit，crowdsourced，GitHub-hosted）"
summary: "**眾包 2FA 支援網站目錄**：列出網絡服務支援嘅 2FA 方法（SMS／email／phone call／TOTP／U2F／FIDO2／hardware key／software）。HK locale 過濾 HK-relevant 服務（HK 銀行／券商／加密所等）。Categories 涵蓋 37+ 範疇（Banking／Cryptocurrencies／Email／Finance／Gaming／Social／VPN…）。Crowdsourced via GitHub（2factorauth/twofactorauth repo），non-profit 維護。提供 API + bot for integration。**用法**：開新帳戶前快查呢度睇有冇 2FA 同支援邊種方法（hardware key 優先）。"
status: active
related:
  - ""
tags:
  - bookmark
  - tech
  - security
  - 2fa
  - mfa
  - reference
  - crowdsourced
  - non-profit
  - github
  - hk-locale
created: 2026-06-22
updated: 2026-06-22
---

# 2FA Directory — crowdsourced 2FA 支援網站清單（HK locale）

- URL: <https://2fa.directory/hk/>
- Saved date: 2026-06-22
- Topic: 眾包 2FA-support 網站目錄（HK 區域過濾）
- Maintainer: **2factorauth**（non-profit）
- Source repo: GitHub <https://github.com/2factorauth/twofactorauth>
- Site type: SPA（React/Vue/Svelte），靠 JS 動態載入；defuddle 抓唔到、Playwright 可
- Status: active

## Summary

**2FA Directory** 係一個眾包 web app，列出網絡服務嘅 2FA 支援狀態：邊個服務有 2FA、用邊種方法（SMS／email／phone call／TOTP／U2F／FIDO2／hardware key／software backup codes）。Crowdsourced via GitHub 2factorauth／twofactorauth repo、純 markdown 數據、社群維護。
- **HK locale**（`/hk/` URL）：過濾 HK 區域 relevant 服務（HK 銀行、HK 券商、HK 加密所等）
- **Categories（37+）**：Backup/Sync、Banking、Betting、Cloud Computing、Communication、Creativity、Crowdfunding、Cryptocurrencies、Developer、Domains、Education、Email、Entertainment、Finance、Food、Gaming、Health、Hosting/VPS、Identity Management、Investing、IoT、Legal/Compliance、Marketing/Analytics、Payments、Post/Shipping、Remote Access、Retail、Security、Social、Task Management、Tickets/Events、Transport、Travel/Accommodations、Universities、Utilities、VPN、Other
- **API + Bot**：提供 JSON API 同 Telegram/Slack bot integration

## Key Takeaways

1. **2FA 方法 hierarchy（從強到弱）**：
   - **FIDO2 / WebAuthn / Passkey**（YubiKey、Titan、TouchID／FaceID）— **最強**，唔怕 phishing
   - **TOTP**（Authy／Google Authenticator／1Password／Bitwarden）— 強，phishing-resistant 度中
   - **Push notification**（Microsoft Authenticator、Duo）— 中
   - **SMS / Voice**（電話短訊／語音）— **最弱**，可俾 SIM swap 攻擊；NIST 2017 起已不建議
   - **Email** — 隨 email account 安全度浮動，僅作 backup
2. **HK locale 嘅 reality check**：HK 嘅銀行／券商／服務商 2FA 採用率仍偏 SMS／OTP token；hardware key 接受度低（HSBC／Hang Seng／中銀香港 暫不支援 U2F／FIDO2）。對比歐美主流 hardware key 已 widespread。
3. **使用場景**：
   - 開新帳戶／service 前先查呢度（5 秒）
   - 揀 service tier／provider 時（如多個券商選一個）拎 2FA 支援度做決策依據
   - 喺現有 stack 揾邊個服務仲只係 SMS／無 2FA → priority migration target
4. **眾包數據警告**：site 自己 disclaimer 「some data may be outdated」— 用之前可上 GitHub source repo 對最新 PR / issue。Data freshness 一般 1-12 個月 lag。
5. **2factorauth 屬非牟利**：純社群維護、無 commercial bias（vs LastPass／1Password 嘅 marketing-driven「2FA guide」可能 push 自家 stack）

## My Notes

- **個人 2FA stack 建議**（HK 用戶 2026）：
  - **Hardware key**：2 條 YubiKey 5C NFC（一條隨身、一條家中 backup） — 用於 Google Workspace／GitHub／1Password／Bitwarden master account／重要 crypto exchange
  - **TOTP app**：用 **Bitwarden / 1Password integrated TOTP**（同 password manager 一齊）OR **Aegis（Android）／Raivo（iOS）**獨立 app — **唔好用 Google Authenticator**（無 cloud sync + 換機災難）
  - **SMS-only 服務**：保留專用 secondary phone number（如 Google Voice / 香港 SIM card 不出借）— 唔用 primary phone 收所有 SMS-2FA
  - **Backup codes**：每個 critical account 嘅 backup codes print 出來放實體保險箱 / 1Password secure note
- **HK banking 2FA reality**：截至 2026 HK 主流銀行仍 SMS-OTP + soft token app（HSBC PassKey App、Hang Seng Mobile App 等）— 並非 FIDO2-compliant、但比純 SMS 安全。**securities account**（IBKR HK、Charles Schwab、Tiger Brokers）多支援 TOTP／hardware key
- **同 dataset / 工具**：
  - [HaveIBeenPwned](https://haveibeenpwned.com/) — 查 email/password breach
  - [Privacy.com](https://privacy.com/) — virtual cards（US-only）
  - **Bitwarden** 已採用為 password manager（補充：可整理一條 [[Tech/Security|Security stack]] reference page）
- **GitHub repo 可做嘅事**：
  - 喺 `/regions/hk.yml` 加 missing HK services（如本地 startup／fintech）
  - PR 修 outdated 數據
  - Fork 做自己 organization 嘅 internal 2FA audit tool
- **API use case**：可整 Claude Code skill — 餵 service list、API 自動 enrich 每個 service 嘅 2FA 支援度

## Related

- *(未連入 wiki；可考慮起一個 [[Personal/Security stack]] 頁集中 password manager / 2FA / VPN / backup 嘅 personal configuration — value 同 [[Personal/Ideas|搵錢 ideas]] 並重)*
- **Primary source**：<https://github.com/2factorauth/twofactorauth>
- **Site API**：<https://2fa.directory/api/>（site nav 內提及）

<!-- ===== ARCHIVE BELOW · 防 link-rot 全文與留言 ===== -->

## Full Content (archived)

> **2FA Directory**
>
> List of sites with two factor auth support which includes SMS, email, phone calls, hardware, and software.

### Categories（HK locale，37 個）

```
Backup and Sync         Cryptocurrencies     Hosting/VPS              Security
Banking                 Developer            Identity Management      Social
Betting                 Domains              Investing                Task Management
Cloud Computing         Education            IoT                      Tickets and Events
Communication           Email                Legal & Compliance       Transport
Creativity              Entertainment        Marketing & Analytics    Travel and Accommodations
Crowdfunding            Finance              Payments                 Universities
                        Food                 Post and Shipping        Utilities
                        Gaming               Remote Access            VPN
                        Health               Retail                   Other
```

### Site footer / disclaimer

> The data on this website is crowdsourced and some data may be outdated.
>
> 2fa.directory is maintained by the **non-profit 2factorauth** and hosted on **GitHub**.

### Navigation links

- About — <https://2fa.directory/about/>
- Bots — Telegram / Slack / Discord bot for query
- Privacy — <https://2fa.directory/privacy/>
- API — <https://2fa.directory/api/>
- Legal — <https://2fa.directory/legal/>
- Contributing — <https://2fa.directory/contributing/>
- GitHub repo — <https://github.com/2factorauth/twofactorauth>

### Technical note（抓取過程記錄）

- Defuddle：抓唔到（SPA、無 server-side render；報「No content could be extracted」）
- curl + UA：得 1 行 HTML、JS-rendered content 全部要 client run
- **Playwright（headed Chrome）成功**：navigate → DOM stable 後 evaluate document.body.innerText 拎到 categories list
- Sub-page（如 /hk/banking/）2026-06-22 嘅 backend API call 失敗、顯示「Failed to load categories」— 可能係 site 暫時 outage，唔係 client issue

## Key Comments

*(2FA Directory SPA 無 inline 留言；社群討論／PR 喺 GitHub repo issues／PR 上發生 — 屬 active 開源項目)*
