---
name: user-preferences
description: "User environment, preferred tooling, and friction-free preferences"
metadata:
  node_type: memory
  type: user
  originSessionId: d395a062-c292-4abe-8a50-1ce710e2b1f6
  modified: 2026-10-24T08:30:00.000Z
---

- Environment: Windows 11 Home, PowerShell 5.1, Windows Terminal Quake mode (`Win + ~`).
- Tooling: Does not use VS Code; operates primarily via Windows Terminal and CLI.
- UX preference: Hates confirmation popups, workspace trust prompts, and permission friction; prefers direct, automated execution.
- Language: Indonesian / English.

- Repository & Sync Role:
  - Repository Resmi: `https://github.com/yonathan-boop/claude02` (Claude 02 - Gen-4 Workstation System).
  - PC ini adalah pemilik / upstream master untuk repositori `claude02`. Seluruh push konfigurasi diarahkan ke `claude02`.
  - Repositori `claude01` (PC lama) tetap terisolasi dan tidak menerima push dari mesin ini.

- Permanent Modes: Caveman terse style, Superpowers framework, Karpathy guidelines, Anti-AI-Slop, dan Curator validation aktif permanen secara default di seluruh sesi tanpa perlu dipanggil manual.

- Workspaces:
  - C:\RaporServer (Data Rapor / Dokumen Sekolah - Protected Read-Only by default).
  - E:\Data 06\CO(PARA)DE (Project & Workspace Aktif).
- AI Evolution: User beralih penuh (all-in) ke Claude Code sebagai AI Generasi ke-4, menggantikan iterasi asisten sebelumnya.

- Reference Library (Passive Read-Only):
  - Path: C:\Users\yonat\OneDrive\Desktop\Opencode\memory
  - Kebijakan: Berstatus referensi pasif (harta karun data/arsip pengetahuan warisan). HANYA dibaca saat ada kebutuhan domain/tugas spesifik. Dilarang menyuntikkan langsung ke core instruction, dilarang mengeksekusi otomatis, dan dilarang mengubah file aslinya.


- Primary Tasks & Procedures:
  1. Absensi Murid:
     - Master: 'Absensi T.P 2026-2027/' & 'DAFTAR MURID T.P.2026-2027 lengkap.xlsx'.
     - Kode: S (Sakit), I (Izin), A (Alpa).
     - Aturan: Read-only sumber, dilarang overwrite file induk. Output dashboard print-ready 3 sheet (Ringkasan + chart anchor kolom A, Harian, Murid) via openpyxl.
  2. Editing Soal Ujian:
     - Standar: Kertas F4 (21.59 x 33.02 cm), margin (Atas 0.5, Bawah 0.6, Kiri 1.0, Kanan 1.0 cm), font body Tahoma, indent snap kelipatan 0.65 cm, jarak kolom 1.0 cm.
     - Invarian: Hanya format murni pada file salinan ('<nama> Edit.docx'). Dilarang mengubah/memotong isi kalimat guru atau menghapus w:numPr.
  3. Pengolahan Data Sekolah:
     - Data master C:\RaporServer wajib read-only.
     - Olah data via staging area (Python / openpyxl / pandas data_only=True), output selalu di berkas baru dengan validasi integritas struktur.


- Dual-Machine Architecture:
  - Claude 02 (PC Ini / Host Workstation): Fokus Kerja & Produksi Nyata (Absensi, Editing Soal, Olah Data Sekolah, Eksekusi PARA). Prioritas pada kestabilan, kecepatan, dan keamanan data fisik.
  - Claude 01 (PC Lain): Sandbox Tester & Fallback Auditor. Digunakan untuk eksperimen pengujian atau analisis alternatif jika ada alur yang membutuhkan uji coba terisolasi.


- Cross-Repo Communication Protocol (Claude 01 <-> Claude 02):
  - Model Komunikasi: Asynchronous Read-Only Bridge via GitHub.
  - Claude 02 (PC Ini):
    - Write Authority: HANYA ke repositori 'claude02'. Seluruh catatan untuk Claude 01 ditulis di 'claude02/notes/NOTES_FOR_CLAUDE01.md' lalu di-push.
    - Read Authority: Membaca repositori 'claude01' secara READ-ONLY mutlak saat butuh hasil uji coba. DILARANG KERAS mengedit atau push ke 'claude01'.
  - Claude 01 (PC Tester):
    - Menulis catatan di repositori 'claude01'.
    - Membaca 'claude02' secara read-only tanpa hak mengubah isi 'claude02'.


- Nomenklatur Singkat:
  - 02 = Mesin ini (Host Workstation / Produksi).
  - 01 = Mesin sebelah (Tester / Sandbox).


- Status Absensi Terkini:
  - Folder Aktif: 'C:\Users\yonat\OneDrive\Desktop\Absensi T.P 2026-2027'
  - Tanggal Terakhir Terisi: 24 Oktober 2026 (Sabtu).
  - File Terakhir: 'Absensi 24 Oktober 2026 Saturday 09_00_00.xlsx'
  - Catatan Terakhir (22 Okt):
    * PG: Hans Lukas (I), Nathanael Alessandro (S)
    * TKB1: Richelcia Wijaya (I), Marvino Sebastian (I)

