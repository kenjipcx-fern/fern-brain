---
version: 0.1.0
name: Search Private Memories
tags: internal-docs, adr, knowledge-base, context7, research
goal: Discover relevant internal docs, ADRs, notes, and prior work to inform changes
inputs: Ticket details, knowledge base paths (memory/, docs/), org tools
outputs: Links/paths to internal docs, ADRs, prior PRs, distilled notes
---

# Instructions
- Search internal knowledge bases (e.g., `memory/`, Notion/confluence if available) for related topics.
- Look for ADRs, incident/post-mortems, runbooks, and prior PRs touching this area.
- Cross-check dates and versions to ensure advice is current.
- Summarize applicable guidance; flag contradictions or outdated material.

# Tips
## Best Practices
- Prefer authoritative sources (ADRs, platform guides) over chat threads.
- Capture quotes and links; attribute authors/owners for follow-ups.

## Known Pitfalls & Workarounds
- Stale docs — verify against current code and dependency versions.
- Tribal knowledge — identify owners to confirm assumptions.

# Testing
## How to Test
- Validate that at least one actionable internal reference influences the plan.

## Success Criteria
- Clear, concise notes with links; identified owners; outdated advice called out.

# Self Improve
## How to research for updates
- Maintain an index of useful internal resources per domain.

## Benchmarks
- Time to find first authoritative internal doc.

# Resources
## Tools
- Context7 MCP for internal docs linking; org search tools

## Relevant Links
- See also: [Build Feature](./build-feature.md)


