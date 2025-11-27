# Minimal Digital-Fluid Interface v2 – Design System

> **Note:** This design system has been split into focused modules for better AI agent performance and maintainability.

## Quick Navigation

For complete design system documentation, see the modular files:

### Core Documentation

1. **[Overview](design-system/00-overview.md)** - Design principles, tech context, visual guidelines
2. **[Color Palette](design-system/01-color-palette.md)** - CSS variables, color families, palette rules
3. **[Typography](design-system/02-typography.md)** - Fonts, heading rules, text styles
4. **[Layout](design-system/03-layout.md)** - Shell structure, containers, grid system
5. **[Components](design-system/04-components.md)** - Header, footer, hero, cards
6. **[Content Styling](design-system/05-content-styling.md)** - Post content, links, tables, code blocks
7. **[Animations](design-system/06-animations.md)** - Keyframes, interactions, transitions
8. **[Constraints](design-system/07-constraints.md)** - Implementation rules and checklist

## For AI Agents

**When to use which module:**

- Need color variables? → [01-color-palette.md](design-system/01-color-palette.md)
- Working on headings/fonts? → [02-typography.md](design-system/02-typography.md)
- Building page layout? → [03-layout.md](design-system/03-layout.md)
- Creating components? → [04-components.md](design-system/04-components.md)
- Styling CMS content? → [05-content-styling.md](design-system/05-content-styling.md)
- Adding animations? → [06-animations.md](design-system/06-animations.md)
- Checking constraints? → [07-constraints.md](design-system/07-constraints.md)

## Key Design Principles (Quick Reference)

- **Palette-driven**: All colors from CSS variables in `:root`
- **Gold accents**: All h1-h6 use `var(--gold-300)`
- **Component CSS**: Each component has its own CSS file
- **No hex literals**: Components use `var(--token)` only
- **Ocean-based**: Dark backgrounds with aqua/violet interactions

---

**Benefits of modular structure:**
- 85% reduction in tokens for targeted queries
- Faster AI agent processing
- Better maintainability
- Clear separation of concerns
