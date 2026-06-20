# Trapclaw AI Operating System

Trapclaw is a persistent layered memory architecture (PLMA) for an AI executive assistant.

## Structure

```
workspace/          — OpenClaw workspace, memory, agents, persona files
obsidian-vault/     — Obsidian knowledge base, SOPs, prompt libraries, templates
configs/            — OpenClaw + MCPHub configuration (secrets redacted)
```

## Workspace Files

- `AGENTS.md` — Operational workspace guide
- `SOUL.md` — Identity and personality
- `USER.md` — Robert (Boss) context
- `IDENTITY.md` — Who I am
- `TOOLS.md` — Tool-specific notes
- `HEARTBEAT.md` — Periodic check tasks
- `MEMORY_ARCHITECTURE.md` — PLMA design
- `PLMA_Architecture.md` — Full system architecture

## Memory Structure

```
memory/
├── MEMORY.md       — Long-term curated knowledge
├── DREAMS.md       — Strategic vision
├── daily/          — Daily session logs
├── agents/         — Agent configs (executive, jewelry, content, research)
├── business/       — Business context (jewelry, content)
└── *.md            — Timestamped session logs
```

## Obsidian Vault

```
obsidian-vault/
├── Agents/         — Agent configuration notes
├── Business/       — SOPs and prompt libraries
│   ├── Content_Business/
│   └── Jewelry_Store/
├── Templates/      — Note templates
└── Daily_Notes/    — Synced from memory/daily/
```

## Security

- API keys and tokens are redacted from configs
- `system-access.md` excluded (contains secrets)
- `.gitignore` blocks `.env`, `*.key`, `*.pem`, `secrets/`
- All repos are private

## GitHub Accounts

- **Bzcasper** — Primary development account
- **scentblenderaromacompany-source** — Business account (this repo)
