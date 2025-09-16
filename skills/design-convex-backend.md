version: 0.1.0
name: Design Convex Backend
tags: convex, backend, schema, server-functions, realtime, scheduling, auth, storage
goal: Produce a clear Convex backend design (schema, server functions, components) ready for implementation
inputs: App feature list, user stories, roles/permissions, data requirements, non-functional constraints
outputs: Schema draft, function list with signatures, selected Convex components, implementation notes and next steps
---

# Instructions
- Read the Convex tool guide to refresh capabilities and best practices: [convex](../memory/tools/convex-dev.md)
- Capture the app scope: core features, user roles, primary user flows, data shape, expected scale
- Draft the data model in terms of Convex documents
  - Identify entities, fields with validators, relationships, and access patterns
  - Specify required indexes for your most common queries/filters
- Define server functions mapped to user flows
  - Queries for reads, Mutations for writes, Actions for external calls/long jobs
  - For each function: name, inputs (validated), output shape, security constraints
- Select Convex components to meet requirements
  - Auth, File Storage, Cron/Schedules, background Actions, RAG, and any “agent memory” storage strategy
- Note cross-cutting concerns
  - Validation, authorization, optimistic updates, error handling, pagination, rate limits
- Outline an implementation plan split into PR-sized tasks and update your todos

# Tips
## Best Practices
- Model data with explicit validators in `schema.ts`; add indexes for primary read paths
- Keep queries pure/fast; move external calls and long work to actions
- Use typed IDs and validate all inputs server-side; enforce auth/role checks centrally
- Design small, focused functions with clear inputs/outputs; return only needed fields
- Plan pagination and filters early; avoid returning unbounded lists
- Prefer file storage APIs for blobs; keep documents compact
- Consider optimistic UI updates where safe; reconcile with server responses

## Known Pitfalls & Workarounds
- External HTTP calls in queries/mutations will fail
  - Use actions for network I/O or long-running tasks
- Missing indexes causing slow scans/timeouts
  - Define indexes in `schema.ts` and use `.withIndex()` for selective reads
- Overly chatty realtime updates causing re-render storms
  - Narrow returned fields, paginate, and design stable query args
- Risky schema changes breaking existing data
  - Use two-phase rollouts and backfills before cleanup
- Ambiguous auth rules leaking data
  - Document role matrix and enforce checks at function boundaries

# Testing
## How to Test
- Walk happy-path user flows and confirm each step maps to a query/mutation/action
- Validate that each read path has an index and bounded result size
- Sanity-check authorization for every function (who can call, on what)
- Dry-run example payloads through validators; ensure expected errors are handled
- Verify background needs (cron/jobs) are covered by actions or schedules

## Success Criteria
- Schema covers all entities, fields, and relations with validators and indexes
- Each core user flow maps to well-named functions with defined inputs/outputs
- Selected Convex components (auth, storage, cron, actions) align with feature needs
- Non-functional needs addressed: pagination, errors, latency, rate limits
- Implementation plan is split into PR-sized tasks and reflected in todos

# Self Improve
## How to research for updates
- Revisit [convex](../memory/tools/convex-dev.md) for new features (auth/storage/cron updates)
- Review Convex release notes and examples; search for patterns similar to your app
- Prototype a minimal path in a throwaway `convex/` folder to validate tricky parts

## Benchmarks
- Design completeness: all primary flows have corresponding functions and indexes
- Efficiency: ≤ 3 server calls for main user actions; paginated reads
- Security: explicit auth checks documented per function

# Resources
## Tools
- Convex CLI and server functions — see [convex](../memory/tools/convex-dev.md)

## Relevant Links
- Convex Docs: https://docs.convex.dev
- Functions (queries/mutations/actions): https://docs.convex.dev/functions/server
- React Client: https://docs.convex.dev/using/react
- Scheduling (cron): https://docs.convex.dev/scheduling
- Storage: https://docs.convex.dev/file-storage