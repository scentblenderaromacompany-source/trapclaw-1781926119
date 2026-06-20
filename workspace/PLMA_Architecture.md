# Product: Personalized Learning & Memory Assistant (PLMA)

## Overview

**PLMA** is a personalized learning and memory assistant designed to understand and retain user context across sessions. It achieves this through a multi-layered memory architecture, integrating OpenClaw's native memory, Mem0 Pro's long-term memory, and an Obsidian knowledge vault. By combining these layers, PLMA can provide highly contextual and relevant assistance, whether the user is managing businesses, coding, or learning new concepts.

## Architecture

The system is built on a multi-layered memory architecture, with each layer serving a specific purpose and working in concert to provide a comprehensive understanding of the user's context.

### Layers

1. **Layer 1: OpenClaw Native Memory**
2. **Layer 2: Mem0 Pro (Long-Term Memory)**
3. **Layer 3: Obsidian Knowledge Vault (Structured Knowledge)**
4. **Layer 4: Retrieval Layer (Vector Search & BM25)**
5. **Layer 5: Agent Architecture**
6. **Layer 6: Startup Sequence & Orchestration**

---

## Layer 1: OpenClaw Native Memory

**Purpose:** Ephemeral, session-specific context. Fast access, low latency, perfect for immediate task state, recent conversation history, and active project context.

**Design:**

- **MEMORY.md:** A living document, updated at the end of each session. It contains the most critical, distilled information: active projects, key decisions, learned facts, and user preferences. Think of it anchoring: what MUST be remembered?
- **DREAMS.md:** Captures long-term goals, aspirations, and "wouldn't it be cool if..." ideas. This is for the big picture stuff, the strategic direction.
- **Daily notes (`memory/YYYY-MM-DD.md`):** A log of what happened in a specific session. This is for debugging, reviewing, and understanding past conversations. It's the "flight recorder."
- **Project memory (`memory/projects/`):** Dedicated files for each active project. These contain the state, next steps, and key decisions for that project.
- **Business memory (`memory/business/`):** Similar to project memory, but for ongoing business operations (e.g., jewelry store inventory status, content calendar).
- **Agent memory (`memory/agents/`):** Stores the configuration, learned behaviors, and specific context for each specialized agent.

**Folder Structure:**

```
memory/
├── MEMORY.md                 # Curated long-term memory (sticky notes)
├── DREAMS.md                 # Long-term goals and aspirations
├── daily/
│   ├── 2026-06-19.md
│   └── ...
├── projects/
│   ├── project_a.md
│   └── ...
├── business/
│   ├── content_business.md
│   └── jewelry_store.md
└── agents/
    ├── executive.md
    ├── jewelry.md
    └── content.md
```

**File Contents (Examples):**

`MEMORY.md`:

```markdown
# MEMORY.md

## Active Projects
- **Jewelry AI Lister:** Building an AI-powered listing generator. Next step: integrate eBay API.
- **Content Repurposer:** FFmpeg pipeline for turning long-form video into short clips. Status: In progress.

## Key Decisions
- **2026-06-19:** Decided to use Mem0 Pro for long-term memory due to its semantic understanding capabilities.

## Learned Facts
- Boss prefers concise, action-oriented responses.
- Boss is allergic to shellfish (allergen: tropomyosin).

## User Preferences
- **Communication Style:** Direct, no fluff.
- **Code Comments:** Minimal, only when logic is complex.
```

`DREAMS.md`:

```markdown
# DREAMS.md

## 2026
- **Launch Content Business:** Achieve $10k MRR by end of year.
- **Automate Jewelry Store:** Reduce manual listing time to <5 mins per item.

## Long-term Vision
- **AI-powered Lifestyle:** Have AI manage 80% of daily tasks.
```

`memory/daily/2026-06-19.md`:

```markdown
# 2026-06-19

## Session Summary
- Discussed initial business automation ideas.
- Boss emphasized the need for a "CEO energy" vibe.

## Action Items
- [ ] Research eBay API rate limits.
- [ ] Set up Obsidian vault structure.
```

---

## Layer 2: Mem0 Pro

**Purpose:** Long-term, semantic memory. This is for things that need to persist beyond a single session and be retrieved based on meaning, not just keywords. It understands *concepts* and *relationships*.

**What to Store:**

- **User Facts & Preferences:** Things the user tells you about themselves. "I hate meetings on Mondays," "My daughter's birthday is June 19th," "I prefer Python over JavaScript."
- **Business Context:** "The jewelry store's average profit margin is 40%," "The content business's primary audience is Gen Z."
- **Learned Behaviors:** "The user prefers to batch similar tasks," "The user gets frustrated when I ask for clarification too often."
- **Project History:** What you tried, what worked, what didn't. "The eBay API integration failed because of OAuth issues."

