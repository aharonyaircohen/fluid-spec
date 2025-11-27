# Typography System

<!-- AI Agent Quick Reference -->
## TL;DR
- **Fonts**: Heebo (body/Hebrew), Space Grotesk (headings/English)
- **Headings**: ALL h1-h6 use `var(--gold-300)` including post content
- **Body text**: `var(--neutral-d-200)`
- **Implementation**: Font variables in `:root`, global heading rules, Tailwind for sizing

---

## Fonts

* **Hebrew + body**: `Heebo`, fallback `system-ui`, `-apple-system`, `sans-serif`
* **Digital / English headings**: `Space Grotesk`, fallback `system-ui`, `sans-serif`

## Font Variables

Define font variables in `:root` and apply them globally:

```css
:root {
  --font-body: "Heebo", system-ui, -apple-system, sans-serif;
  --font-heading: "Space Grotesk", system-ui, -apple-system, sans-serif;
}

html,
body {
  font-family: var(--font-body);
  color: var(--neutral-d-100);
  background: radial-gradient(circle at top left, var(--ocean-700), var(--ocean-900));
}
```

## Heading Rules (Global and Post Content)

**Hard requirement:** All headings (global and inside post content, `h1–h6`) must use the gold accent color `var(--gold-300)`.

Implement this in `globals.css` using element selectors and a `.post-content` scope:

```css
h1,
h2,
h3,
h4,
h5,
h6,
.post-content h1,
.post-content h2,
.post-content h3,
.post-content h4,
.post-content h5,
.post-content h6 {
  font-family: var(--font-heading);
  color: var(--gold-300);
}
```

## Typography Scales

For sizes and weights, use Tailwind via `@apply` inside a `@layer base` block:

```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  h1 { @apply text-4xl md:text-5xl font-semibold tracking-tight; }
  h2 { @apply text-3xl md:text-4xl font-semibold; }
  h3 { @apply text-2xl font-semibold; }
}

.body-text {
  @apply text-base leading-relaxed;
  color: var(--neutral-d-200);
}

.micro-label {
  @apply text-xs uppercase tracking-wide;
  color: var(--gold-300);
}
```

## Component-Level Usage

Component-level CSS files must use these font and color rules without redefining them.
