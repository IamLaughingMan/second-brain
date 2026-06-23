---
type: bookmark
para: resource
domain: Finance
title: "Most Shorted Stocks - Heavily Shorted Names & Short Interest"
url: https://financhill.com/most-heavily-shorted-stocks-today
publisher: Financhill
status: active
created: 2026-06-23
updated: 2026-06-23
summary: Financhill 嘅「most heavily shorted stocks today」頁，URL 暗示係 live screener，但 defuddle 抓到嘅 visible content 係一篇 short selling 101 長文（screener 數據表估計 JS-loaded）；educational content 涵蓋 short selling 步驟／margin account／Boeing 2020 case／short vs put／best stocks to short（壞 financials／negative sentiment／fraud suspect）。
tags:
  - bookmark
  - finance
  - stocks
  - short-selling
  - screener
  - tutorial
  - financhill
  - js-data-not-captured
---

# Financhill — Most Shorted Stocks screener + short selling 101

## Summary

Financhill 嘅 `/most-heavily-shorted-stocks-today` 頁。**URL 同 title 講「heavily shorted stocks today」**，但 defuddle 靜態抓得到嘅 visible content 主要係一篇 **short selling 入門長文**——live screener 嘅 ticker／SI／borrow fee 表估計係 client-side JS rendering（要 Playwright 先攞到）。Educational content 涵蓋 short selling 流程、margin account、Boeing 2020-Q1 案例、short vs put options 比較、best stocks to short heuristics。

## Key Takeaways — Short Selling 101 part

### Short selling 4 步框架

1. 由 brokerage **借股** + **立即 sell**
2. **付 borrowing interest**（唔免費）
3. **股價跌時 buy back**（cover）
4. **還股、賺差價** 減手續費／利息

### Margin account 規矩

- 要開 **margin account** 先可 short（leverage against portfolio）
- 一般可借至 portfolio value 嘅 **50%**
- Brokerage 收 borrow fee／interest，連續持倉時間長 → 利息可能 **erode 全部 profit**

### Short Selling Example — Boeing 2020

- 2019-02 BA peak ~$418
- 2020-02-14 借 short @ $340.49
- 2020-03-20 COVID crash → cover @ $95
- **每股賺 ~$144（minus interest/fees）；100 股賺 $14,400**

### "Short against the box"（用自己持股 short）

- 屬合法但歷史上用嚟避稅
- SEC 反制 rule：跌穿 10% in 24 hours 嘅股**唔可用呢方法 short**

### Short vs Put options

| 維度 | Short selling | Put buying |
|------|---------------|------------|
| Margin requirement | 高 | 唔需要 margin（限於 premium） |
| Max loss | 理論上**無限**（股價 unlimited up） | **限定於 premium** |
| Walk-away ability | 唔可以（必須 cover） | 可以（揀唔 exercise） |
| Capital | 借 portfolio value | Premium 上限 |

### Best stocks to short — Heuristics

