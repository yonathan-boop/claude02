---
name: remote-ssh-pc-wilianto
description: Konfigurasi remote SSH ke PC Wilianto (192.168.136.1) dari host PC kerja
metadata:
  node_type: memory
  type: project
  originSessionId: a474736c-f8d6-4f23-a21e-cc8eca879424
  modified: 2026-10-24T05:30:41.467Z
---

# Remote SSH ke PC Wilianto

- **Target IP**: `192.168.136.1`
- **User Target**: `wilianto` (`wilianto-pc\wilianto`)
- **Host Asal**: PC Methodist-11 (`192.168.136.2`)
- **Key**: `~/.ssh/id_ed25519` (`ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPLUNHVoD1MNQzq2OMIxOLDEWGoHJxyAB8ev+eiVF4Fp admin@Methodist-11`)
- **Script Setup**: `C:\RaporServer\#YONATHAN\PASANG_SSH_SERVER.bat` (read-only reference)
- **Status Service**: `sshd` startup type `AUTO_START` (otomatis aktif saat boot tanpa perlu login pengguna).
- **Perintah Akses**: `ssh pc1` (atau `ssh node1`) — disamarkan via alias di `~/.ssh/config`

**Why:** Akses remote headless ke PC Wilianto untuk administrasi jaringan lokal sekolah tanpa password.
**How to apply:** Gunakan `ssh wilianto@192.168.136.1` langsung dari terminal kapan saja PC target menyala.
