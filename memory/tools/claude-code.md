---
version: 0.1.0
name: Claude Code (CC)
tags: coding-agent, CLI, PR-sized-epics, automation, background, parallel, QA
useful-for: Delegating coding to a CLI agent to build features, fix bugs, and create PRs
---

# Overview
- Claude Code (CC) is a CLI coding agent you direct in natural language to implement epic-level features, bug fixes, code understanding, and small iterations. You act as the product manager: define scope, constraints, and acceptance criteria; CC writes the code and creates PRs.
- Operate 1 epic per CC instance to preserve context. CC runs in the background; check progress every 2–5 minutes.
- Keep scopes PR-sized to fit CC's context and runtime limits. Use at most 2 CC instances in parallel.
- Provide complete inputs: project context, epic goal, constraints, acceptance criteria, and expected outputs (file diffs, commands, rationale).
- Use "my developer has ..." phrasing when asking for reviews to elicit candid feedback from CC.
- Maintain long-running state in `.fern/` (tasks, PR history, QA results) and CC's `.claude/` workspace.

# Quick Start
- Initialize CC
  - Run: `sudo claude --dangerously-skip-permissions`
- Delegate an epic
  - Provide: context, epic goal, constraints, acceptance criteria, expected outputs
  - Example: "Build complete user authentication with signup/login/logout/password reset, JWT, protected routes. Provide files, migrations, endpoints, and testing instructions."
- While CC works
  - Decide to wait or work elsewhere; check back every 2–5 minutes
  - Ask CC to "create a PR" when changes are ready
- Useful commands & capabilities
  - Reference files with `@path/to/file`
  - View subagents with `/agents`
  - Ask to "find files that handle [feature]"
  - Use "think harder about [complex problem]" for deeper analysis
  - Drag/drop screenshots for UI/error debugging
- Parallelize (max 2 instances)
  - Use Git worktrees per epic to isolate branches when running multiple CC instances

# Tips
## Best Practices
- 1 Epic = 1 CC instance; keep the same instance through build, QA, fixes, and iterations
- Cap scope to a single PR; split larger work into multiple epics with clear boundaries
- Define acceptance criteria up front and QA against them; document in `.fern/qa-results.md`
- Track dependencies and progress in `.fern/tasks.md`; log outcomes in `.fern/pr-history.md`
- Use `git worktree` and open another CC instance to run two epics in parallel without interference
- Report bugs back to the same CC instance with precise repro steps, expected vs actual, screenshots, and console errors
- Use "my developer has ..." to reduce agreeable bias and get critical feedback
- Poll CC every 2–5 minutes; request status summaries and next steps as needed

## Known Pitfalls & Workarounds
- Context/time limits
  - Keep requests PR-sized; if CC stalls or loses context, start a fresh terminal instance and supply updated context
- Background execution
  - CC has no live status; set regular check-ins and ask for progress updates
- Over-agreeableness
  - Preface review asks with "my developer has ..." for more honest critiques

# Configs
- CLAUDE.md system prompt
- agents/ directory
- hooks/ directory
- mcp servers

# Resources
- Commands: `sudo claude --dangerously-skip-permissions`
- Git worktrees: `git worktree add`, `git worktree list`, `git worktree remove`
- Tool Documentation: https://docs.anthropic.com/en/docs/claude-code/overview