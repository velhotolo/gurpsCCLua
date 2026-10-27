<p align="center">
  <img src="assets/banner.svg" alt="gurpsCC banner" width="800">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Lua-2C2D72?style=for-the-badge&logo=lua&logoColor=white" alt="Lua">
  <img src="https://img.shields.io/badge/GUI-LWTK-4b4fa8?style=for-the-badge" alt="LWTK">
  <img src="https://img.shields.io/badge/PDF-luahpdf-6a6ec7?style=for-the-badge" alt="luahpdf">
  <img src="https://img.shields.io/badge/status-work%20in%20progress-orange?style=for-the-badge" alt="Status: work in progress">
</p>

# 🎲 gurpsCC

A character sheet creator for GURPS, written in Lua.

## 📜 A tragedy in three acts

### Act I: the age of Java

Around mid-2024, a programmer of respectable age decided to teach himself JavaFX. No Maven, no Gradle, just him, the Micro editor and a pile of FXML files. The project grew, the character sheet took shape, and all seemed well.

### Act II: the fall

In October 2026, the code was lost and the FXML got corrupted. Standing among the ruins, the author did what any reasonable person would do: he deleted the whole repository and announced he was moving on to something else.

That something else didn't last long.

### Act III: reborn in Lua

gurpsCC is back, this time in Lua. The reasons:

- 🌙 Lua is small, fast, and doesn't need XML to draw a window;
- ❤️ the author loves Lua, and that alone settles the argument;
- ⏳ Kotlin is still in the study queue, and a character sheet can't wait.

> **Moral of the story:** commit often. Back up. Commit the backup.

## 🚧 Current status

Under construction. The first stage is the sheet's calculation logic (attributes, points, costs). The interface comes later.

## 🗺️ Roadmap

- [ ] Attribute and point calculation logic
- [ ] Desktop interface with LWTK
- [ ] PDF character sheet export with luahpdf

## 🧰 Stack

| Purpose | Tool |
|---|---|
| Language | Lua |
| Interface (planned) | LWTK |
| PDF export (planned) | luahpdf |

## 👴 Author

**Velho Tolo** ("Old Fool"): 40 years old, two paradigms, one deleted repository and zero regrets.

---

<sub>GURPS is a registered trademark of Steve Jackson Games. This is a personal study project with no affiliation with the publisher.</sub>
