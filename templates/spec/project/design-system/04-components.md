# Component Patterns

<!-- AI Agent Quick Reference -->
## TL;DR
- **Header**: Sticky, translucent, aqua border
- **Footer**: Gold accent top border, gradient background
- **Hero**: Gradient surface, vertical gold line, micro-labels
- **Cards**: Ocean-800/60 background, soft borders, gold icon accents
- **Rule**: Each component has its own CSS file

---

## Header

File: `Header.css`

* Dark translucent background
* Bottom border using `var(--surface-border-soft)`
* Sticky positioning

```css
.header-root {
  position: sticky;
  top: 0;
  z-index: 40;
  backdrop-filter: blur(16px);
  background: color-mix(in srgb, var(--ocean-900) 80%, transparent);
  border-bottom: 1px solid var(--surface-border-soft);
}
```

## Footer

File: `Footer.css`

* Top divider uses gold accent at low opacity
* Version tag uses `var(--gold-300)` with reduced opacity

```css
.footer-root {
  border-top: 1px solid color-mix(in srgb, var(--gold-300) 20%, transparent);
  background: linear-gradient(to top, color-mix(in srgb, var(--ocean-900) 90%, transparent), var(--ocean-800));
}

.footer-version {
  @apply text-xs;
  color: color-mix(in srgb, var(--gold-300) 80%, transparent);
}
```

## Hero Section

File: `HeroSection.css`

Requirements:
* Background: gradient surface using palette variables
* Vertical gold accent line on desktop
* Optional micro-label in top-right using `var(--gold-300)`
* Layout: 1 column (mobile), 2 columns (desktop)

```css
.hero-root {
  background: radial-gradient(circle at top left, var(--surface-glow-1), var(--ocean-900));
  border-radius: 1.5rem;
  border: 1px solid var(--surface-border-soft);
  position: relative;
}

.hero-content {
  @apply grid gap-8;
}

@media (min-width: 768px) {
  .hero-content {
    grid-template-columns: minmax(0, 2fr) minmax(0, 3fr);
  }
}

.hero-gold-line {
  position: absolute;
  right: 0;
  top: 1.5rem;
  bottom: 1.5rem;
  width: 1px;
  background: linear-gradient(to bottom,
    color-mix(in srgb, var(--gold-300) 15%, transparent),
    color-mix(in srgb, var(--gold-500) 25%, transparent)
  );
}

.hero-micro-label {
  @apply text-xs uppercase tracking-wide;
  color: var(--gold-300);
}
```

## Vision Cards

File: `VisionSection.css`

* Cards: `bg-ocean-800/60`, soft border
* Icon geometry uses gold accent
* Bullet markers use translucent gold

```css
.vision-card {
  background: color-mix(in srgb, var(--ocean-800) 60%, transparent);
  border-radius: 1rem;
  border: 1px solid var(--surface-border-soft);
}

.vision-icon {
  color: var(--gold-400);
}

.vision-bullet-marker {
  width: 0.5rem;
  height: 0.5rem;
  border-radius: 9999px;
  background: color-mix(in srgb, var(--gold-400) 40%, transparent);
}
```

## Component CSS Rule

**Requirement:** Every component that implements styling must have its own CSS file.

Example: `PostDetailPage.tsx` must import `PostDetailPage.css`.

In each CSS file:
* Use Tailwind via `@apply` for spacing, layout, and typography
* Use palette variables via `var(--token)` for colors, borders, backgrounds, and glows
* Do **not** include any hex literals
