# Design System Constraints

<!-- AI Agent Quick Reference -->
## TL;DR
- **All colors from palette variables** in `:root` (no hex in components)
- **All headings use gold** `var(--gold-300)` (global + post content)
- **Every component has own CSS file** (e.g., `Component.tsx` → `Component.css`)
- **Gradients reference palette** variables (no standalone literals)
- **Content elements use palette** (links, tables, code, etc.)

---

## Hard Constraints (Must Follow)

You must follow these strictly:

### 1. Color Variables Only

**All colors must come from the design-system palette variables in `:root`:**

* `--ocean-*`, `--aqua-*`, `--violet-*`, `--gold-*`, `--neutral-d-*`, `--surface-glow-*`
* No hard-coded color literals (hex, rgb, hsl) in any component CSS

### 2. Gold Headings Everywhere

**All headings (global and post content `h1–h6`) use the gold accent `var(--gold-300)`, including nested elements.**

### 3. Component CSS Files

**Every component that implements styling must have its implementation in its own CSS file.**

Example: `PostDetailPage.tsx` → `PostDetailPage.css`

### 4. Palette-Based Gradients

**Custom gradients and surfaces must reference the palette variables** (and `color-mix` with them) for backgrounds, glows, and panels. No standalone literal colors.

### 5. Content Element Styling

**All links, blockquotes, tables, code blocks, images, dividers, and list text content must use palette variables for color, borders, and backgrounds, even in posts.**

### 6. Background Gradients

**App/root backgrounds and section blocks must use palette-based gradients.**

No plain hex background colors; always built from palette variables.

### 7. Single Source of Truth

**Palette variables live only in `:root` (in `globals.css`) and must be used in all component CSS via `var(--token)`.**

No redefining these variables per component.

## Implementation Checklist

- [ ] Add the full palette to `:root` in `globals.css` (including gold and surface vars)
- [ ] Set global `html, body` background and base typography using palette variables
- [ ] Implement heading rules (`h1–h6` and `.post-content h1–h6`) with `var(--gold-300)` and Tailwind size via `@apply`
- [ ] Create component CSS files (`AppShell.css`, `Header.css`, `Footer.css`, `HeroSection.css`, `VisionSection.css`, etc.) and wire them into their respective components
- [ ] Implement `.post-content` styles for links, blockquotes, tables, code, images, lists, and dividers using only palette variables
- [ ] Add animation keyframes for `fade-in-up` and `fluid-gradient` and utility classes to use them
- [ ] Enforce aqua-based focus styles (`:focus-visible`)
- [ ] Scan the codebase to remove any remaining hex literals from component CSS and migrate them to palette variables

## Deliverable

A fully wired design system where:

* The app shell, sections, and content surfaces all use the ocean/aqua/violet palette with subtle gold accents
* All colors and gradients are built from the `:root` palette variables
* Headings consistently use gold accents
* Component styling is encapsulated per file and uses Tailwind for structure + CSS variables for visual skin
* Post content (from Payload) renders with the same visual language as the core UI
