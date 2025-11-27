---
title: "Shared Concepts Reference"
domain: "core-specs"
audience: "ai-agents, all-developers"
type: "reference"
estimated_tokens: 1150
last_updated: "2025-01-27"
version: "2.0.0"
---

# Shared Concepts – FluidSpec Reference

<!-- AI Agent Quick Reference -->
## TL;DR
- **Purpose**: Single source of truth for concepts referenced across multiple docs
- **Use**: Reference this file instead of duplicating content
- **Key concepts**: Task types, FluidSpec structure, YAML schema, Git workflow, file conventions
- **Reference format**: `See [shared-concepts.md#task-types](_shared-concepts.md#task-types)`

---

This document defines common concepts used across FluidSpec documentation. Other documents should reference these definitions instead of duplicating them.

---

## Task Types

Every FluidSpec task must be classified as exactly one of these types:

| Type | Purpose | Example |
|------|---------|---------|
| `feature` | Add new behavior or capability | New page, API endpoint, integration |
| `bugfix` | Correct existing incorrect behavior | Fix crash, wrong calculation, UI bug |
| `refactor` | Improve internal structure without changing external behavior | Split module, simplify logic, improve naming |
| `infra` | Changes to CI/CD, deployment, infrastructure, observability | Build pipeline, deployment config, monitoring |
| `spec` | Changes to specifications, standards, or documentation | Update guidelines, new standard, rewrite docs |

**See [task-types.md](task-types.md) for detailed descriptions and typical specs per type.**

---

## FluidSpec Structure

All FluidSpec tasks follow a standardized 5-section structure:

### 1. Context
**Purpose:** Why the task exists
**Contains:** Background, business reasons, scope definition

### 2. Requirements
**Purpose:** What needs to be built
**Contains:**
- **Functional Requirements (FR):** Specific functionality requirements
- **Non-Functional Requirements (NFR):** Performance, security, accessibility
- **Constraints:** Technical or business limitations

### 3. Implementation Steps
**Purpose:** How to approach the solution
**Contains:** Sequential, actionable steps with specific technical details

### 4. Acceptance Criteria
**Purpose:** How to verify completion
**Contains:** Testable conditions in checklist format (`Given...When...Then`)

### 5. Links and References
**Purpose:** Related work and documentation
**Contains:** Design files, API docs, related tasks, external resources

**See [task-template.md](../project/task-template.template.md) for a complete template.**

---

## FluidSpec File Structure

### Directory Layout

```
.fluidspec/
├── spec/
│   ├── base/                    # Core specs (always overwritten on sync)
│   │   ├── README.md
│   │   ├── constraints.md
│   │   ├── conventions.md
│   │   ├── task-types.md
│   │   └── _shared-concepts.md
│   └── project/                 # Project-specific specs (never overwritten)
│       ├── task-template.md
│       ├── tech-stack.md
│       ├── design-system.md
│       └── custom/
└── tasks/
    ├── feature/<NNN-YYYYMMDD>/<slug>.yaml
    ├── bugfix/<NNN-YYYYMMDD>/<slug>.yaml
    ├── refactor/<NNN-YYYYMMDD>/<slug>.yaml
    ├── infra/<NNN-YYYYMMDD>/<slug>.yaml
    └── spec/<NNN-YYYYMMDD>/<slug>.yaml
```

### File Conventions

**Task file naming:**
- Format: `.fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml`
- `<type>`: One of the 5 task types
- `<NNN>`: Zero-padded sequence number (001, 002, etc.)
- `<YYYYMMDD>`: Date (e.g., 20251127)
- `<slug>`: Descriptive kebab-case name (e.g., `add-user-login.yaml`)

**Spec file ownership:**
- `base/`: Overwritten on every sync (managed by FluidSpec package)
- `project/`: User-owned, never overwritten
- `project/custom/`: User-owned additional specifications

---

## YAML Task Schema (Quick Reference)

**Minimal required fields:**

```yaml
task_id: T-YYYY-NNN              # Unique identifier
title: "Short explicit title"
type: feature | bugfix | refactor | infra | spec
status: planned                  # → in_progress → awaiting_approval → completed
goal: "Desired outcome in terms of behavior/result, not implementation"

aios_specs:
  core:                          # Always include these three
    - ".fluidspec/spec/base/constraints.md"
    - ".fluidspec/spec/base/conventions.md"
    - ".fluidspec/spec/base/README.md"
  extra: []                      # Additional relevant specs

constraints:
  - "E.g., no breaking changes to public API"

acceptance_criteria:
  - "Functional behavior works as described in goal"
  - "All relevant tests pass"
```

**Optional but recommended:**

