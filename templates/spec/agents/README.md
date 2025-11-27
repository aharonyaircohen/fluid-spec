# FluidSpec Multi-Agent Development Pipeline

A sophisticated multi-agent system for automated software development following FluidSpec task specifications.

## Overview

This pipeline orchestrates three specialized agents to transform FluidSpec task documents into production-ready code with comprehensive test coverage:

1. **DevPlanner** - Analyzes tasks and creates detailed implementation plans
2. **DevImplementation** - Generates production-ready code following the plan
3. **TestAgent** - Creates comprehensive test coverage

The **DevOrchestrator** coordinates the entire pipeline, ensuring proper execution order and output aggregation.

## Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                      DevOrchestrator                        │
│  - Validates FluidSpec format                               │
│  - Coordinates agent execution                              │
│  - Maintains state and context                              │
│  - Aggregates outputs                                       │
└──────────────┬──────────────────────────────────────────────┘
               │
               ▼
      ┌────────────────┐
      │  FluidSpec     │
      │  Task Document │
      └────────┬───────┘
               │
               ▼
┌──────────────────────────────────────────────────────────────┐
│ Stage 1: PLANNING                                            │
│ ┌────────────────┐                                           │
│ │  DevPlanner    │                                           │
│ │  - Parses task │            Output: dev-plan.md            │
│ │  - Analyzes    │            - Files to create/modify      │
│ │  - Plans steps │            - Implementation steps        │
│ └────────────────┘            - Component hierarchy         │
└──────────────┬───────────────────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────────────────┐
│ Stage 2: IMPLEMENTATION                                      │
│ ┌────────────────┐                                           │
│ │ DevImplement   │                                           │
│ │  - Reads plan  │            Output: impl.patch            │
│ │  - Reads files │            - Unified diff patches        │
│ │  - Writes code │            - Type-safe code              │
│ └────────────────┘            - Following conventions       │
└──────────────┬───────────────────────────────────────────────┘
               │
               ▼
┌──────────────────────────────────────────────────────────────┐
│ Stage 3: TESTING                                             │
│ ┌────────────────┐                                           │
│ │  TestAgent     │                                           │
│ │  - Reads impl  │            Output: tests.patch           │
│ │  - Writes tests│            - Unit tests                  │
│ │  - Covers ACs  │            - Integration tests           │
│ └────────────────┘            - Edge cases                  │
└──────────────┬───────────────────────────────────────────────┘
               │
               ▼
      ┌────────────────┐
      │ Execution      │
      │ Report         │
      │ + All Patches  │
      └────────────────┘
```

## Pipeline Execution Flow

### 1. Initialization

The orchestrator receives a FluidSpec task document and validates it has all required sections:
- **Context** - Background and scope
- **Requirements** - Functional and non-functional requirements
- **Implementation Steps** - High-level approach
- **Acceptance Criteria** - Testable completion conditions

### 2. Planning Stage

**Agent**: DevPlanner

**Input**:
- FluidSpec task document
- Codebase context (structure, patterns, conventions)

**Process**:
1. Analyzes the Context and Requirements sections
2. Explores existing codebase structure
3. Identifies files to create or modify
4. Determines component hierarchy and data flow
5. Creates sequential implementation steps

**Output**: `dev-plan.md`
```markdown
# Dev Plan
## Task Summary
Build a courses listing page with filtering

## Files to Create
- apps/web/src/pages/CoursesPage.tsx - Main page component
- apps/web/src/components/CourseCard.tsx - Individual course display
- apps/web/src/hooks/useCoursesQuery.ts - Data fetching hook

## Files to Modify
- apps/web/src/routes.tsx - Add new route

## Implementation Steps
1. Create CourseCard component with responsive layout
2. Create useCoursesQuery hook using React Query
3. Create CoursesPage component using the hook
4. Add route configuration
5. Add navigation link to header

## Component Hierarchy
- CoursesPage
  - CourseGrid
    - CourseCard (repeated)

## Data Flow
User visits /courses → CoursesPage renders → useCoursesQuery fetches →
API returns courses → Grid renders CourseCards
```

### 3. Implementation Stage

**Agent**: DevImplementation

**Input**:
- Development plan from DevPlanner
- Contents of existing files to modify
- Project conventions (TypeScript config, linting rules, patterns)

**Process**:
1. Parses the development plan
2. Reads existing files that need modification
3. Generates new code or modifies existing code
4. Ensures type safety and proper imports
5. Follows project conventions

**Output**: `impl.patch` (unified diff format)
```diff
FILE: apps/web/src/pages/CoursesPage.tsx
ACTION: CREATE
---
+ import { useCoursesQuery } from '@/hooks/useCoursesQuery';
+ import { CourseCard } from '@/components/CourseCard';
+ import { Loader } from '@/components/ui/Loader';
+
+ export function CoursesPage() {
+   const { data, isLoading, error } = useCoursesQuery();
+
+   if (isLoading) return <Loader />;
+   if (error) return <div>Error loading courses</div>;
+
+   return (
+     <div className="container mx-auto py-8">
+       <h1 className="text-3xl font-bold mb-6">Courses</h1>
+       <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
+         {data.courses.map(course => (
+           <CourseCard key={course.id} course={course} />
+         ))}
+       </div>
+     </div>
+   );
+ }

