---
title: "Domain Indexes Overview"
domain: "indexes"
audience: "all-developers, ai-agents"
type: "index-navigation"
estimated_tokens: 100
last_updated: "2025-01-27"
version: "1.0.0"
---

# FluidSpec Domain Indexes

Domain-specific navigation hubs for quick access to relevant documentation.

## Available Indexes

### [Frontend Index](frontend-index.md)
**For:** Frontend developers, UI/UX implementation
**Contains:** Design system, components, styling, state management, accessibility

### [Backend Index](backend-index.md)
**For:** Backend developers, API implementation
**Contains:** API design, database, security, authentication, error handling

### [Testing Index](testing-index.md)
**For:** All developers, QA engineers
**Contains:** Test organization, quality gates, coverage requirements, testing patterns

### [Workflow Index](workflow-index.md)
**For:** All developers, process adherence
**Contains:** Git workflow, task lifecycle, branch management, PR process

## Quick Domain Lookup

| Need... | See Index... |
|---------|--------------|
| Component patterns | [Frontend](frontend-index.md) |
| Design system | [Frontend](frontend-index.md) |
| API design | [Backend](backend-index.md) |
| Database rules | [Backend](backend-index.md) |
| Security standards | [Backend](backend-index.md) |
| Test requirements | [Testing](testing-index.md) |
| Git workflow | [Workflow](workflow-index.md) |
| Task creation | [Workflow](workflow-index.md) |

## How to Use These Indexes

**For AI Agents:**
1. Identify the domain of the task (frontend, backend, testing, workflow)
2. Load the corresponding index file
3. Navigate to specific sections from the index
4. Load only the relevant referenced files

**For Developers:**
1. Bookmark the index relevant to your role
2. Use as quick reference for documentation
3. Follow links to detailed specifications

## Relationship to Core Docs

Domain indexes are **navigation aids**, not replacements for:
- [constraints.md](../base/constraints.md) - Always review for hard rules
- [conventions.md](../base/conventions.md) - Always review for patterns
- [_shared-concepts.md](../base/_shared-concepts.md) - Central concept reference
- [quick-reference.md](../base/quick-reference.md) - Quick lookups

## Contributing

When adding new documentation:
1. Update relevant domain index(es)
2. Add cross-references between related indexes
3. Keep index entries concise (single line descriptions)
4. Include section markers (§) for deep links