**What NOT to Store:**

- **Transient Data:** Current session state, temporary calculations.
- **Raw Logs:** Full conversation transcripts. (Mem0 should store the *distilled* learning, not the raw data.)
- **Sensitive Information:** Passwords, API keys, financial data. (This is a security risk and belongs in a secure vault.)

**Categorization:**

Mem0 memories should be tagged with a `category` to improve retrieval:

- `category: "user_preference"`
- `category: "business_context"`
- `category: "learned_behavior"`
- `category: "project_history"`
- `category: "relationship"`

**Retrieval Strategy:**

When a user asks a question, the system should:

1. **Search Mem0 for relevant memories:** Use the user's query as the search key.
2. **Rank memories by relevance:** Mem0 does this automatically based on semantic similarity.
3. **Inject top memories into the context window:** Provide these as "facts I know" to the model.

**Memory Consolidation:**

Over time, memories can become redundant or contradictory. A periodic consolidation process should:

1. **Identify similar memories:** Use Mem0's semantic search to find duplicates or near-duplicates.
2. **Merge or update:** If two memories say the same thing, keep the most recent. If they contradict, flag for user review.
3. **Archive old memories:** If a memory is no longer relevant (e.g., a completed project), archive it to a "cold storage" to reduce noise.

**Recommended Configuration:**

Use Mem0's built-in categorization and metadata features. Set a high `relevance_threshold` to ensure only the most pertinent memories are retrieved.

---

## Layer 3: Obsidian Knowledge Vault

**Purpose:** Structured, human-readable knowledge. This is for things that need to be organized, linked, and easily browsable by the user. It's the "source of truth" for documented SOPs, research, and detailed project plans.

**Folder Hierarchy:**

```
Obsidian/
├── + Encounters/           # Daily logs, fleeting notes (Zettelkasten style)
├── + Source Notes/         # Literature notes, website captures
├── + Project Notes/        # Project-specific knowledge
├── + Evergreen Notes/      # Permanent, refined knowledge
├── + Business/
│   ├── Jewelry Store/
│   │   ├── SOPs/
│   │   │   ├── Photography.md
│   │   │   └── Listing.md
│   │   ├── Inventory/
│   │   │   └── (tracked in Supabase, but notes here)
│   │   └── Marketing/
│   └── Content Business/
│       ├── SOPs/
│       │   ├── Video Production.md
│       │   └── Content Repurposing.md
│       └── Prompt Libraries/
│           ├── Image Generation.md
│           └── Video Scripts.md
├── + Research/
│   └── (topic-based notes)
├── + Agents/
│   ├── Executive Agent.md
│   ├── Jewelry Agent.md
│   └── Content Agent.md
└── + Daily Notes/
    └── (symlinked from OpenClaw's memory/daily)
```

**Note Templates (Examples):**

`+ Business/Jewelry Store/SOPs/Photography.md`:

```markdown
# Photography SOP

## Purpose
To create consistent, high-quality product photos for the jewelry store.

## Equipment
- Camera: [Model]
- Lighting: [Setup]
- Background: [Material]

## Steps
1. Clean the piece.
2. Set up the lighting.
3. Shoot from 3 angles (front, side, detail).
4. Edit in [Software] (use preset "Jewelry Default").
5. Upload to Cloudinary with folder `jewelry/raw/YYYY-MM-DD`.

## Common Issues
- Reflections: Adjust light angle.
- Blur: Use tripod, increase shutter speed.
```

`+ Agents/Executive Agent.md`:

```markdown
# Executive Agent

## Responsibilities
- Plan and prioritize tasks across all businesses.
- Generate weekly and monthly reports.
- Identify bottlenecks and opportunities.

## Tools
- Calendar
- Notion (via MCP)
- Email

## Access
- **OpenClaw Memory:** Read/Write
- **Mem0:** Read
- **Obsidian:** Read (all vaults)
```

---

## Layer 4: Retrieval Layer

**Purpose:** To find the most relevant information from all memory sources quickly and accurately.

**Evaluation of Options:**

| Solution | Pros | Cons | Recommendation |
|---|---|---|---|
| **QMD (Quick Markdown Database)** | Simple, file-based, easy to sync with Obsidian | Limited semantic search, not scalable for large datasets | Not for primary retrieval |
| **Local Vector DB (e.g., ChromaDB, LanceDB)** | Fast, private, full control | Requires setup, maintenance | **Primary for unstructured data** |
| **BM25 + Embeddings (Hybrid)** | Handles exact matches and semantic similarity | More complex to set up | **Best overall for accuracy** |
| **Mem0 Built-in Search** | Already integrated, semantic by default | Less control over ranking logic | Good for Mem0-specific retrieval |