FILE: apps/web/src/routes.tsx
ACTION: MODIFY
---
  import { HomePage } from './pages/HomePage';
+ import { CoursesPage } from './pages/CoursesPage';

  export const routes = [
    { path: '/', element: <HomePage /> },
+   { path: '/courses', element: <CoursesPage /> },
  ];
```

### 4. Testing Stage

**Agent**: TestAgent

**Input**:
- Implementation patches from DevImplementation
- Original development plan
- Acceptance criteria from FluidSpec
- Existing test structure and conventions

**Process**:
1. Analyzes all implementation patches
2. Identifies testable units
3. Writes unit tests for components/functions
4. Writes integration tests for data flow
5. Ensures coverage of all acceptance criteria

**Output**: `tests.patch`
```diff
FILE: apps/web/src/hooks/useCoursesQuery.test.ts
ACTION: CREATE
---
+ import { renderHook, waitFor } from '@testing-library/react';
+ import { useCoursesQuery } from './useCoursesQuery';
+ import { mockGraphQL } from '@/test-utils/mockGraphQL';
+
+ describe('useCoursesQuery', () => {
+   test('fetches courses successfully', async () => {
+     mockGraphQL({
+       courses: [
+         { id: 1, title: 'React Basics', duration: '4h' },
+         { id: 2, title: 'TypeScript Advanced', duration: '6h' }
+       ]
+     });
+
+     const { result } = renderHook(() => useCoursesQuery());
+
+     await waitFor(() => {
+       expect(result.current.isLoading).toBe(false);
+     });
+
+     expect(result.current.data.courses).toHaveLength(2);
+     expect(result.current.data.courses[0].title).toBe('React Basics');
+   });
+
+   test('handles error state', async () => {
+     mockGraphQL({ error: 'Network error' });
+
+     const { result } = renderHook(() => useCoursesQuery());
+
+     await waitFor(() => {
+       expect(result.current.error).toBeTruthy();
+     });
+   });
+ });

FILE: apps/web/src/pages/CoursesPage.test.tsx
ACTION: CREATE
---
+ import { render, screen } from '@testing-library/react';
+ import { CoursesPage } from './CoursesPage';
+ import { mockGraphQL } from '@/test-utils/mockGraphQL';
+
+ describe('CoursesPage', () => {
+   test('displays loading state initially', () => {
+     render(<CoursesPage />);
+     expect(screen.getByTestId('loader')).toBeInTheDocument();
+   });
+
+   test('renders courses in grid layout', async () => {
+     mockGraphQL({
+       courses: [
+         { id: 1, title: 'React Basics', duration: '4h' },
+         { id: 2, title: 'TypeScript Advanced', duration: '6h' }
+       ]
+     });
+
+     render(<CoursesPage />);
+
+     await screen.findByText('React Basics');
+     expect(screen.getByText('TypeScript Advanced')).toBeInTheDocument();
+   });
+ });
```

### 5. Output Aggregation

The orchestrator produces a final execution report:

```markdown
# Pipeline Execution Report

## Status: SUCCESS

## Agent Execution Summary
✓ DevPlanner - Completed in 45s
✓ DevImplementation - Completed in 120s
✓ TestAgent - Completed in 90s

## Development Plan
[Full dev-plan.md content]

## Implementation Patches
[Full impl.patch content]

## Test Patches
[Full tests.patch content]

## Acceptance Criteria Coverage
✓ Users can view list of courses
✓ Courses display in responsive grid
✓ Error states are handled gracefully
✓ Loading state is shown

## Next Steps
1. Review generated code
2. Apply patches: `git apply impl.patch tests.patch`
3. Run tests: `npm test`
4. Manual QA and refinement
```

## Configuration

All agent definitions are in [`agents.yaml`](agents.yaml):

- **Role definitions** - What each agent does
- **Input/output specifications** - Data flow between agents
- **Prompt templates** - Location of agent prompts
- **Constraints** - Rules each agent must follow
- **Pipeline stages** - Execution order and dependencies

## Prompt Templates

Each agent has a dedicated prompt template in [`prompts/`](prompts/):

- [`dev-orchestrator.txt`](prompts/dev-orchestrator.txt) - Orchestrator coordination logic
- [`dev-planner.txt`](prompts/dev-planner.txt) - Planning instructions and output format
- [`dev-implementation.txt`](prompts/dev-implementation.txt) - Code generation guidelines
- [`test-agent.txt`](prompts/test-agent.txt) - Testing patterns and coverage requirements

## Usage

### Running the Pipeline

```bash
# Using the orchestrator directly
fluidspec execute --task=tasks/feature-courses.md

# Or programmatically
import { executeFluidSpecPipeline } from '@digital-fluid/fluidspec';

