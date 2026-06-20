# Jewelry Business Memory

## Business Overview

### Platforms
- **eBay** - Primary marketplace for jewelry sales
- **Facebook Marketplace** - Local sales, higher margins
- **Craigslist** - Local pickup, no shipping hassles
- **Shopify** - Brand store, higher margins, brand building

### Tools & Infrastructure
- **Supabase** - Database, auth, real-time, edge functions
- **eBay API** - Listing management, orders, inventory sync
- **Shopify API** - Product sync, orders, inventory
- **Facebook Graph API** - Marketplace listings
- **Craigslist** - Manual or API via third-party

### Inventory & Operations
- **Inventory tracking**: Supabase (PostgreSQL)
- **Photography**: Lightbox setup, consistent lighting
- **Pricing strategy**: Cost + margin + market research
- **Shipping**: USPS Priority, insured, signature >$500
- **Returns**: 30-day returns, buyer pays return shipping

## Goals (90-Day Roadmap)

### Phase 1: Foundation (Weeks 1-4)
- [ ] Supabase schema finalized and deployed
- [ ] eBay API integration live (listings, orders, inventory)
- [ ] Shopify store live with 50+ products
- [ ] FB Marketplace posting automation
- [ ] Photography workflow documented

### Phase 2: Automation (Weeks 5-8)
- [ ] Auto-listing from Supabase → eBay/Shopify/FB
- [ ] Auto-pricing based on comps + margins
- [ ] Auto-inventory sync across platforms
- [ ] Customer inquiry auto-response templates
- [ ] Shipping label automation

### Phase 3: Scale (Weeks 9-12)
- [ ] 200+ active listings across platforms
- [ ] $10k/month revenue run rate
- [ ] Automated reorder points for materials
- [ ] Customer retention email sequences
- [ ] FB/IG ad campaigns for Shopify store

## Key Metrics (Targets)
- **Listings active**: 200+ across platforms
- **Monthly revenue**: $10k by week 12
- **Sell-through rate**: >30% monthly
- **Average margin**: >60%
- **Customer response time**: <2 hours

## Inventory Categories
1. **Gold Jewelry** - Chains, rings, pendants (14k, 18k)
2. **Silver Jewelry** - Sterling, argentium
3. **Gemstone Jewelry** - Diamonds, colored stones
4. **Vintage/Estate** - Estate pieces, signed pieces
5. **Watches** - Mechanical, quartz, smart

## Pricing Framework
- **Cost basis**: Metal weight × spot + stones + labor + overhead
- **Minimum margin**: 60% (2.5x cost)
- **Market adjustment**: ±20% based on eBay sold comps
- **Platform fees**: eBay 13%, Shopify 2.9% + $0.30, FB 5%

## Customer Service Templates
- **Inquiry response**: <2 hours
- **Shipping notification**: Same day
- **Follow-up**: 7 days post-delivery
- **Review request**: 14 days post-delivery

## Suppliers & Materials
- **Metal**: Rio Grande, Stuller, Hoover & Strong
- **Gemstones**: Rio Grande, Fire Mountain, local shows
- **Findings**: Findings Direct, Halstead
- **Packaging**: Custom boxes, pouches, certificates

## Automation Targets (Jewelry Agent)
1. **Inventory sync** - Supabase → all platforms (real-time)
2. **Listing generation** - Photos + specs → optimized listings
3. **Price optimization** - Daily comp check, auto-adjust ±10%
4. **Order processing** - Auto-confirm, label, tracking, confirm
5. **Customer messages** - Template responses <2hr, escalate complex
5. **Inventory alerts** - Low stock, reorder points, slow movers
6. **Performance reports** - Weekly sales, margin, velocity reports