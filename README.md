# Claude 02 — Workstation Configuration & System Workspace

Repositori resmi untuk sistem mandiri **Claude Code (Generasi ke-4)** pada PC Kerja Host (`C:\Users\yonat`):
- `CLAUDE.md`: Global instructions (Karpathy Guidelines, Superpowers Framework, Caveman style, Curator Verification, Anti-AI-Slop, Workstation Invariants).
- `agents/`: Custom subagents (misal `curator.md`).
- `skills/`: Custom prompt skills & tools (`comment-refactor`, `handoff`, `reverse-engineer-anything`, `session-resume`, `task-observer`, `unslop-ui`).
- `hooks/`: Custom hooks (misal `caveman-statusline.ps1`).
- `memory/`: Persistent memory catatan konteks, preferensi user, dan batasan workspace (`MEMORY.md`, `user-preferences.md`).
- `plugins/`: Manifest plugin terpasang (`installed_plugins.json`, `known_marketplaces.json`).
- `settings.example.json`: Template konfigurasi Claude Code (tanpa API key).
- `sync.ps1`: Script sinkronisasi otomatis dari `~/.claude/` dan push ke GitHub `claude02`.

## Arsitektur Kerja
1. **Protected Master Data**: `C:\RaporServer` (Read-only mutlak, zero unapproved edits).
2. **Active Workspaces**: `E:\Data 06\CO(PARA)DE` (Projek & manajemen berkas PARA).
3. **Passive Reference**: `C:\Users\yonat\OneDrive\Desktop\Opencode\memory` (Arsip referensi ilmu pasif).

## Sinkronisasi ke GitHub

Jalankan script `sync.ps1` dari terminal PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File "$HOME\Desktop\Claude\sync.ps1"
```

Atau minta langsung ke Claude:
> *"Tolong simpan / update sistem ke GitHub"*