```yaml
requires_operator_approval: true # Require human approval before completion (default: true)
iteration: 1                     # Managed by Task Manager
operator_feedback: ""            # Latest operator input
git_integration:
  enabled: true                  # Auto-commit/push after approval
  branch: dev                    # Target branch
  commit_message_format: "<type>(task-<id>): <short description>"

owner: "human-owner-handle"
created_at: "YYYY-MM-DD"
summary: "One or two sentences describing the task"
background: "Why this task exists"
project_specs: []                # Additional project docs
expected_outputs: []             # Code changes, tests, docs
risk_level: low | medium | high
notes: "Extra hints, edge cases, warnings"
file_path: ".fluidspec/tasks/feature/001-20251127/slug.yaml"
```

**See [create-task.md](../../claude/fluid/create-task.md) for complete schema documentation.**

---

## Git Workflow

### Branch Naming Convention

**Format:** `<type>/<task-purpose-slug>`

**Types:** feat, fix, refactor, style, chore, docs

**Examples:**
- `feat/add-user-login`
- `fix/authentication-bug`
- `refactor/course-component`

### Commit Message Format

**Format:** `<type>(<scope>): <description>`

**For task-based commits:** `<type>(task-<id>): <description>`

**Examples:**
- `feat(task-42): add course list layout`
- `fix(task-51): correct user authentication flow`
- `refactor(task-33): simplify state management`

**Breaking changes:** Add `!` before colon: `feat!: redesign API`

### Standard Workflow

1. **Create branch** from `dev` with clean working directory
2. **Make changes** following specs and conventions
3. **Test locally** to verify functionality
4. **Stage changes** with `git add .`
5. **Commit** with conventional message format
6. **Push** to remote: `git push -u origin <branch-name>`
7. **Create PR** targeting `dev` branch

**See [constraints.md §22](constraints.md#22-git-workflow--code-review) for code review requirements.**

---

## Operator Approval Loop

**Purpose:** Ensure human oversight of task completion

**Runtime state fields:**
- `requires_operator_approval`: boolean (default `true`)
- `status`: `planned` → `in_progress` → `awaiting_approval` → `completed`/`rejected`
- `iteration`: integer counter (starts at 1, increments on re-runs)
- `operator_feedback`: latest operator comments

**Workflow:**
1. **Execute** task with `status = "in_progress"`
2. **Request approval** with `status = "awaiting_approval"`
   - Present summary: task ID, iteration, changes, notes
   - Ask: "approve" or "request_changes"?
3. **Handle response:**
   - `approve` → Complete (with git push if enabled)
   - `request_changes` → Increment iteration, store feedback, re-run
   - Cancel → Set `status = "rejected"`

**Never mark completed without explicit operator approval.**

**See [execute-task.md §2](../../claude/fluid/execute-task.md#2-operator-approval-loop-mandatory) for detailed implementation.**

---

## Core Specs (Always Required)

**All tasks must reference these three core specs:**

1. **[constraints.md](constraints.md)** - Non-negotiable hard rules
   - Security, quality gates, testing requirements
   - Forbidden operations
   - Always takes precedence

2. **[conventions.md](conventions.md)** - Implementation patterns and coding guidance
   - Tech stack, directory structure, component patterns
   - Subordinate to constraints.md

3. **[README.md](README.md)** - FluidSpec overview and principles
   - Core concepts, best practices
   - Getting started guide

**Rule precedence:** Constraints > Conventions > Project-specific decisions

---

## Conventional Commit Types

| Type | Purpose | Example |
|------|---------|---------|
| `feat` | New feature | `feat: add user login` |
| `fix` | Bug fix | `fix: correct auth validation` |
| `refactor` | Code restructuring | `refactor: simplify state logic` |
| `style` | Code style changes (formatting) | `style: format with prettier` |
| `chore` | Maintenance, tooling, dependencies | `chore: update dependencies` |
| `docs` | Documentation only | `docs: update API docs` |
| `test` | Adding or updating tests | `test: add auth unit tests` |
| `perf` | Performance improvements | `perf: optimize query` |
| `ci` | CI/CD changes | `ci: update build pipeline` |

**Breaking changes:** Add `!` before colon or add `BREAKING CHANGE:` in footer

---

## Reference This Document

Instead of duplicating concepts across documents, use this reference format:

**Markdown:**
```markdown
See [task types](_shared-concepts.md#task-types) for classification.
```

**In prompts/docs:**
```
For task types, see .fluidspec/spec/base/_shared-concepts.md
```

**In YAML:**
```yaml
# See _shared-concepts.md for complete schema reference
```

---

**This document is part of the FluidSpec base specs and is overwritten on every sync. Do not modify. For project-specific concepts, create files in `.fluidspec/spec/project/custom/`.**
