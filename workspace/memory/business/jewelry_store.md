# Jewelry Store — Context File

---

## Mission
Buy, evaluate, list, and market pre-owned jewelry efficiently across multiple platforms, targeting <5 minutes from intake to live listing.

---

## Business Model
- **Primary:** Flip pre-owned jewelry (buy low, sell market)
- **Margin target:** 50-200% depending on piece
- **Volume target:** 500+ listings/month at scale

---

## Platforms

| Platform | Status | Focus | Fee Structure |
|----------|--------|-------|---------------|
| eBay | ✅ Active | Volume, auctions | 13% final value |
| Facebook Marketplace | ✅ Active | Local, no fees | Free |
| Craigslist | ✅ Active | Local, quick flips | Free |
| Shopify | 🔜 Planned | Brand control, higher margins | $39/mo + 2.9% |

---

## Tech Stack

| Tool | Purpose | Status |
|------|---------|--------|
| OpenClaw | Agent orchestration, memory | ✅ Active |
| Supabase | Inventory database, tracking | 🔑 Needs project setup |
| Obsidian | Knowledge base, SOPs | ✅ Active |
| MCPHub | MCP server management | ✅ Active |

---

## Listing Pipeline (Target State)

```
Acquire → Evaluate → Price → Photo → List → Ship
   │          │         │        │       │       │
  Human      AI        AI      AI     Auto    Human
   │          │         │        │       │
   └──────────┴─────────┴────────┴───────┘
              Human: 2 min total
```

### Listing Steps (Target: <5 min)
1. **Intake** (30 sec) — Photo front/back, enter weight/material
2. **Evaluate** (30 sec) — AI identifies piece, suggests category
3. **Price** (15 sec) — AI suggests price based on comps + market
4. **Photo** (30 sec) — AI enhances, crops, adds watermark
5. **List** (15 sec) — AI writes title, description, ships to all platforms

---

## Inventory Categories
- **Rings** — Gold, silver, platinum, with/without stones
- **Necklaces** — Chains, pendants, statement pieces
- **Bracelets** — Bangles, chains, charm bracelets
- **Earrings** — Studs, drops, hoops
- **Watches** — Fashion and vintage
- **Loose stones** — Diamonds, gemstones
- **Vintage/antique** — Higher margin, slower turnover

---

## Pricing Strategy
- Check gold/silver spot prices daily
- Use eBay sold listings for comps
- Factor in: material value + condition + rarity + demand
- Auto-reprice after 30 days if no sale
- Bundle discounts for multiple items

---

## Current Status
- [x] Architecture designed
- [x] Agent configs created
- [ ] Supabase database set up
- [ ] Photo processing pipeline
- [ ] Listing automation
- [ ] Cross-platform sync
- [ ] Pricing engine

---

## Key Metrics to Track
- Time from acquisition to live listing
- Listings per week
- Average sale price vs. acquisition cost
- Days to sell (inventory turnover)
- Return rate
- Platform performance comparison

---

*Last updated: 2026-06-19*
