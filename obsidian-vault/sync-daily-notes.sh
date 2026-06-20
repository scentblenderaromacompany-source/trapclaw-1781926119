#!/bin/bash
# sync-daily-notes.sh
# Bidirectional sync between OpenClaw memory/daily/ and Obsidian Daily_Notes/
# Run via cron or manually: bash sync-daily-notes.sh

OPENCLAW_DAILY="/home/bobby/.openclaw/workspace/memory/daily"
OBSIDIAN_DAILY="/home/bobby/obsidian-vault/Daily_Notes"

mkdir -p "$OPENCLAW_DAILY" "$OBSIDIAN_DAILY"

echo "=== Daily Note Sync: $(date) ==="

# Sync OpenClaw → Obsidian (new or updated files)
for f in "$OPENCLAW_DAILY"/*.md; do
  [ -f "$f" ] || continue
  basename=$(basename "$f")
  target="$OBSIDIAN_DAILY/$basename"
  
  if [ ! -f "$target" ]; then
    cp "$f" "$target"
    echo "  ADDED to Obsidian: $basename"
  elif [ "$f" -nt "$target" ]; then
    cp "$f" "$target"
    echo "  UPDATED in Obsidian: $basename"
  fi
done

# Sync Obsidian → OpenClaw (new or updated files)
for f in "$OBSIDIAN_DAILY"/*.md; do
  [ -f "$f" ] || continue
  basename=$(basename "$f")
  target="$OPENCLAW_DAILY/$basename"
  
  if [ ! -f "$target" ]; then
    cp "$f" "$target"
    echo "  ADDED to OpenClaw: $basename"
  elif [ "$f" -nt "$target" ]; then
    cp "$f" "$target"
    echo "  UPDATED in OpenClaw: $basename"
  fi
done

echo "=== Sync complete ==="
echo "OpenClaw daily: $(ls "$OPENCLAW_DAILY"/*.md 2>/dev/null | wc -l) files"
echo "Obsidian daily: $(ls "$OBSIDIAN_DAILY"/*.md 2>/dev/null | wc -l) files"
