---
version: 0.1.0
name: Build Feature
tags: implementation, code-navigation, docs-research, testing, mcp, automation
goal: Implement a scoped feature/fix from a ticket end-to-end with tests and docs
inputs: Ticket link/details, repo access, acceptance criteria, environment setup
outputs: Code edits (PR/diff), passing tests, updated docs/notes, next-step todo status
---

# Instructions
- Read and clarify the ticket. Extract acceptance criteria, scope, constraints, and success metrics.
- Locate the relevant code: search by feature/domain, identify owners/modules, and confirm boundaries.
- Analyze the change: decide data flow, APIs, and edge cases; plan PR-sized steps.
- Research with Context7 MCP: resolve library IDs and fetch up-to-date docs for any libraries or patterns you will use.
- Implement incrementally with small commits; keep the change focused and reversible.
- Test locally and via MCP tools; ensure acceptance criteria are satisfied.
- Prepare PR with rationale, screenshots (if UI), and testing instructions.
- Update todos and proceed to the next item.

# Tips
## Best Practices
- Keep scope PR-sized; avoid overlapping concerns or refactors not required by the ticket
- Write small, clear commits; include rationale in messages and PR description
- Add or update tests alongside changes; test happy path and key edge cases
- Use feature flags or guarded code paths for risky changes
- Prefer explicit types, validated inputs, and defensive error handling

## Known Pitfalls & Workarounds
- Misinterpreting the ticket intent
  - Confirm acceptance criteria and edge cases early; post a brief plan for confirmation
- Hard-to-find code paths
  - Use semantic search and ownership docs; trace from entrypoints (routes, handlers, components)
- Outdated documentation
  - With Context7, resolve to versioned IDs and check for the latest stable version/current year
- Flaky or missing tests
  - Stabilize with deterministic inputs/mocks; add regression tests as part of the PR
- Environment/config drift
  - Document required env vars and run setup scripts before testing

# Testing
## How to Test
- Reproduce the current behavior (baseline). Implement the change and re-run the same steps
- Run unit/integration tests locally; add tests covering new logic and regressions
- Use VibeTest MCP for scenario/UX flows; capture results/screenshots
- Verify non-functional aspects (performance hotspots, logging, error states)
- Verify acceptance criteria of the ticket is met

## Success Criteria
- Acceptance criteria met with evidence (test results, screenshots)
- No critical regressions; CI is green
- Clear PR description with rationale and testing steps
- Todos updated; next action identified

# Self Improve
## How to research for updates
- Use [Context7](https://context7.com/) to resolve libraries and fetch latest-version docs for relevant patterns
- Compare at least two libraries when choosing a new dependency; record decision trade-offs
- Capture learnings and add links/snippets to internal docs

## Benchmarks
- Lead time for change: measured from ticket start to PR merge
- Change failure rate: post-merge bug count for this feature
- Test coverage added: lines/branches covered by new tests

# Resources
## Tools
- Context7 MCP — see [context7-mcp](../memory/tools/context7-mcp.md)
- VibeTest MCP (for scenario/UX validation)

## Relevant Links
- Context7: https://context7.com/

