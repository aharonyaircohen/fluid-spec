---
title: "Testing & QA Index"
domain: "testing"
audience: "all-developers, qa-engineers, ai-agents"
type: "domain-index"
estimated_tokens: 150
last_updated: "2025-01-27"
version: "1.0.0"
---

# Testing & QA Index

Quick navigation to all testing and quality assurance documentation.

## Core Specifications

### Testing Standards
- **[Conventions §7: Testing](../base/conventions.md#7-testing)** - Test organization, quality, mocking
- **[Constraints §18: Testing & Quality Gates](../base/constraints.md)** - Required tests, coverage minimums

### Quality Requirements
- **[Constraints](../base/constraints.md)** - Search for:
  - "quality gates"
  - "test coverage"
  - "code review"
  - "merge requirements"

## Quick Links

### Test Levels

**Unit Testing:**
- Test organization → [conventions.md §7.1](../base/conventions.md#7-testing)
- Test quality → [conventions.md §7.2](../base/conventions.md#7-testing)
- Mocking patterns → [conventions.md §7.3](../base/conventions.md#7-testing)

**Integration Testing:**
- Integration test patterns → [conventions.md §7](../base/conventions.md#7-testing)
- API testing → [constraints.md](../base/constraints.md) (search "API")

**End-to-End Testing:**
- E2E requirements → [constraints.md](../base/constraints.md) (search "end-to-end")

### Quality Gates

**Pre-Merge Requirements:**
- All relevant tests must pass
- Code coverage meets minimum threshold
- No new lint or type errors
- Code review approval required
- Security scans pass

**Coverage Requirements:**
- Minimum coverage thresholds defined in constraints.md
- Critical paths require higher coverage

## Task Types

All task types should include relevant tests:
- **feature** - New tests for new functionality
- **bugfix** - Regression tests to prevent recurrence
- **refactor** - Tests must pass without modification

## Required Testing in Tasks

All tasks must specify testing in acceptance criteria:
```yaml
acceptance_criteria:
  - "All relevant tests pass"
  - "Code coverage meets minimum threshold"
  - "No new lint or type errors"
```

## Testing Conventions

**Test Organization:**
- Colocate tests with code or use dedicated test directories
- Consistent naming: `*.test.ts` or `*.spec.ts`
- Use project's established testing frameworks

**Test Quality:**
- Tests must be isolated, repeatable, meaningful
- Test edge cases, error conditions, boundary values
- Descriptive test names
- Focus on behavior, not implementation

**Mocking:**
- Mock external dependencies and API calls
- Use test fixtures and factories
- Avoid hardcoded test data
- Clean up test state between runs

## Examples

All example tasks include testing in acceptance criteria:
- [Feature Example](../examples/task-feature-complete.yaml) - Unit & integration tests
- [Bugfix Example](../examples/task-bugfix-minimal.yaml) - Regression tests
- [Refactor Example](../examples/task-refactor.yaml) - Tests pass without modification

## Related Indexes

- [Frontend Index](frontend-index.md) - For frontend testing patterns
- [Backend Index](backend-index.md) - For backend testing patterns
- [Workflow Index](workflow-index.md) - For CI/CD test execution
