# Color Palette & CSS Variables

<!-- AI Agent Quick Reference -->
## TL;DR
- **All colors**: Defined in `:root` in `globals.css` as CSS variables
- **No hex literals**: Components must use `var(--token-name)` only
- **Palette families**: Ocean (backgrounds), Aqua (actions), Violet (accents), Gold (meaning), Neutral-D (text/borders)
- **Usage**: Ocean for bases, Aqua for interactive, Gold for headings/labels only

---

## Color System Overview

Define all palette entries as CSS custom properties under `:root` in `globals.css`. **No component CSS may use hex literals; only these variables.**

## Variable Families

### Ocean (Dark Bases, Backgrounds, Deep Panels)

* `--ocean-900` - Deepest background
* `--ocean-800` - Card backgrounds
* `--ocean-700` - Elevated surfaces
* `--ocean-600` - Hover states
* `--ocean-500` - Active states

### Aqua (Actions, Primary Highlights, Focus States)

* `--aqua-400` - Primary actions
* `--aqua-300` - Hover states
* `--aqua-200` - Active/pressed states

### Violet (Geometric / Informational Micro-Accents)

* `--violet-400` - Secondary actions
* `--violet-300` - Subtle highlights

### Neutral-D (Dark Neutrals for Text, Borders, Subtle Surfaces)

* `--neutral-d-50` - Lightest text
* `--neutral-d-100` - Primary text
* `--neutral-d-200` - Secondary text
* `--neutral-d-400` - Tertiary text
* `--neutral-d-600` - Subtle borders
* `--neutral-d-700` - Medium borders
* `--neutral-d-800` - Strong borders
* `--neutral-d-900` - Darkest neutral

### Gold – Warm Meaning Accents (NEW)

* `--gold-500` - Base rich gold (`#E8B46A`)
* `--gold-400` - Lighter gold (`#F2C98B`)
* `--gold-300` - Soft highlight gold (`#FFDFAE`)

### Surfaces / Special

* `--surface-glow-1` - Aqua-based glow
* `--surface-glow-2` - Violet-based glow
* `--surface-border-soft` - Default border color

## :root Implementation

In `globals.css`, under `:root`, define all palette variables **once**, with hex values only there:

```css
:root {
  /* Ocean */
  --ocean-900: #020617;
  --ocean-800: #02091f;
  --ocean-700: #071427;
  --ocean-600: #0b1b33;
  --ocean-500: #102544;

  /* Aqua */
  --aqua-400: #22d3ee;
  --aqua-300: #38e8ff;
  --aqua-200: #a5f3ff;

  /* Violet */
  --violet-400: #a855f7;
  --violet-300: #c4a0ff;

  /* Neutral-D */
  --neutral-d-50: #f9fafb;
  --neutral-d-100: #e5e7eb;
  --neutral-d-200: #cbd5f5;
  --neutral-d-400: #9ca3af;
  --neutral-d-600: #4b5563;
  --neutral-d-700: #374151;
  --neutral-d-800: #1f2933;
  --neutral-d-900: #020617;

  /* Gold accents */
  --gold-500: #E8B46A;
  --gold-400: #F2C98B;
  --gold-300: #FFDFAE;

  /* Surfaces / glows */
  --surface-glow-1: color-mix(in srgb, var(--aqua-300) 12%, transparent);
  --surface-glow-2: color-mix(in srgb, var(--violet-300) 8%, transparent);
  --surface-border-soft: color-mix(in srgb, var(--neutral-d-700) 60%, transparent);
}
```

## Important Rules

* **Only `:root` is allowed to contain hex literals**
* **All other CSS files must reference these variables via `var(--token-name)`**
* **Never redefine these variables per component**
