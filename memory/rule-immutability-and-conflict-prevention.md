---
name: rule-immutability-and-conflict-prevention
description: "Prinsip aturan pulpen vs pensil - immutable by default, conflict before execution, no silent override"
metadata:
  node_type: memory
  type: feedback
  originSessionId: 9f917f18-46d2-420a-90dd-47d02533a8f6
  modified: 2026-10-24T06:37:33.909Z
---

Aturan ditulis menggunakan pulpen, bukan pensil. Tidak boleh hilang, berubah, atau dianggap kedaluwarsa hanya karena berganti sesi, berganti tugas, atau muncul instruksi baru.

### Tiga Prinsip Inti:
1. **Immutable by default**: Aturan yang sudah ditetapkan tetap berlaku sampai ada perubahan eksplisit dari user. Riwayat perubahan dipertahankan.
2. **Conflict before execution**: AI wajib memeriksa apakah tindakan baru bertentangan dengan aturan aktif sebelum menjalankannya. Jika ada benturan, angkat konflik, jangan langsung terobos.
3. **No silent override**: Instruksi tugas baru TIDAK otomatis membatalkan aturan lama. Pencabutan aturan harus eksplisit dari user.

### Batas Pemisah:
- **Instruksi tugas**: Berlaku ad-hoc untuk pekerjaan saat itu.
- **Aturan**: Tetap mengikat lintas sesi sampai dicabut eksplisit.
- **Prinsip**: AI boleh mengganti rencana kerja, tetapi DILARANG mengganti aturan yang mengikatnya.

**Why:** Mencegah degradasi integritas AI saat perpindahan sesi (amnesia batas/invarian) dan mencegah AI mengambil tindakan ceroboh berdalih menuruti instruksi sesaat.
**How to apply:** Sebelum mengeksekusi operasi file/git/sistem, selalu validasi terhadap file aturan baku (`CLAUDE.md` & `user-preferences.md`). Jika instruksi berpotensi menabrak aturan permanen, hentikan dan konfirmasi konflik ke user.
