---
title: "Frontend Development Index"
domain: "frontend"
audience: "frontend-developers, ai-agents"
type: "domain-index"
estimated_tokens: 200
last_updated: "2025-01-27"
version: "1.0.0"
---

# Frontend Development Index

Quick navigation to all frontend-related FluidSpec documentation.

## Core Specifications

### Design System
- **[Design System Overview](../project/design-system.md)** - Main navigation hub
  - [Color Palette](../project/design-system/01-color-palette.md) - CSS variables, color families
  - [Typography](../project/design-system/02-typography.md) - Fonts, headings, text styles
  - [Layout](../project/design-system/03-layout.md) - Shell, containers, grid
  - [Components](../project/design-system/04-components.md) - Header, footer, sections
  - [Content Styling](../project/design-system/05-content-styling.md) - Post content, tables, code
  - [Animations](../project/design-system/06-animations.md) - Keyframes, transitions
  - [Design Constraints](../project/design-system/07-constraints.md) - Implementation rules

### Coding Standards
- **[Conventions §3: Component Conventions](../base/conventions.md#3-component-conventions)** - Naming, responsibilities, props
- **[Conventions §4: Data Fetching & API Integration](../base/conventions.md#4-data-fetching--api-integration)** - API client, error handling
- **[Conventions §5: State Management](../base/conventions.md#5-state-management)** - State patterns
- **[Conventions §6: Styling Conventions](../base/conventions.md#6-styling-conventions)** - CSS approach, design tokens
- **[Conventions §7: Forms](../base/conventions.md#11-forms)** - Form patterns, validation

### Constraints & Rules
- **[Constraints §12: Frontend Architecture](../base/constraints.md#12-frontend-architecture)** - Hard rules
- **[Conventions §12: Forbidden on Frontend](../base/conventions.md#12-architectural-constraints)** - Prohibited operations

## Quick Links

### By Topic

**Components:**
- Component patterns → [design-system/04-components.md](../project/design-system/04-components.md)
- Component conventions → [conventions.md §3](../base/conventions.md#3-component-conventions)
- Component naming → [conventions.md §3.1](../base/conventions.md#3-component-conventions)

**Styling:**
- Design system → [design-system/](../project/design-system/)
- CSS variables → [design-system/01-color-palette.md](../project/design-system/01-color-palette.md)
- Animation rules → [design-system/06-animations.md](../project/design-system/06-animations.md)
- Styling conventions → [conventions.md §6](../base/conventions.md#6-styling-conventions)

**Data & APIs:**
- API integration → [conventions.md §4](../base/conventions.md#4-data-fetching--api-integration)
- Error handling → [conventions.md §4.3](../base/conventions.md#4-data-fetching--api-integration)
- State management → [conventions.md §5](../base/conventions.md#5-state-management)

**UX & Accessibility:**
- Error handling UX → [conventions.md §10](../base/conventions.md#10-ux--error-handling)
- Accessibility rules → [constraints.md](../base/constraints.md) (search "accessibility")
- Loading states → [conventions.md §4.3](../base/conventions.md#4-data-fetching--api-integration)

## Task Types

Frontend tasks typically use:
- **feature** - New UI components, pages, features
- **bugfix** - UI bugs, styling issues
- **refactor** - Component restructuring

## Required Specs for Frontend Tasks

All frontend tasks must include:
```yaml
aios_specs:
  core:
    - ".fluidspec/spec/base/constraints.md"
    - ".fluidspec/spec/base/conventions.md"
    - ".fluidspec/spec/base/README.md"
  extra:
    - ".fluidspec/spec/project/design-system.md"  # For UI tasks
```

## Common Constraints

- No new UI/CSS frameworks without approval
- All colors from design-system palette variables
- Component-level CSS files required
- Accessibility compliance (WCAG 2.1 AA minimum)
- No hardcoded API endpoints
- No secrets in client code

## Examples

- [Feature Task Example](../examples/task-feature-complete.yaml) - OAuth implementation
- [Bugfix Task Example](../examples/task-bugfix-minimal.yaml) - Image upload fix

## Related Indexes

- [Backend Index](backend-index.md) - For API integration reference
- [Testing Index](testing-index.md) - For frontend testing patterns
- [Security Index](security-index.md) - For client-side security rules
