# Design System Overview – Minimal Digital-Fluid Interface v2

<!-- AI Agent Quick Reference -->
## TL;DR
- **Purpose**: Dark ocean-based UI with gold accents for Next.js + Payload CMS
- **Key principles**: Deep atmosphere, minimal motion, high contrast, geometric structure
- **Color roles**: Aqua/violet for interaction, Gold for meaning-based accents
- **Tech**: TailwindCSS + CSS variables, TypeScript, component-scoped CSS

---

## Role

You are a senior frontend engineer working in a **Next.js + Payload CMS** monorepo, using **TypeScript** and **TailwindCSS**. Your task is to implement and wire the **"Minimal Digital-Fluid Interface v2" design system with gold accents** across the app shell and content surfaces.

The implementation must respect the constraints and palette rules defined in this design system.

## Tech Context

* Framework: Next.js (App Router)
* Styling: TailwindCSS + CSS Modules / component-level CSS files
* CMS: Payload (content delivered as JSON / rich text rendered in React)
* Design intent: **Minimal Digital-Fluid Interface** – dark, ocean-based, fluid gradients, sharp geometry, high contrast

## Visual Principles

1. **Deep, layered atmosphere** built from ocean gradients and digital-style surfaces
2. **Fluid motion cues** with restrained animations – no flashy, distracting effects
3. **High-contrast text** on dark surfaces for clarity and reading comfort
4. **Geometric, grid-based structure** with generous spacing – calm but sharp
5. **Color roles:**
   * Aqua/violet: actions, interactive states, info accents
   * Gold: meaning-based accents and fine highlights only

## Related Documents

- [01-color-palette.md](01-color-palette.md) - CSS variables and color system
- [02-typography.md](02-typography.md) - Fonts and heading rules
- [03-layout.md](03-layout.md) - Layout structure and containers
- [04-components.md](04-components.md) - Header, footer, sections
- [05-content-styling.md](05-content-styling.md) - Post content styling
- [06-animations.md](06-animations.md) - Animations and interactions
- [07-constraints.md](07-constraints.md) - Implementation constraints