**Recommended Solution: Hybrid Search (BM25 + Embeddings)**

1. **Index all text-based memory sources** (OpenClaw notes, Obsidian vault, Mem0 memories) into a local vector database (e.g., ChromaDB).
2. **Use BM25 for keyword matching:** When the user uses specific terms (e.g., "eBay API"), BM25 is excellent at finding exact matches.
3. **Use Embeddings for semantic matching:** When the user's query is conceptual (e.g., "How do I list things faster?"), embeddings find related concepts even if the keywords don't match.
4. **Combine results:** Use a re-ranking algorithm to merge the results from both methods and present the most relevant information.

**Why this is the best:** It provides the highest recall and precision. BM25 catches the details, embeddings catch the meaning. This is crucial for a system that needs to understand context over a wide range of topics.

---

## Layer 5: Agent Architecture

**Purpose:** To specialize different parts of the system for specific tasks, improving efficiency and accuracy.

### 1. Executive Agent

- **Responsibilities:**
  - High-level planning and orchestration.
  - Task delegation to other agents.
  - Weekly/monthly report generation.
  - Bottleneck identification.
- **Tools:** Calendar, Notion, Email, all other agents.
- **Memory Access:**
  - **OpenClaw:** Full access (read/write).
  - **Mem0:** Read (for user preferences and business context).
  - **Obsidian:** Read (for SOPs and project status).
- **Inter-agent Communication:**
  - Can send tasks to the Jewelry, Content, and Research agents.
  - Receives status updates from all other agents.

### 2. Jewelry Agent

- **Responsibilities:**
  - Manage jewelry inventory and listings.
  - Automate listing creation.
  - Monitor sales and adjust pricing.
  - Handle customer inquiries related to jewelry.
- **Tools:** eBay API, Facebook Marketplace API, Shopify API, Supabase, Grok (for listing generation).
- **Memory Access:**
  - **OpenClaw:** Read/Write (project notes for jewelry store).
  - **Mem0:** Read (for business context like pricing strategies).
  - **Obsidian:** Read/Write (SOPs, inventory notes, marketing plans).
- **Inter-agent Communication:**
  - Receives tasks from the Executive Agent.
  - Can request research from the Research Agent (e.g., "Find comparable sales for this ring").

### 3. Content Agent

- **Responsibilities:**
  - Manage content creation pipelines.
  - Automate video/image generation.
  - Repurpose content for different platforms.
  - Schedule and publish content.
- **Tools:** OpenClaw, Hermes, Grok, FFmpeg, Cloudinary, Telegram.
- **Memory Access:**
  - **OpenClaw:** Read/Write (project notes for content business).
  - **Mem0:** Read (for learned content performance, user style preferences).
  - **Obsidian:** Read/Write (prompt libraries, content calendars, SOPs).
- **Inter-agent Communication:**
  - Receives tasks from the Executive Agent.
  - Can request research from the Research Agent (e.g., "Find trending topics in AI art").

### 4. Research Agent

- **Responsibilities:**
  - Gather information from the web.
  - Analyze trends and competitors.
  - Deep-dive into specific topics as requested by other agents.
  - Maintain a "research log" in Obsidian.
- **Tools:** Web search, web scraping, Grok, Notion.
- **Memory Access:**
  - **OpenClaw:** Read (relevant project notes).
  - **Mem0:** Read (for business context).
  - **Obsidian:** Read/Write (research notes, source materials).
- **Inter-agent Communication:**
  - Receives task requests from Jewelry, Content, and Executive Agents.
  - Returns findings to the requesting agent.

---

## Layer 6: Startup Sequence

**Purpose:** To ensure the system is fully initialized and has all the context it needs before accepting tasks.

**Workflow:**

1. **Load Memories:**
   - Read `MEMORY.md` and `DREAMS.md` into the context window.
   - Load any active project notes from `memory/projects/`.
2. **Sync Obsidian:**
   - Check if the Obsidian vault has been modified since the last session.
   - If so, update the local cache of Obsidian notes.
3. **Refresh Retrieval Indexes:**
   - Re-index any new or modified Obsidian notes in the local vector database.
   - Re-index any new or modified OpenClaw native memory files.
4. **Load Active Projects:**
   - Identify which projects have the status "in_progress" or "active".
   - Load their details into the context window.
