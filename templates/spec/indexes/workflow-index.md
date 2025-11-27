---
title: "Workflow & Process Index"
domain: "workflow"
audience: "all-developers, ai-agents"
type: "domain-index"
estimated_tokens: 150
last_updated: "2025-01-27"
version: "1.0.0"
---

# Workflow & Process Index

Quick navigation to all workflow, process, and Git-related documentation.

## Core Workflows

### Git Workflow
- **[Shared Concepts: Git Workflow](_../base/shared-concepts.md#git-workflow)** - Complete Git workflow guide
- **[Quick Reference: Git Workflow](../base/quick-reference.md#git-workflow-quick-steps)** - Quick steps
- **[Constraints: Git & Code Review](../base/constraints.md)** - Search "git" or "review"

### Task Lifecycle
- **[Shared Concepts: Operator Approval Loop](../base/_shared-concepts.md#operator-approval-loop)** - Approval process
- **[Quick Reference: Approval Loop](../base/quick-reference.md#operator-approval-loop-flowchart)** - Flowchart
- **[Execute Task Agent](../../claude/fluid/execute-task.md)** - Complete task execution guide

### Branch Management
- **[Create Branch Command](../../claude/fluid/create-branch.md)** - Interactive branch creation
- **[Quick Reference: Git Format](../base/quick-reference.md#git-workflow-quick-steps)** - Branch naming conventions

## Quick Links

### Git Operations

**Creating Branches:**
- Branch naming → [_shared-concepts.md#git-workflow](../base/_shared-concepts.md#git-workflow)
- Branch types → `feat/`, `fix/`, `refactor/`, `chore/`, `docs/`
- Create branch command → [create-branch.md](../../claude/fluid/create-branch.md)

**Committing:**
- Conventional commits → [_shared-concepts.md#conventional-commit-types](../base/_shared-concepts.md#conventional-commit-types)
- Commit command → [commit.md](../../claude/fluid/commit.md)
- Message format → `<type>(<scope>): <description>`

**Pull Requests:**
- PR creation command → [create-pr.md](../../claude/fluid/create-pr.md)
- PR requirements → [constraints.md](../base/constraints.md) (search "review")
- PR workflow → [_shared-concepts.md#git-workflow](../base/_shared-concepts.md#git-workflow)

### Task Management

**Creating Tasks:**
- Task generator → [create-task.md](../../claude/fluid/create-task.md)
- YAML schema → [_shared-concepts.md#yaml-task-schema](../base/_shared-concepts.md#yaml-task-schema-quick-reference)
- Task examples → [examples/](../examples/)

**Executing Tasks:**
- Task executor → [execute-task.md](../../claude/fluid/execute-task.md)
- Approval loop → [_shared-concepts.md#operator-approval-loop](../base/_shared-concepts.md#operator-approval-loop)
- Lifecycle phases → [execute-task.md §4](../../claude/fluid/execute-task.md#4-lifecycle-phases)

## Process Flows

### Standard Development Flow

```
1. Create feature branch (feat/description)
   ↓
2. Create task YAML (optional but recommended)
   ↓
3. Implement changes
   ↓
4. Stage & commit (conventional format)
   ↓
5. Push branch
   ↓
6. Create PR to dev
   ↓
7. Code review
   ↓
8. Merge to dev
```

### Task-Driven Flow

```
1. Generate task YAML (create-task command)
   ↓
2. Execute task (execute-task command)
   ↓
3. Operator reviews (approval loop)
   ↓
4. If approved: Auto-commit & push
   ↓
5. Create PR (create-pr command)
```

## File Conventions

**Task Files:**
- Location: `.fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml`
- Naming: `<NNN>` = sequence, `<YYYYMMDD>` = date, `<slug>` = description
- Example: `.fluidspec/tasks/feature/001-20250127/add-oauth.yaml`

**Branch Names:**
- Format: `<type>/<description-slug>`
- Examples: `feat/add-user-login`, `fix/auth-bug`, `refactor/split-service`

**Commit Messages:**
- Format: `<type>(<scope>): <description>`
- Examples: `feat(auth): add OAuth login`, `fix(api): correct validation`

## Task Types & Workflows

| Type | Branch | Commit | Typical Workflow |
|------|--------|--------|------------------|
| feature | `feat/` | `feat:` | New → Review → Merge |
| bugfix | `fix/` | `fix:` | Fix → Test → Review → Merge |
| refactor | `refactor/` | `refactor:` | Refactor → Test → Review → Merge |
| infra | `chore/` | `chore:` | Config → Test → Review → Merge |
| spec | `docs/` | `docs:` | Update → Review → Merge |

## Examples

- [Complete Feature Task](../examples/task-feature-complete.yaml) - Full task lifecycle
- [Minimal Bugfix Task](../examples/task-bugfix-minimal.yaml) - Quick fix workflow

## Related Indexes

- [Testing Index](testing-index.md) - For test execution in CI/CD
- [Security Index](security-index.md) - For security scans in workflow
- [Frontend Index](frontend-index.md) - For frontend-specific workflows
- [Backend Index](backend-index.md) - For backend-specific workflows
