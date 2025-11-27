# Animations & Interactions

<!-- AI Agent Quick Reference -->
## TL;DR
- **Hover**: Aqua glow on interactive elements
- **Entrance**: `fade-in-up` for sections
- **Gradient motion**: `fluid-gradient` for hero/panel surfaces only
- **Focus**: Aqua outline (`:focus-visible`)
- **Gold rule**: Gold accents NEVER animate (static anchors)

---

## Animation Principles

* Hover glow uses aqua tones
* Entrance animations: `fade-in-up` for sections
* Gradient motion: `fluid-gradient` only on large hero/panel surfaces
* **Gold accents must never animate** – they stay still, serving as anchors for meaning

## Keyframes

In `globals.css` or `Animations.css`:

```css
@keyframes fade-in-up {
  from {
    opacity: 0;
    transform: translateY(12px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.fade-in-up {
  animation: fade-in-up 0.6s ease-out both;
}

@keyframes fluid-gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.fluid-gradient-bg {
  background: linear-gradient(120deg,
    color-mix(in srgb, var(--ocean-800) 70%, var(--surface-glow-1)),
    color-mix(in srgb, var(--ocean-900) 80%, var(--surface-glow-2))
  );
  background-size: 200% 200%;
  animation: fluid-gradient 18s ease-in-out infinite;
}
```

## Interaction States

### Hover Glow (Aqua)

```css
.hover-glow-aqua:hover {
  box-shadow: 0 0 0 1px color-mix(in srgb, var(--aqua-300) 60%, transparent),
              0 18px 45px color-mix(in srgb, var(--aqua-400) 35%, transparent);
}
```

### Focus Indicator

```css
:focus-visible {
  outline: 2px solid var(--aqua-300);
  outline-offset: 3px;
}
```

### Button States

```css
.button-primary {
  background: var(--aqua-400);
  color: var(--ocean-900);
  transition: all 0.2s ease;
}

.button-primary:hover {
  background: var(--aqua-300);
  box-shadow: 0 0 20px color-mix(in srgb, var(--aqua-400) 40%, transparent);
}

.button-primary:active {
  background: var(--aqua-200);
}
```

## Accessibility

* Maintain high contrast: light neutrals on ocean backgrounds
* Gold accents are for headings, labels, and micro-elements – **not** for long body text
* Focus indicators must stay in the aqua family for clarity
* Respect `prefers-reduced-motion` for all animations

```css
@media (prefers-reduced-motion: reduce) {
  *,
  *::before,
  *::after {
    animation-duration: 0.01ms !important;
    animation-iteration-count: 1 !important;
    transition-duration: 0.01ms !important;
  }
}
```