5. **Generate Executive Briefing:**
   - The Executive Agent compiles a summary of:
     - Active projects and their status.
     - Any urgent tasks or deadlines.
     - New information learned since the last session.
     - Recommended priorities for the current session.

**Example Briefing:**

```markdown
# Executive Briefing - 2026-06-19

## Active Projects
- **Jewelry AI Lister:** Integrating eBay API. Status: Blocked (waiting for OAuth credentials).
- **Content Repurposer:** FFmpeg pipeline ready for testing.

## Urgent Items
- Boss needs a report on Q2 jewelry sales by EOD.
- eBay API credentials need to be renewed (expire in 3 days).

## New Information
- Learned that Boss prefers Notion over Google Docs for reports.

## Recommended Priorities
1. Unblock eBay API integration.
2. Test content repurposer pipeline.
3. Generate Q2 sales report.
```

---

## Implementation Plan

### Architecture Diagram

```
+-------------------+     +-------------------+     +-------------------+
|  OpenClaw Native  |<--->|      Mem0 Pro     |<--->| Obsidian Vault   |
|     Memory        |     |   (Long-Term)     |     | (Structured)     |
| (memory/*.md)     |     | (Semantic API)     |     | (Notes/SOPs)     |
+-------------------+     +-------------------+     +-------------------+
         ^                         ^                         ^
         |                         |                         |
         +-------------------------+-------------------------+
                                   |
                          +-------------------+
                          |   Retrieval     |
                          |    Layer        |
                          | (ChromaDB/BM25) |
                          +-------------------+
                                   |
                          +-------------------+
                          |   Agent Layer     |
                          | (Executive, etc.) |
                          +-------------------+
                                   |
                          +-------------------+
                          |   User Interface  |
                          |   (Webchat, etc.) |
                          +-------------------+
```

### Recommended Plugins & MCP Servers

- **OpenClaw Mem0 Plugin:** For Mem0 Pro integration.
- **Obsidian MCP:** For programmatic access to the Obsidian vault.
- **Notion MCP:** For task and project management.
- **ChromaDB/LanceDB:** For local vector storage.

### Implementation Order

1. **Phase 1: Foundation (Weeks 1-2)**
   - Set up the folder structure for all memory layers.
   - Configure Mem0 Pro with appropriate categories and rules.
   - Install and configure Obsidian MCP.
   - Set up the local vector database.

2. **Phase 2: Integration (Weeks 3-4)**
   - Implement the startup sequence.
   - Build the retrieval layer (indexing, search, ranking).
   - Connect OpenClaw native memory to the retrieval layer.

3. **Phase 3: Agent Development (Weeks 5-6)**
   - Define agent responsibilities and tools.
   - Implement inter-agent communication protocols.
   - Build the executive briefing generator.

4. **Phase 4: Testing & Optimization (Weeks 7-8)**
   - Run test scenarios to ensure memory is being correctly stored and retrieved.
   - Optimize retrieval speed and accuracy.
   - Refine agent behavior based on real-world usage.

### Potential Failure Points

- **Data Silos:** If agents don't share information properly, the system will be less effective. Mitigation: Strict protocols for inter-agent communication.
- **Memory Bloat:** Too much irrelevant information in the context window will degrade performance. Mitigation: Aggressive memory consolidation and relevance filtering.
- **Obsidian Sync Issues:** If Obsidian is not properly synced, the knowledge base will be stale. Mitigation: Robust sync checks on startup.
- **Vector DB Performance:** As the vault grows, indexing and search may slow down. Mitigation: Regular index optimization, consider sharding for very large datasets.

### Maintenance Procedures

- **Daily:** Review the executive briefing, check for any sync errors.
- **Weekly:** Run memory consolidation on Mem0, review and archive any stale memories.
- **Monthly:** Audit agent performance, review and update SOPs in Obsidian, optimize vector database indexes.
- **Quarterly:** Full system review, assess if the architecture is still meeting needs, plan for upgrades.

---

**The key principles here are:**

1. **Separation of Concerns:** Each layer has a specific job. Native memory is for fast, ephemeral context. Mem0 is for deep, long-term understanding. Obsidian is for structured, human-readable knowledge.
2. **Redundancy with Purpose:** Some information exists in multiple layers (e.g., a project goal might be in MEMORY.md, Mem0, and Obsidian), but each layer stores it in a way that's optimal for its purpose.
3. **Retrieval is King:** The most important layer is the retrieval layer. If the system can't find the right information when it needs it, the memory is useless. The hybrid search approach maximizes the chances of finding the right thing.
4. **Agents are Specialization:** By giving different agents different memory access and tools, you create a system where the whole is greater than the sum of its parts.

---

*This document is a living architecture and will be updated as the system evolves.*
