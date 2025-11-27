# Layout Structure

<!-- AI Agent Quick Reference -->
## TL;DR
- **Shell**: `.app-shell` with full-viewport ocean gradient background
- **Container**: `.page-container` max-width 1120px, horizontal padding
- **Sections**: `.section-block` with vertical spacing and subtle borders
- **Implementation**: Tailwind `@apply` + palette variables for colors

---

## Layout Components

Create a consistent shell and section layout using a combination of Tailwind utilities via `@apply` and palette variables. **Every component that implements styling must use its own CSS file.**

## App Shell

`.app-shell`
* Full-viewport background using palette-based gradient
* Centers main content container

## Page Container

`.page-container`
* Max width: `1120px`
* Horizontal padding (responsive)
* Vertical spacing between sections: `2.5–4rem`

## Section Blocks

`.section-block`
* Vertical padding
* Subtle bottom border using palette variables

## Implementation Example

In `AppShell.css`:

```css
.app-shell {
  min-height: 100vh;
  background-image: radial-gradient(circle at top left, var(--ocean-700), var(--ocean-900));
  color: var(--neutral-d-100);
}

.page-container {
  @apply mx-auto px-4 sm:px-6 lg:px-8;
  max-width: 1120px;
}

.section-block {
  @apply py-10 md:py-14;
  border-bottom: 1px solid color-mix(in srgb, var(--neutral-d-800) 70%, transparent);
}
```

## Grid System

Use Tailwind's responsive grid for multi-column layouts:

```css
.two-column-layout {
  @apply grid gap-8;
}

@media (min-width: 768px) {
  .two-column-layout {
    grid-template-columns: minmax(0, 2fr) minmax(0, 3fr);
  }
}
```
