# TOOLS.md - Local Notes

Skills define _how_ tools work. This file is for _your_ specifics — the stuff that's unique to your setup.

## What Goes Here

Things like:

- Camera names and locations
- SSH hosts and aliases
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

## Examples

```markdown
### Cameras

- living-room → Main area, 180° wide angle
- front-door → Entrance, motion-triggered

### SSH

- home-server → 192.168.1.100, user: admin

### TTS

- Preferred voice: "Nova" (warm, slightly British)
- Default speaker: Kitchen HomePod
```

## Why Separate?

Skills are shared. Your setup is yours. Keeping them apart means you can update skills without losing your notes, and share skills without leaking your infrastructure.

## MCPHub — Central Tool Gateway
- **URL:** http://localhost:3001
- **MCP Endpoint:** http://localhost:3001/mcp (streamable-http)
- **Smart Routing:** http://localhost:3001/mcp/$smart
- **OpenAPI:** http://localhost:3001/api/openapi.json
- **Stats:** http://localhost:3001/api/openapi/stats
- **Health:** http://localhost:3001/health
- **Dashboard:** http://localhost:3001
- **Database:** PostgreSQL + pgvector (mcphub@localhost:5432/mcphub)
- **Embeddings:** NVIDIA NIM nv-embed-v1 (4096 dims)
- **Start:** `bash /home/bobby/mcphub/start.sh`
- **PID:** `/tmp/mcphub.pid`
- **Logs:** `/tmp/mcphub.log`

### 8 MCP Servers (92 tools)
| Server | Tools | Purpose |
|---|---|---|
| obsidian | 16 | Vault notes, search, create, edit |
| github | 26 | Repos, issues, PRs, CI |
| playwright | 23 | Browser automation |
| filesystem | 14 | File read/write/list |
| memory | 9 | Mem0 long-term memory |
| context7 | 2 | Live library docs |
| fetch | 1 | URL fetching |
| sequential-thinking | 1 | Chain-of-thought reasoning |

### Groups
- **business** — all 8 servers
- **research** — context7, fetch, playwright
- **knowledge** — obsidian, memory, filesystem
- **dev** — github, sequential-thinking
- **jewelry** — obsidian, filesystem, github, memory
- **content** — playwright, fetch, github, memory, context7

### Built-in Prompts
- **jewelry-listing** — Generate eBay listings with SEO optimization
- **content-repurpose** — Repurpose content for multiple platforms
- **market-research** — Research jewelry pricing and trends

### Built-in Resources (Reference Files)
- **jewelry-materials** — Gold, silver, platinum types and hallmarks
- **ebay-seo-keywords** — High-performing eBay keywords
- **content-templates** — Social media content templates

### Tool Call (no auth needed)
```bash
curl -X POST http://localhost:3001/api/tools/{server}/{tool} \
  -H "Content-Type: application/json" \
  -d '{"arg":"value"}'
```

## Obsidian
- Vault: `/home/bobby/obsidian-vault/`
- MCP: seekstone (filesystem-direct, no REST API needed)
- Daily sync: cron job runs hourly, syncs `memory/daily/` ↔ `Daily_Notes/`
- Sync script: `memory/sync-daily-notes.sh`

## GitHub Backup
- **Consolidated Repo:** https://github.com/Bzcasper/trapclaw (private)
  - 105 files: workspace + obsidian vault + configs
  - Structure: workspace/, obsidian-vault/, configs/, README.md
  - Configs: openclaw.json, mcp_settings.json (secrets redacted)
  - Secrets excluded: system-access.md, .env
- **Old repos to delete (web UI):**
  - Bzcasper/openclaw-workspace
  - Bzcasper/obsidian-vault

## Browser
- Always run headless when possible
- Use target="sandbox" when available, fall back to host

---

Add whatever helps you do your job. This is your cheat sheet.

## Related

- [Agent workspace](/concepts/agent-workspace)
