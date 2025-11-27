---
title: "Backend Development Index"
domain: "backend"
audience: "backend-developers, ai-agents"
type: "domain-index"
estimated_tokens: 200
last_updated: "2025-01-27"
version: "1.0.0"
---

# Backend Development Index

Quick navigation to all backend-related FluidSpec documentation.

## Core Specifications

### Architecture & Patterns
- **[Conventions §2: Directory Structure](../base/conventions.md#2-directory-structure)** - Feature-based architecture
- **[Conventions §4: Data Fetching & API Integration](../base/conventions.md#4-data-fetching--api-integration)** - API patterns
- **[Tech Stack](../project/tech-stack.md)** - Backend technology choices

### Constraints & Rules
- **[Constraints §13: Backend Architecture](../base/constraints.md)** - Hard rules (search "backend")
- **[Constraints §14: Security Standards](../base/constraints.md)** - Security requirements
- **[Constraints §15: API Design](../base/constraints.md)** - API standards
- **[Constraints §16: Database](../base/constraints.md)** - Database rules
- **[Conventions §13: Forbidden on Backend](../base/conventions.md#12-architectural-constraints)** - Prohibited operations

## Quick Links

### By Topic

**APIs:**
- API design patterns → [conventions.md §4](../base/conventions.md#4-data-fetching--api-integration)
- API constraints → [constraints.md](../base/constraints.md) (search "API")
- Error handling → [conventions.md §4.3](../base/conventions.md#4-data-fetching--api-integration)
- Authentication/Authorization → [constraints.md](../base/constraints.md) (search "auth")

**Database:**
- Database rules → [constraints.md](../base/constraints.md) (search "database")
- Migration requirements → [conventions.md](../base/conventions.md) (search "migration")
- Transaction boundaries → [constraints.md](../base/constraints.md) (search "transaction")

**Security:**
- Security standards → [constraints.md](../base/constraints.md) (search "security")
- Input validation → [constraints.md](../base/constraints.md) (search "validation")
- Secrets management → [constraints.md](../base/constraints.md) (search "secret")
- CORS configuration → [constraints.md](../base/constraints.md) (search "CORS")

**Error Handling:**
- Error categorization → [conventions.md §10.1](../base/conventions.md#10-ux--error-handling)
- Retry logic → [conventions.md §4.3](../base/conventions.md#4-data-fetching--api-integration)
- Logging → [constraints.md](../base/constraints.md) (search "logging")

## Task Types

Backend tasks typically use:
- **feature** - New endpoints, services, integrations
- **bugfix** - API bugs, data issues
- **refactor** - Service restructuring, optimization
- **infra** - Deployment, CI/CD, observability

## Required Specs for Backend Tasks

All backend tasks must include:
```yaml
aios_specs:
  core:
    - ".fluidspec/spec/base/constraints.md"
    - ".fluidspec/spec/base/conventions.md"
    - ".fluidspec/spec/base/README.md"
```

## Common Constraints

- No unapproved frameworks or ORMs
- All endpoints require auth/authorization checks
- No secrets in source code (use environment variables)
- Input validation at all boundaries
- Database schema changes require migrations
- No exposed internal error details to clients
- Rate limiting on public endpoints
- CORS configuration (no wildcard in production)
- Background jobs need error handling and retry logic

## Forbidden Operations (Without Approval)

- Direct SQL bypassing ORM (unless performance-critical)
- Hardcoded connection strings or API keys
- Endpoints without authentication
- Mass deletion without confirmation
- Custom cryptography implementations
- eval() or dynamic code execution with user input
- Exposing admin/debug endpoints in production
- File uploads without validation
- Returning sensitive data in responses

## Examples

- [Feature Task Example](../examples/task-feature-complete.yaml) - OAuth implementation
- [Refactor Task Example](../examples/task-refactor.yaml) - Service modularization

## Related Indexes

- [Frontend Index](frontend-index.md) - For API contract reference
- [Testing Index](testing-index.md) - For backend testing patterns
- [Security Index](security-index.md) - For security requirements
- [Workflow Index](workflow-index.md) - For deployment and CI/CD
