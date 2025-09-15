---
version: 0.1.0
name: Test App (Validate & Verify)
tags: qa, testing, validation, acceptance, e2e, vibetest, usability
goal: Validate the entire app against acceptance criteria and the contract-of-done; document findings and file issues
inputs: Deployed URL or run steps, acceptance criteria, contract-of-done.md, test accounts/data, environments
outputs: validation.md with results and evidence, bug reports/tickets, updated todos and release readiness status
---

# Instructions
- Preparation
  - Read the acceptance criteria and the `contract-of-done.md`
  - List all primary user flows and critical features to test
  - Ensure environments are available (staging/local), with seed data and test accounts
- Test systematically
  - Visual inspection first (layout, styles, loading states, console errors)
  - Execute happy-path flows end-to-end for each feature
  - Validate inputs and error states (empty, long text, invalid formats)
  - Verify state persistence (refresh, back/forward, multi-tab)
  - Exercise edge cases (first-time user, heavy data, rapid actions)
  - Cross-browser and responsive checks (desktop/mobile)
  - Accessibility quick pass (tab order, focus, labels/alt text)
  - Performance sanity (obvious jank, large payloads)
- Use tools
  - Use VibeTest MCP to script scenario flows and capture results/screenshots
  - Save evidence and notes in `validation.md`
- Report and iterate
  - Classify issues (P0–P3), file tickets with repro steps and evidence
  - Re-test fixes until acceptance criteria are met
  - Update todos and status

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Read the acceptance criteria and `contract-of-done.md`
- [ ] Prepare environment, seed data, and test accounts
- [ ] Perform visual inspection (layout, styles, loading, console)
- [ ] Execute happy-path tests for all core features
- [ ] Test input validation and error states
- [ ] Verify state persistence and navigation
- [ ] Run edge cases and stress interactions
- [ ] Cross-browser (Chrome/Firefox/Safari) and responsive checks
- [ ] Accessibility quick checks (keyboard, focus, labels)
- [ ] Performance sanity checks
- [ ] Document results in `validation.md` with screenshots
- [ ] File bugs with severity and repro steps; retest fixes
- [ ] Complete the parent todo and move to the next todo 

# Tips
## Best Practices
- Think like a user first; avoid developer confirmation bias
- Test with deliberate steps and 1–2 second gaps; avoid rage clicks
- Record screen or take screenshots for each failure and key pass
- Use realistic data; cover empty, single, and many-item states
- Classify bugs: P0 (blocks), P1 (major), P2 (functional w/ issues), P3 (cosmetic)

## Known Pitfalls & Workarounds
- Ambiguous acceptance criteria
  - Write down assumptions; confirm quickly with stakeholders
- Flaky behaviors due to async/state
  - Add waits where appropriate; check network and console
- Environment drift (staging vs local)
  - Document env vars and versions; standardize test setup steps
- Forgetting mobile and accessibility
  - Add explicit checklist items and do a quick keyboard-only run

# Testing
## How to Test
- Ensure `validation.md` documents each feature: Test, Expected, Actual, Status, Evidence
- Confirm each acceptance criterion has at least one passing test
- Verify no P0/P1 bugs remain; P2/P3 documented with planned follow-ups
- Re-run key flows 3 times without errors

## Success Criteria
- `validation.md` exists with comprehensive coverage and evidence
- All happy paths pass; no P0/P1 issues open
- Responsive layout and basic accessibility validated
- Clear next steps tracked for any remaining P2/P3 items

# Self Improve
## How to research for updates
- Review recent defects and add regression scenarios to the checklist
- Explore additional VibeTest MCP features for broader coverage and reporting
- Incorporate performance and accessibility tooling as needed (e.g., Lighthouse)

## Benchmarks
- Coverage: 100% of acceptance criteria tested and recorded
- Stability: 0 P0/P1 defects at release, < 2% flaky steps in scripts
- Repeatability: Full suite runs consistently in both local and staging

# Resources
## Tools
- VibeTest MCP (scenario and UX flow testing)
- Browser DevTools (console, network, performance)

## Relevant Links
None