1. **Very bad financials**（高負債／無 profit／勉強 break-even；e.g. Uber 估值 $50B 但無 profit）
2. **Negative sentiment**（消費者厭惡、PR scandal；e.g. PG&E 2020 California 切電 + 山火免責）
3. **Suspected fraud**（[Citron Research](https://citronresearch.com/) targets；SEC investigation pending）

### Famous short stories

- COVID 2020-03 short sellers 賺 **$50B+**（per Bloomberg）
- 2008 房市 squeeze → 《The Big Short》電影（Christian Bale／Steve Carell／Brad Pitt）

## What's Missing（JS-loaded screener data）

Defuddle 抓唔到，但 live page 應該有：
- Top heavily-shorted ticker list（symbol／name／SI %／short shares／DTC／borrow fee）
- 每日更新 snapshot
- 可能有 sortable table／filter／export

→ 要 **Playwright fallback** 至能截取 live data（per [[project-playwright-mcp]] memory escalation order）。

## My Notes

- **直接 feeder 入 [[Squeeze candidate watchlist — 掃 SI overflow 股做 short squeeze play]] idea**：呢個 page 可以做日常 watchlist sourcing 起點，配合 Ortex／S3 Partners 嘅 deeper data 用。
- **缺數據 quality concern**：Financhill 唔列數據出處／refresh frequency／SI 計算 methodology，要 cross-check vs 官方來源（FINRA reported short sale volume／NYSE/Nasdaq bi-weekly SI report）。
- **真正 screening tools 對比**：
  - **Ortex** — 行業 gold standard、real-time SI／borrow rate（但要 paid sub ~$100/mo）
  - **S3 Partners** — institutional grade、analyst commentary（昂貴）
  - **Fintel** — affordable、freemium SI／borrow fee
  - **Financhill** — free 但 SEO-driven、數據 freshness 存疑
  - **WhaleWisdom / SwaggyStocks** — retail-friendly
- **Educational 長文價值**：適合做 short selling 概念 reference page，但 actionable 數據需配合上面 paid tools。
- **2020 Boeing example** 已過時（5+ 年），可拎嚟 backtest reasoning 唔可以拎嚟做 current trade reference。

## Related

- [[Squeeze candidate watchlist — 掃 SI overflow 股做 short squeeze play]] — 直接配 idea（呢個 page 做 sourcing input）
- [[PTT Stock — GME 風波曾限制交易券商名單 4 組分級（disp.cc 鏡像 2021）]] — Reddit／PTT WSB 散戶 short squeeze case
- [[TQQQ 10 年漲 7298% 但 WSJ 不建議貿然購買 槓桿衰減（風傳媒轉載 WSJ 2020）]] — leveraged ETF path-dependency 反例
- [[冷知識]] — Overflow Attack（短倉溢出攻擊）詞解

<!-- ===== ARCHIVE BELOW — link-rot snapshot, lower priority for triage ===== -->

## Full Content (archived)

> **註**：defuddle 抓到嘅係 visible static educational content（175 行）；live screener 嘅 ticker／SI 表估計 JS-loaded，未抓到。下面係教育長文部分嘅 verbatim snapshot。

### Top Blue Chip Stocks, Dividend Stocks and more

View a list of top stocks on NASDAQ and NYSE

### Stock Forecasts, Price Charts, Annual Reports and More

### Best Stocks Under $X categories

- [Best Stocks Under $100](https://financhill.com/best-stocks-under-100)
- [Best Stocks Under $75](https://financhill.com/best-stocks-under-75)
- [Best Stocks Under $50](https://financhill.com/best-stocks-under-50)
- [Best Stocks Under $35](https://financhill.com/best-stocks-under-35)
- [Best Stocks Under $20](https://financhill.com/best-stocks-under-20)
- [Best Stocks Under $10](https://financhill.com/best-stocks-under-10)
- [Best Stocks Under $5](https://financhill.com/best-stocks-under-5)
- [Best Stocks Under $2](https://financhill.com/best-stocks-under-2)
- [Best Stocks Under $1](https://financhill.com/best-stocks-under-1)

Everyone knows that they can make money by purchasing stocks at low prices and waiting for their values to increase. At that point, you can sell your stocks to earn a tidy profit.

Fewer people know that money can be made by betting on stocks falling. **Short selling is a strategy that takes advantage of declining stocks**. If you feel intimidated by this option, short selling for dummies will introduce you to popular strategies and how you can take advantage of fluctuations in the stock market.

### What Is Short Selling Stock?

Short selling is a pretty advanced form of trading. If you don't have experience investing conventionally, you should probably stay away from it.

Once you feel confident to dip your toes into short selling stock, it makes sense to follow the rules established by short selling for dummies. It's probably best to go slow at the beginning so you can keep the risks as low as possible.

To begin, let's break short selling stock into a few steps that you can follow easily:

1. **Borrow a company's shares** whose value you believe will fall soon from your brokerage firm and sell them immediately.
2. **Pay interest on the borrowed amount** to the brokerage you borrowed from. They don't let you borrow for free!
3. **When share prices fall as expected, buy back your position.** Someone else is willing to buy the shares from you at the current price, which lets you pocket some cash immediately. Or, wait for the stock's value to keep falling, which gives you a chance to buy shares at even lower prices.
4. Return the shares to the brokerage and **keep the difference between the previous and current values**. Minus the fees and interest, of course.

That's the basic blueprint you can follow.

### How Do You Borrow a Stock to Short Sell?

You need to **start by opening a "margin account" with your brokerage**. A margin account lets you borrow against the investments in your portfolio.

How much can you borrow? The amount differs depending on your brokerage. **Generally, you can expect to borrow up to 50% of your portfolio's value.**

Keep in mind that the more you borrow, the more you could lose. If you can't afford to lose 50% of your portfolio, it's probably not a good idea to risk that much.

Some benefits of margin accounts include:

- **Letting you borrow stocks that you want to short.**
- **Giving you access to funds when your brokerage isn't open.**
- **Making it possible for you to buy trending stocks outside of your brokerage's hours.**
- **Allowing you to enter options trades, such as credit spreads.**

Remember that the brokerage will charge some kind of fee for borrowing money. Brokerages let members create margin accounts so the brokerages can make more money.

### How Long Can You Short a Stock?

**Technically, you can short a stock for as long as you want.** In practice, your brokerage may have limits that define how long you can borrow the stocks you want to short. Even if your brokerage doesn't enforce limits, it may continue to charge you interest on the borrowed stock. Eventually, the interest charge will offset any profits that you make from the short sell. **You may even lose money if your interest charges get high enough.**

### Short Selling Example — Boeing

1. **Find an overvalued stock** with a value you believe will crash soon. Use Boeing Co (BA) at the end of 2019. For decades, Boeing's stock never broke the $100 barrier. In mid-2013, the stock's value began an unprecedented climb. The value peaked at nearly $418 on February 2019. By March 20, 2020, the price had dipped below $100, partially because of the COVID-19 pandemic.
2. **Place a short trade with your broker** by borrowing the stock you want to bet against.
3. **If you are aiming to make money from a quick share price decline**, short sell the stock and buy it back on a dip.
4. **Wait for the share price to fall more** if you plan to earn more from a bigger decline. With Boeing, you could have borrowed the stock on February 14, 2020, when it was worth $340.49. On March 20, 2020, you sell the stock when it reaches $95. With a 50% margin requirement and no dividends, you will make about $144 per share minus the brokerage's margin interest percentage.

Obviously, there are a lot of moving parts. And there are never any guarantees. In this case, though, short selling 100 Boeing shares would have earned you **$14,400 minus interest, fees and commissions**.

### Can I Short Sell a Stock I Own?

Yes. This scenario is called "**[short selling against the box](https://www.sec.gov/investor/pubs/regsho.htm)**." Most investors do not use this strategy to earn money. Instead, they use it to avoid taxes. The Securities and Exchange Commission got wise to the strategy about 10 years ago. To combat tax-evaders, **the SEC issued a rule that prevents you from short selling a stock that falls more than 10% in 24 hours.**

### Short Selling Pros and Cons

**Pros**:
- Add diversity to your portfolio, making it possible for you to earn money even when the stock market doesn't perform well.
- Bull markets often lead investors into false sense of security. Short selling can protect you from that mentality.
- You can potentially make a lot of money without putting much at risk.

**Cons**:
- You take a big risk on trusting your instinct that a stock value will fall soon.
- When too many people short sell stocks, it can drive the overall stock market down.
- It's very difficult to decide when to close a short sale to get the maximum payout.
- You always have to pay your brokerage an upfront fee, whether you earn or lose money.

### Short Selling vs Puts Buying

**Pros & cons comparison**:

- **Short selling often has higher margin requirements than put buying.**
- **Put buying lets you walk away from a deal that doesn't go your way.**
- **Buying puts helps to limit a trader's potential loss.**
- **Short selling lets investors borrow money against their portfolios instead of spending cash.**

### Is Short Selling Risky?

Yes. In March 2020, Bloomberg reported than short sellers had made more than **$50 billion** during the COVID-19 sell-off. Some made money because they believed COVID-19 in China would spread around the world. Others were short selling stocks because they could not believe the market could sustain itself.

The short sellers who saw conflict between the economy and the stock market may have detected similarities between the real estate bubble and the economy that took place in 2008. During that recession, a handful of smart investors made billions of dollars betting against the market. Adam McKay even directed **"The Big Short"** (Christian Bale, Steve Carell, Brad Pitt).

### Best Stocks to Sell Short

**Stocks With Very Bad Financials** — high debt, struggle to profit. Uber example: unprofitable but $50B+ valuation.

**Stocks With Negative Sentiment** — consumer dislike. PG&E 2020 example: California outages + wildfire liability immunity.

**Companies Suspected of Fraudulent Accounting** — hard to detect until SEC involved. **[Citron Research](https://citronresearch.com/)** is famous for targeting suspected fraud.

> The bottom line is short selling gives you a different way to earn money from the stock market. Know your risks and potential rewards before you get involved.

## Key Comments

Financhill 文章頁無留言區（屬 SEO content site 模式，無公開評論系統）—— **屬原文無留言、非抓取失敗**。Live screener data table 未抓取（JS-loaded，需 Playwright fallback）。
