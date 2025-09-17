version: 0.2.0
name: Build Feature
tags: implementation, code-navigation, docs-research, testing, mcp, automation
goal: Implement a scoped feature/fix from a ticket end-to-end with tests and docs
inputs: Ticket link/details, repo access, acceptance criteria, environment setup
outputs: Code edits (PR/diff), passing tests, updated docs/notes, next-step todo status
---

# Instructions

## Stage 1: Read & Understand
- Read and clarify the ticket. Extract acceptance criteria, scope, constraints, and success metrics.
- Questions to ask yourself:
  - What problem is this solving for the user?
  - What are the explicit and implicit requirements?
  - What's out of scope for this ticket?
  - What are the risks if this goes wrong?

## Stage 2: File Explorer & Understander
- Locate the relevant code: search by feature/domain, identify owners/modules, and confirm boundaries.
- Questions to ask yourself:
  - What are the entry points? (routes, handlers, components, CLI commands)
  - Which modules/packages own this functionality?
  - What are the dependencies between these files?
  - Are there any generated files or build artifacts?
  - What design patterns are used here? (MVC, Factory, Observer, etc.)

## Stage 3: Experience Finder
- Analyze the change: decide data flow, APIs, and edge cases; plan PR-sized steps.
- Questions to ask yourself:
  - Have I worked on similar features before? What worked/didn't work?
  - Are there existing implementations in the codebase I can reference?
  - What conventions does this codebase follow for similar changes?
  - What testing patterns are already established here?
  - What does the git history tell me about why things are this way?

## Stage 4: Researcher
- Research with Context7 MCP: resolve library IDs and fetch up-to-date docs for any libraries or patterns you will use.
- Web Search Questions:
  - What are the current best practices for [specific pattern/library]?
  - Are there known issues with [library version] we're using?
  - What security considerations exist for this type of feature?
- Context7 Questions:
  - What's the exact library ID and version we're using?
  - Are there code examples for this specific use case?
  - What are the migration guides if we're on an older version?
- Research Notes Questions:
  - Do we have internal documentation on this pattern?
  - Are there architectural decision records (ADRs) relevant here?
  - What did previous post-mortems teach us about similar features?

## Stage 5: Solution Drafter
- Plan the implementation approach based on research and analysis.
- Questions to ask yourself:
  - How can I adapt the research findings to our specific codebase?
  - What's the minimal change that satisfies the requirements?
  - Where should new code live to maintain separation of concerns?
  - How will this integrate with existing error handling and logging?
  - What edge cases need to be handled based on the research?

## Stage 6: Implementation
- Implement incrementally with small commits; keep the change focused and reversible.
- Questions while coding:
  - Is this commit atomic and reversible?
  - Am I solving only the problem at hand?
  - Have I added appropriate error handling?
  - Is the code self-documenting or does it need comments?

## Stage 7: Testing
- Test locally and via MCP tools; ensure acceptance criteria are satisfied.
- Questions before testing:
  - What's the baseline behavior before my change?
  - What are the critical user journeys affected?
  - Are there performance implications to measure?
  - What error states need to be tested?

## Stage 8: PR Preparation
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
  - Ask: Am I solving the right problem?
- Hard-to-find code paths
  - Use semantic search and ownership docs; trace from entrypoints (routes, handlers, components)
  - Ask: What calls this code? What does this code call?
- Outdated documentation
  - With Context7, resolve to versioned IDs and check for the latest stable version/current year
  - Ask: Is this doc for the version we're actually using?
- Flaky or missing tests
  - Stabilize with deterministic inputs/mocks; add regression tests as part of the PR
  - Ask: Why might this test fail intermittently?
- Environment/config drift
  - Document required env vars and run setup scripts before testing
  - Ask: What assumptions am I making about the environment?

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
- Questions for improvement:
  - What took longer than expected? Why?
  - What assumptions were wrong?
  - What patterns can be reused next time?
  - What documentation needs updating?

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

