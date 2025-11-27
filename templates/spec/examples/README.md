---
title: "FluidSpec Task Examples"
domain: "examples"
audience: "all-developers, ai-agents"
type: "examples"
estimated_tokens: 300
last_updated: "2025-01-27"
version: "1.0.0"
---

# FluidSpec Task Examples

This directory contains example FluidSpec task files demonstrating various task types and completeness levels.

## Available Examples

### Complete Examples

**[task-feature-complete.yaml](task-feature-complete.yaml)**
- **Type:** feature
- **Completeness:** 100% (all fields populated)
- **Use case:** Reference for creating comprehensive feature tasks
- **Demonstrates:** Full YAML schema with all optional fields, multiple constraints, detailed acceptance criteria

### Minimal Examples

**[task-bugfix-minimal.yaml](task-bugfix-minimal.yaml)**
- **Type:** bugfix
- **Completeness:** Minimal (only required fields)
- **Use case:** Quick bugfix tasks
- **Demonstrates:** Absolute minimum valid FluidSpec task

### Moderate Examples

**[task-refactor.yaml](task-refactor.yaml)**
- **Type:** refactor
- **Completeness:** Moderate (common optional fields)
- **Use case:** Code restructuring without behavior changes
- **Demonstrates:** Refactor-specific constraints, architecture considerations

## Using These Examples

**For developers:**
1. Copy the example that matches your task type
2. Replace placeholder values with your specific requirements
3. Adjust completeness level based on task complexity
4. Save to `.fluidspec/tasks/<type>/<NNN-YYYYMMDD>/<slug>.yaml`

**For AI agents:**
- Reference these examples when creating new tasks
- Use complete example as template for complex tasks
- Use minimal example for simple, straightforward tasks
- Match task type to appropriate example

## Schema Reference

For complete YAML schema documentation, see:
- [_shared-concepts.md#yaml-task-schema](../base/_shared-concepts.md#yaml-task-schema-quick-reference)
- [quick-reference.md#yaml](../base/quick-reference.md#yaml-task-schema-minimal)

## Task Types

| Example | Type | When to Use |
|---------|------|-------------|
| task-feature-complete.yaml | feature | New capability or user-facing functionality |
| task-bugfix-minimal.yaml | bugfix | Fix broken or incorrect behavior |
| task-refactor.yaml | refactor | Improve code structure without changing behavior |

For infra and spec examples, use task-refactor.yaml as template and adjust the type and constraints accordingly.

## Validation

All examples in this directory are valid FluidSpec tasks that:
- ✅ Include all required fields
- ✅ Reference the three core aios_specs
- ✅ Follow file naming conventions
- ✅ Include testable acceptance criteria
- ✅ Specify clear goals

## Contributing Examples

When adding new examples:
1. Ensure they represent common real-world scenarios
2. Include inline comments explaining key fields
3. Update this README with new example descriptions
4. Test that the YAML is valid and well-formed
