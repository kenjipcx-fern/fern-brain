version: 0.1.0
name: Context7 MCP
tags: mcp, docs-search, libraries, versions, recency, automation
useful-for: Resolving libraries and fetching focused, recent docs for implementation research
---

# Overview
- Context7 is an MCP server (by Upstash) that lets you look up library documentation programmatically. Typical flow:
  - Resolve a human package name to a precise library ID
  - Fetch scoped docs with topic filters and token limits, optionally for a specific version
- Use it to quickly gather authoritative, recent snippets before delegating coding tasks.

# Quick Start
- Resolve library ID (required before fetching docs)
  - Provide a package or project name. The resolver returns the most relevant match with an ID like `/org/project` or `/org/project/version`.
- Fetch docs
  - Call docs with the resolved ID. Optionally pass `topic` (e.g., "routing", "hooks") and `tokens` to control amount.
- Minimal example
  - Resolve: "react router"
  - Get docs: ID = `/remix-run/react-router`, topic = "routing"

# Workflows
- Basic lookup
  - 1) Resolve library name to ID
  - 2) Fetch docs by topic (e.g., "api", "examples", "hooks") with a reasonable token cap (e.g., 2,000–5,000)

- Latest version docs
  - 1) Determine the latest stable version on the internet (e.g., npm registry or GitHub releases)
  - 2) Resolve by name; if multiple IDs exist, choose the one with the newest version or explicitly use `/org/project/x.y.z`
  - 3) Fetch docs for that version with targeted `topic` to reduce noise

- Current-year relevance
  - 1) Get the current year via the internet
  - 2) Prefer the latest version ID; include the year or "What's new" in `topic` to bias toward recent changes
  - 3) Sanity-check examples against changelogs or release notes if available

- Multi-library comparison
  - Resolve and fetch the same topic across 2–3 competing libraries; compare API shapes and constraints before choosing

# Tips
## Best Practices
- Always resolve first; do not guess IDs. Prefer items with better documentation coverage and trust scores when available
- Use specific `topic` terms (e.g., "server actions", "middleware", "SSR") to keep results focused
- Cap `tokens` to avoid information overload; increase only when needed
- When ambiguous, proceed with the best match but acknowledge alternatives and be ready to re-resolve
- For breaking changes, fetch both latest and previous major versions for diffing

## Known Pitfalls & Workarounds
- Ambiguous names (e.g., multiple libraries called "router")
  - Include ecosystem context ("React router" vs "Go router"). Re-run resolve with clarified name
- Outdated docs
  - Prefer versioned IDs and the newest stable version; verify with release notes
- Sparse coverage
  - Narrow or change `topic`; if still sparse, supplement with vendor docs
- Too-long outputs
  - Lower `tokens` and ask for a more focused `topic`

# Configs
None

# Relevant Links
- Context7 (Upstash): [Context7](https://context7.com/)