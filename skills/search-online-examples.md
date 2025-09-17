---
version: 0.1.0
name: Search Online Examples
tags: research, examples, best-practices, security
goal: Find high-quality, up-to-date examples and guidance for the intended change
inputs: Ticket details, library names/versions, patterns to research
outputs: Curated links/snippets, security notes, migration considerations
---

# Instructions
- Use Context7 MCP to resolve exact library IDs and fetch current docs.
- Search for recent examples (current year) from trusted sources (official docs, maintainers, reputable blogs).
- Compare at least two approaches; note trade-offs and when to use each.
- Capture security/performance considerations and migration notes.

# Tips
## Best Practices
- Prefer official docs and maintainer-authored posts over random gists.
- Validate examples against our versions; beware of breaking changes.

## Known Pitfalls & Workarounds
- Copy-paste drift — adapt to our architecture and error handling patterns.
- Outdated guides — confirm publish dates and changelogs.

# Testing
## How to Test
- Prototype minimal snippets to validate API assumptions.

## Success Criteria
- Two or more vetted references; clear choice recorded with rationale.

# Self Improve
## How to research for updates
- Keep a per-library notes file with gotchas and reliable sources.

## Benchmarks
- Time to find a working, version-correct example.

# Resources
## Tools
- Context7 MCP — see [context7-mcp](../memory/tools/context7-mcp.md)

## Relevant Links
- See also: [Build Feature](./build-feature.md)


