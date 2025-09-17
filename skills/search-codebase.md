---
version: 0.1.0
name: Search Codebase
tags: code-navigation, ownership, dependency-mapping, architecture
goal: Rapidly locate relevant code, entrypoints, owners, and dependencies for a change
inputs: Ticket details, repo access
outputs: File list, owners/modules, entrypoints, dependency map, notes
---

# Instructions
- Start at entrypoints (routes, handlers, components, CLI). Trace call chains up and down.
- Use semantic search to find features by intent; fall back to exact search for symbols.
- Identify code owners and boundaries; note generated files and build artifacts.
- Sketch a quick dependency map (modules/packages, inbound/outbound calls/events).
- Capture assumptions and unknowns to resolve during implementation.

# Tips
## Best Practices
- Prefer meaning-based search first; narrow with filename/symbol filters.
- Read tests to learn intended behavior and usage patterns.
- Check commit history and PRs for rationale and context.

## Known Pitfalls & Workarounds
- Chasing dead code paths — verify reachability from entrypoints.
- Confusing generated code — locate source templates or generators.
- Hidden side effects — search for global state, singletons, event emitters.

# Testing
## How to Test
- Validate that identified files contain the logic touched by the ticket.
- Run impacted tests or add a failing test before changes to confirm scope.

## Success Criteria
- Entry points and owners identified; dependencies and risks documented.
- No major surprises during implementation due to missed code paths.

# Self Improve
## How to research for updates
- Compare search strategies/tools; record shortcuts and effective queries.
- Note repeated patterns in this repo for faster future navigation.

## Benchmarks
- Time to first accurate file hit for the feature.

# Resources
## Tools
- Context7 MCP (code search extensions, docs)

## Relevant Links
- See also: [Build Feature](./build-feature.md)


