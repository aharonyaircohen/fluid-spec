---
title: "FluidSpec Quick Reference"
domain: "core-specs"
audience: "ai-agents, all-developers"
type: "cheat-sheet"
estimated_tokens: 800
last_updated: "2025-01-27"
version: "1.0.0"
---

# FluidSpec Quick Reference

<!-- AI Agent Quick Reference -->
## TL;DR
- **Purpose**: One-page cheat sheet for common FluidSpec queries
- **Contents**: Task types, YAML schema, Git workflow, file structure, approval loop
- **Use case**: Quick lookups instead of reading full documentation
- **Audience**: AI agents and developers needing instant reference

---

This document provides quick reference cards for the most commonly accessed FluidSpec concepts.

---

## Task Types at a Glance

| Type | Purpose | Example | Git Prefix |
|------|---------|---------|------------|
| **feature** | Add new capability | Add login page, new API | `feat/` |
| **bugfix** | Fix broken behavior | Fix crash, correct calculation | `fix/` |
| **refactor** | Improve structure (no behavior change) | Split module, simplify logic | `refactor/` |
| **infra** | CI/CD, deployment, infrastructure | Build pipeline, monitoring | `chore/` |
| **spec** | Documentation, standards | Update guidelines, new standard | `docs/` |

**Full details:** [task-types.md](task-types.md) | **Shared concepts:** [_shared-concepts.md#task-types](_shared-concepts.md#task-types)

---

## YAML Task Schema (Minimal)

```yaml
task_id: T-YYYY-NNN              # Unique: T-2025-001
title: "Short explicit title"
type: feature|bugfix|refactor|infra|spec
status: planned                  # → in_progress → awaiting_approval → completed
goal: "Desired outcome (behavior, not implementation)"

aios_specs:
  core:                          # ALWAYS include these three
    - ".fluidspec/spec/base/constraints.md"
    - ".fluidspec/spec/base/conventions.md"
    - ".fluidspec/spec/base/README.md"

constraints: ["No breaking API changes", "Backwards compatible"]
acceptance_criteria: ["Works as described", "Tests pass", "No lint errors"]

file_path: ".fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml"
```

**Complete schema:** [_shared-concepts.md#yaml-task-schema](_shared-concepts.md#yaml-task-schema-quick-reference)

---

## Git Workflow (Quick Steps)

```
1. Create branch from dev
   ├─ Format: <type>/<description-slug>
   ├─ Example: feat/add-user-login
   └─ Command: git checkout -b feat/add-user-login

2. Make changes
   └─ Follow constraints.md and conventions.md

3. Stage & commit
   ├─ Stage: git add .
   ├─ Commit: git commit -m "<type>(<scope>): <description>"
   └─ Example: git commit -m "feat(auth): add user login"

4. Push branch
   └─ git push -u origin feat/add-user-login

5. Create PR to dev
   └─ gh pr create --base dev --title "..." --body "..."
```

**Detailed workflow:** [_shared-concepts.md#git-workflow](_shared-concepts.md#git-workflow)

---

## Conventional Commit Format

**Format:** `<type>(<scope>): <description>`

**Types:**
| Type | Use When | Example |
|------|----------|---------|
| `feat` | New feature | `feat(auth): add login page` |
| `fix` | Bug fix | `fix(api): correct validation error` |
| `refactor` | Code restructuring | `refactor(db): optimize queries` |
| `style` | Formatting (no logic change) | `style: format with prettier` |
| `chore` | Tooling, dependencies | `chore: update dependencies` |
| `docs` | Documentation only | `docs: update API docs` |
| `test` | Add/update tests | `test: add auth unit tests` |
| `perf` | Performance improvement | `perf: optimize image loading` |

**Breaking changes:** Add `!` before colon: `feat!: redesign API`

**Full format:** [_shared-concepts.md#conventional-commit-types](_shared-concepts.md#conventional-commit-types)

---

## File Structure (ASCII Tree)

```
.fluidspec/
├── spec/
│   ├── base/                         # Core specs (overwritten on sync)
│   │   ├── README.md                 # FluidSpec overview
│   │   ├── constraints.md            # Non-negotiable rules
│   │   ├── conventions.md            # Coding patterns
│   │   ├── task-types.md             # Task type definitions
│   │   ├── _shared-concepts.md       # Common concepts reference
│   │   └── quick-reference.md        # This file
│   └── project/                      # Project-specific (never overwritten)
│       ├── task-template.md
│       ├── tech-stack.md
│       ├── design-system.md
│       └── custom/
└── tasks/
    ├── feature/<NNN-YYYYMMDD>/      # Feature tasks
    ├── bugfix/<NNN-YYYYMMDD>/       # Bug fixes
    ├── refactor/<NNN-YYYYMMDD>/     # Refactoring
    ├── infra/<NNN-YYYYMMDD>/        # Infrastructure
    └── spec/<NNN-YYYYMMDD>/         # Spec updates
```

**File naming:** `.fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml`

**Example:** `.fluidspec/tasks/feature/001-20251127/add-user-login.yaml`

---

## Operator Approval Loop (Flowchart)

```
┌─────────────────────┐
│  Task in "planned"  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Set status:         │
│ "in_progress"       │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│  Execute task       │
│  (make changes)     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Set status:         │
│ "awaiting_approval" │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Present summary to  │
│ operator            │
│ Q: approve or       │
│    request_changes? │
└──────────┬──────────┘
           │
     ┌─────┴─────┐
     │           │
     ▼           ▼
 approve    request_changes
     │           │
     │           ▼
     │      ┌─────────────────┐
     │      │ Increment       │
     │      │ iteration       │
     │      │ Store feedback  │
     │      └────────┬────────┘
     │               │
     │               ▼
     │      ┌─────────────────┐
     │      │ Re-execute with │
     │      │ feedback        │
     │      └────────┬────────┘
     │               │
     │               └───────► (back to "awaiting_approval")
     │
     ▼
┌─────────────────────┐
│ Git integration:    │
│ - git add .         │
│ - git commit        │
│ - git push          │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Set status:         │
│ "completed"         │
└─────────────────────┘
```

**Details:** [_shared-concepts.md#operator-approval-loop](_shared-concepts.md#operator-approval-loop)

---

## FluidSpec 5-Section Structure

```markdown
# Task: [Task Name]

## 1. Context
- Why this task exists
- Background information
- Scope boundaries

## 2. Requirements
### Functional Requirements (FR)
- FR1: Specific functionality
- FR2: ...

### Non-Functional Requirements (NFR)
- NFR1: Performance/security/accessibility
- NFR2: ...

### Constraints
- Technical or business limitations

## 3. Implementation Steps
1. First step (concrete, actionable)
2. Second step
3. ...

## 4. Acceptance Criteria
- [ ] AC1: Given...When...Then...
- [ ] AC2: Testable condition
- [ ] AC3: Edge case coverage

## 5. Links and References
- Related docs, designs, APIs
```

**Template:** [task-template.md](../project/task-template.template.md)

---

## Core Specs (Always Required)

**Every task must reference these three:**

1. **[constraints.md](constraints.md)** - Non-negotiable hard rules
   - Security, quality gates, testing
   - Forbidden operations
   - Takes precedence over all other docs

2. **[conventions.md](conventions.md)** - Implementation patterns
   - Tech stack, directory structure
   - Component patterns, API integration
   - Subordinate to constraints.md

3. **[README.md](README.md)** - FluidSpec overview
   - Core concepts, best practices
   - Getting started guide

**Rule precedence:** `Constraints > Conventions > Project-specific`

---

## Common Commands Reference

**Create feature branch:**
```bash
git checkout dev
git pull origin dev
git checkout -b feat/description-here
```

**Stage and commit:**
```bash
git add .
git commit -m "feat(scope): description"
```

**Push and create PR:**
```bash
git push -u origin feat/description-here
gh pr create --base dev --title "..." --body "..."
```

**Task file location:**
```bash
.fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml
```

---

## Domain Quick Lookup

**Need...** → **See...**

- Task types → [task-types.md](task-types.md)
- YAML schema → [_shared-concepts.md#yaml](_shared-concepts.md#yaml-task-schema-quick-reference)
- Git workflow → [_shared-concepts.md#git](_shared-concepts.md#git-workflow)
- Security rules → [constraints.md §14](constraints.md#14-security-standards)
- Testing requirements → [constraints.md §18](constraints.md#18-testing--quality-gates)
- API patterns → [conventions.md §4](conventions.md#4-data-fetching--api-integration)
- Component patterns → [conventions.md §3](conventions.md#3-component-conventions)
- Design system → [design-system.md](../project/design-system.md)
- Approval loop → [execute-task.md §2](../../claude/fluid/execute-task.md#2-operator-approval-loop-mandatory)

---

## Frequently Used Values

**Default values:**
- `requires_operator_approval`: `true`
- `git_integration.enabled`: `true`
- `git_integration.branch`: `dev`
- `iteration`: `1` (first run)
- `status`: `planned` (initial)

**Required aios_specs.core:**
```yaml
- ".fluidspec/spec/base/constraints.md"
- ".fluidspec/spec/base/conventions.md"
- ".fluidspec/spec/base/README.md"
```

---

**This quick reference consolidates the most commonly accessed information. For complete details, see the full documentation files linked throughout this document.**
