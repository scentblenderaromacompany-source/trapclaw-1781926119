# MEMORY.md — Long-Term Memory

> Curated knowledge distilled from daily logs. Updated periodically during heartbeats.

---

## Active Projects

### Jewelry AI Lister
- **Status:** Architecture approved, Layer 1-3 implemented
- **Goal:** Buy, evaluate, list, market pre-owned jewelry with <5 min listing time
- **Platforms:** eBay, FB Marketplace, Craigslist, Shopify (planned)
- **Stack:** OpenClaw + Supabase + Agent system
- **Current phase:** Memory architecture + agent configs complete

### Content Repurposer Pipeline
- **Status:** Architecture designed, implementation pending
- **Goal:** Autonomous content engine → $10k MRR
- **Tools:** OpenClaw, Hermes, Grok, Suno, FFmpeg, Cloudinary, Telegram
- **Current phase:** PLMA architecture approved, ready for implementation

---

## Key Decisions Made

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-06-19 | Approved PLMA architecture | 6-layer memory system for persistent AI context |
| 2026-06-19 | Mem0 for long-term semantic memory | Semantic search across memories, not just keyword matching |
| 2026-06-19 | Hybrid retrieval system | Combines vector search + keyword + recency for best recall |
| 2026-06-19 | MCPHub as central MCP hub | Manages all MCP servers from one dashboard |
| 2026-06-19 | Seekstone for Obsidian MCP | Filesystem-direct, no plugin dependency |
| 2026-06-19 | Agent hierarchy: Executive → Specialists | Clean delegation, no role confusion |
| 2026-06-19 | MCPHub = Trapclaw tool gateway | 92 tools, 8 servers, smart routing via NVIDIA NIM |
| 2026-06-19 | Created business prompts | jewelry-listing, content-repurpose, market-research |
| 2026-06-19 | Created reference resources | jewelry-materials, ebay-seo-keywords, content-templates |

---

## User Preferences

- **Name:** Robert (call him Boss or Robert)
- **Communication:** Direct, action-oriented, no fluff
- **Style:** Automation-first, maximum leverage
- **Timezone:** America/Los_Angeles (PDT)
- **Decision speed:** Fast — approve and move, don't re-litigate
- **Tech level:** High — comfortable with CLI, servers, configs
- **Pet peeves:** Redundant questions, slow progress, over-explanation

---

## Business Context

### Pre-owned Jewelry Business
- Buy at estate sales, auctions, online
- Evaluate (condition, materials, market value)
- List across multiple platforms
- Currently manual, targeting <5 min per listing
- Revenue model: margin on flip, volume play

### Content Creation Business
- Build autonomous content engine
- Multiple content types: video, image, audio, text
- Target $10k MRR through:
  - Content-as-a-service
  - Template/prompt libraries
  - Automation tools for creators
- Leverage AI for 80% of content generation

---

## Lessons Learned

- Start with memory architecture before building agents
- MCPHub centralizes MCP management — worth the setup
- Obsidian vault is the knowledge base, not a note-taking app
- Always run browser headless on servers
- NVIDIA NIM embeddings need `nvidia/nv-embed-v1` (not e5-v5 which requires input_type)
- PostgreSQL installed via apt (sudo password: [REDACTED])
- MCPHub built-in prompts/resources require `name` and `template` fields

---

*Last updated: 2026-06-19*