const result = await executeFluidSpecPipeline({
  taskSpec: './tasks/feature-courses.md',
  projectRoot: './apps/web',
  codebaseContext: {
    framework: 'React',
    conventions: './conventions.yaml'
  }
});

console.log(result.status); // 'success'
console.log(result.devPlan); // Development plan
console.log(result.implementationPatch); // Code patches
console.log(result.testsPatch); // Test patches
```

### Applying Generated Patches

```bash
# Review patches first
cat .fluidspec/output/impl.patch
cat .fluidspec/output/tests.patch

# Apply implementation
git apply .fluidspec/output/impl.patch

# Apply tests
git apply .fluidspec/output/tests.patch

# Run tests
npm test

# Commit if successful
git add .
git commit -m "feat: add courses listing page"
```

## Agent Responsibilities

### DevOrchestrator
- ✓ Validates FluidSpec format
- ✓ Coordinates agent execution
- ✓ Maintains execution state
- ✓ Handles failures gracefully
- ✓ Aggregates all outputs
- ✓ Produces execution report

### DevPlanner
- ✓ Parses Context and Requirements
- ✓ Analyzes codebase structure
- ✓ Identifies affected files
- ✓ Defines component hierarchy
- ✓ Creates sequential steps
- ✗ Does NOT write implementation code

### DevImplementation
- ✓ Implements according to plan
- ✓ Follows TypeScript conventions
- ✓ Maintains type safety
- ✓ Uses proper imports
- ✓ Produces unified diff patches
- ✗ Does NOT modify plan or write tests

### TestAgent
- ✓ Tests all implemented code
- ✓ Covers acceptance criteria
- ✓ Tests happy path and edge cases
- ✓ Follows testing conventions
- ✓ Uses existing test utilities
- ✗ Does NOT modify implementation

## Output Files

All pipeline outputs are saved to `.fluidspec/output/`:

```
.fluidspec/
├── output/
│   ├── execution-report.md    # Overall pipeline results
│   ├── dev-plan.md             # From DevPlanner
│   ├── impl.patch              # From DevImplementation
│   └── tests.patch             # From TestAgent
└── logs/
    └── pipeline.log            # Execution logs
```

## Error Handling

### Agent Failures

If an agent fails:
1. Orchestrator captures the error
2. Execution report includes failure details
3. Partial outputs are preserved
4. User receives actionable error message

Example:
```markdown
## Status: PARTIAL FAILURE

## Agent Execution Summary
✓ DevPlanner - Completed
✗ DevImplementation - Failed: Type error in generated code
- TestAgent - Skipped (dependency failed)

## Error Details
Line 42: Cannot find module '@/utils/nonexistent'

## Available Outputs
- Development Plan: .fluidspec/output/dev-plan.md

## Recommended Actions
1. Review dev-plan.md for potential issues
2. Verify project structure matches expectations
3. Check import paths in conventions.yaml
4. Retry with corrections
```

### Validation Failures

If FluidSpec validation fails:
```markdown
## Status: VALIDATION FAILED

## Issues
✗ Missing required section: Acceptance Criteria
✗ Invalid format: Requirements section empty

## Recommended Actions
1. Add Acceptance Criteria section with testable conditions
2. Populate Requirements with functional and non-functional requirements
3. See: https://github.com/.../fluidspec-format.md
```

## Best Practices

### Writing FluidSpec Tasks

1. **Be specific in Context** - Provide enough background for agents to understand
2. **Make Requirements testable** - Each requirement should map to acceptance criteria
3. **Include examples** - Show expected UI/behavior when possible
4. **Reference existing patterns** - Point to similar features in the codebase

### Reviewing Generated Code

1. **Always review before applying** - Agents can make mistakes
2. **Check type safety** - Verify no 'any' types or unsafe casts
3. **Verify imports** - Ensure all imports are correct and available
4. **Run tests** - TestAgent writes tests but doesn't run them
5. **Manual QA** - Test in browser/app before committing

### Customizing Agents

1. **Edit prompt templates** - Modify [`prompts/*.txt`](prompts/) for your needs
2. **Update conventions** - Keep project conventions up to date
3. **Add validation rules** - Extend [`agents.yaml`](agents.yaml) constraints
4. **Adjust output formats** - Modify format specifications per agent

## Troubleshooting

### "Agent exceeded context limit"
- Break task into smaller FluidSpec documents
- Reduce codebase context (specify relevant directories only)

### "Generated code doesn't follow our patterns"
- Update project conventions file
- Add examples to prompt templates
- Provide reference implementations in FluidSpec Context

### "Tests are failing"
- Check if TestAgent had access to test utilities
- Verify test conventions are documented
- Review implementation for bugs

### "Patches fail to apply"
- Codebase may have changed since analysis
- Re-run pipeline with fresh codebase context
- Review conflicts and apply manually

## Contributing

To extend the pipeline:

1. **Add new agents** - Define in [`agents.yaml`](agents.yaml)
2. **Create prompt templates** - Add to [`prompts/`](prompts/)
3. **Update orchestrator** - Modify execution flow if needed
4. **Document changes** - Update this README

## License

MIT - See LICENSE file for details
