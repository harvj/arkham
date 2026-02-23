# Arkham

A modern, mobile-friendly Rails app for generating **Arkham Horror (2nd Edition)** encounters with full support for expansions and “visiting” rules.

This is a rewrite of the original Arkham encounter randomizer (`arkham-v1`), focused on:

- Simplicity
- Correct game rules
- Mobile-first UI
- Long-term maintainability

---

## Features

- Random encounter generation by location
- Support for large, small, and other expansions
- Proper “Visiting” expansion rules
- Mobile-first responsive interface
- Hotwire + Turbo (no heavy frontend framework)
- Seeded from structured CSV data

---

## Tech Stack

- Ruby 3.4+
- Rails 8
- PostgreSQL
- Hotwire / Turbo
- Tailwind CSS

No Docker required. Designed to run directly on a standard Ruby/Rails setup.

---

## Data Model

Core concepts:

- **Expansions** — Base game + large/small/other boxes
- **Neighborhoods** — Groups of locations
- **Locations** — Where encounters happen
- **Encounters** — Individual cards

Game data lives in CSV + seed files and can be updated independently of the app logic.

---

## Visiting Rules

Some small-box expansions replace base encounters instead of supplementing them.

This app supports that rule:

- Visiting only applies to base-game locations
- Visiting is only available when the parent expansion is enabled

---

## Project History

This is the successor to:

- `arkham-v1` — original jQuery/Rails implementation

Version 2 focuses on correctness, simplicity, and modern Rails patterns.

