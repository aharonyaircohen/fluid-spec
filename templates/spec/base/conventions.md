# FluidSpec Coding Conventions

<!-- AI Agent Quick Reference -->
## TL;DR
- **Purpose**: Implementation patterns and coding guidance (constraints.md takes precedence)
- **Define in your project**: Tech stack, directory structure, styling approach, state management
- **Key patterns**: Feature-based architecture, component separation, typed APIs, error boundaries
- **See constraints.md for**: Security rules, quality gates, forbidden operations
- **Quick sections**: Stack (§1), Structure (§2), Components (§3), API Integration (§4), Testing (§7)

---

Practical coding patterns and implementation guidance for software development projects.

**Related Documents:**
- **[constraints.md](constraints.md)** - Non-negotiable rules (security, testing, quality gates)
- Rule precedence: Constraints > Conventions (this document) > Project-specific decisions

## 0. About This Document

This document provides implementation patterns, coding conventions, and practical guidance for day-to-day development work. All rules in [constraints.md](constraints.md) take precedence over conventions listed here.

**When to use this document:**
- Setting up project structure and conventions
- Making implementation decisions within established constraints
- Defining project-specific patterns and standards

**Document updates:**
- Conventions are living documents: record substantive changes with version/date
- PRs/tasks should cite the specs and conventions used for traceability

---

## 1. Technology Stack

Define your project's technology baseline in your project-specific conventions document:

**Core decisions:**
- **Framework**: Frontend/backend frameworks
- **Language**: Primary programming language(s)
- **Styling**: UI framework and styling approach
- **Data layer**: API protocols and data fetching libraries
- **State management**: State management approach

**Stack guardrails:**
- Document project structure (monorepo, module layout, etc.)
- Establish runtime requirements and version constraints
- Document approved alternatives and migration paths
- Keep stack decisions version-controlled

---

## 2. Directory Structure

**Feature-based architecture pattern:**

```
src/
  features/<domain>/
    api.ts           # API/data-fetching
    services.ts      # Business logic
    types.ts         # Domain types
    index.ts         # Public interface
  lib/               # Shared utilities
  types/             # Shared types
```

**Organization rules:**
- Group related functionality by domain/feature
- Each feature contains its own data layer, business logic, types
- Keep cross-cutting concerns (auth, logging) separate
- Expose clear public interfaces per feature

---

## 3. Component Conventions

**Naming:**
- Components: `PascalCase`, files match component name
- Functions/variables: `camelCase`
- Constants: `UPPER_SNAKE_CASE`
- Hooks: `useSomething`

**Responsibilities:**
- UI components: presentational only, no business logic
- Container components: handle data fetching and state
- Single responsibility per component
- Separate presentation from business logic

**Props & Interfaces:**
- Strongly typed interfaces for all props
- Avoid passing large raw objects deep into trees
- Map data to view models at boundaries

---

## 4. Data Fetching & API Integration

**API client architecture:**
- Centralize API client configuration
- Read configuration from environment variables (see [constraints.md §26](constraints.md))
- Normalize errors at the API client boundary
- Type all API responses

**Data layer organization:**
- API calls in `features/<domain>/api.ts`
- Service functions expose typed interfaces
- Type responses at boundary, map to domain models

**Error & loading states:**
- Use explicit `isLoading`, `isError`, `isSuccess` flags
- Implement bounded retries with exponential backoff (see [constraints.md §20](constraints.md))
- Never surface raw errors to users; map to user-friendly messages
- Log technical details to console/monitoring only

**Data transformation:**
- Keep parsing/transformation logic in reusable helpers
- Map API responses to lean view models before passing to UI
- Test transformation logic independently

---

## 5. State Management

- Prefer local state closest to where it's used
- Avoid global state unless there's clear need for sharing
- Document state ownership and lifecycle
- Never introduce new state management libraries without architecture approval

---

## 6. Styling Conventions

**Approach:**
- Follow the project's established styling methodology
- Prefer utility classes or design tokens over ad-hoc inline styles
- Minimize custom CSS when design system utilities exist

**Design tokens:**
- Use semantic tokens when available (`surface`, `primary`, `accent`)
- Avoid hard-coded color/spacing values when tokens exist
- Document custom tokens with clear naming

**Responsiveness:**
- Use consistent spacing scales defined by the design system
- Design mobile-first, enhance for larger screens
- Test across target breakpoints

---

## 7. Testing

**Organization:**
- Write tests at appropriate levels: unit, integration, end-to-end
- Use project's established testing frameworks
- Colocate tests with code or in dedicated test directories
- Consistent naming: `*.test.ts` or `*.spec.ts`

**Quality:**
- Ensure tests are isolated, repeatable, and meaningful
- Test edge cases, error conditions, and boundary values
- Use descriptive test names
- Focus on behavior, not implementation details

**Mocking & test data:**
- Mock external dependencies and API calls
- Use test fixtures and factories
- Avoid hardcoding test data
- Clean up test state between runs

**See [constraints.md §18](constraints.md) for quality gates and merge requirements.**

---

## 8. Performance

- Use optimized image loading techniques
- Avoid unnecessary network requests
- Keep components/modules focused and small
- Memoize expensive computations
- Lazy load non-critical resources
- Monitor bundle size and runtime performance

---

## 9. Imports & Code Style

**Import ordering:**
1. External dependencies (npm packages)
2. Internal/project modules
3. Relative imports (components, utilities)
4. Type imports
5. Styles/assets

**Formatting:**
- Follow project's linting and formatting rules (ESLint, Prettier)
- Use absolute imports where configured

---

## 10. UX & Error Handling

**Error categorization:**
- **Transient**: Network issues (show retry option)
- **User errors**: Validation failures (provide clear guidance)
- **System errors**: Unexpected failures (show generic message, log details)

**User-facing messages:**
- Never show raw error objects, stack traces, or technical details
- Provide clear, actionable messages
- Include correlation IDs for debugging (see [constraints.md §19](constraints.md))

**User feedback:**
- Show immediate feedback for user actions (button states, spinners)
- Use toast/notification systems for non-blocking feedback
- Provide progress indicators for long-running operations
- Confirm destructive actions before execution

---

## 11. Forms

- Use controlled form components with explicit state management
- Implement validation logic at appropriate boundaries
- Provide clear, field-level error messages
- Consider form libraries for complex validation (validate before adding dependencies)
- Validate on both client and server side

---

## 12. Architectural Constraints

**The following require explicit architectural approval:**

**Frontend:**
- New UI/CSS frameworks or competing libraries
- New global state managers
- Unapproved architectural changes

**Backend:**
- New frameworks or ORMs that conflict with stack
- Direct SQL queries bypassing ORM (unless performance-critical + approved)
- Database schema changes without migrations
- Unapproved architectural changes

**See [constraints.md](constraints.md) for complete security, quality, and forbidden operations lists.**

---

**For non-negotiable rules, security standards, quality gates, and release requirements, always reference [constraints.md](constraints.md).**
