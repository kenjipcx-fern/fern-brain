---
version: 0.1.0
name: Reflect Experience (Postmortem)
tags: reflection, postmortem, learning, process, documentation, improvement
goal: Analyze outcomes vs. expectations, identify root causes, and capture actionable improvements and reusable knowledge
inputs: specs.md, contract-of-done.md, impl-plan.md, validation.md, PRs/commits, screenshots, Slack thread
outputs: lessons posts in ~/memories/lessons, experience entry in ~/memories/experience, improvement todos
---

# Instructions
- Gather artifacts
  - Read `specs.md`, `contract-of-done.md`, `impl-plan.md`, `validation.md`, key PRs/commits, and Slack decisions
- Compare plan vs outcome
  - Note where scope, timing, or quality diverged; mark success and failure points
- Root cause analysis
  - For each failure or friction point, run a brief 5 Whys; identify contributing factors (requirements, design, implementation, tooling, comms)
- Synthesize lessons
  - For each finding, document: scenario, initial strategy, rationale, what went well, what went wrong, and next-time changes
- Codify improvements
  - Create concrete follow-up todos (process changes, checklists, templates, tests, monitoring) and assign owners
- Publish
  - Write short blog-style notes per lesson in `~/memories/lessons`
  - Add a summary entry to `~/memories/experience` with a personalized slug, key takeaways, and links to artifacts

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Collect artifacts (specs, contract-of-done, impl-plan, validation, PRs, Slack)
- [ ] Map expectations vs outcomes and list notable deltas
- [ ] Perform root-cause analysis for each delta (brief 5 Whys)
- [ ] Draft lessons posts (scenario, strategy, rationale, good/bad, next-time)
- [ ] Create improvement todos and assign owners/due dates
- [ ] Add an `experience` summary entry with slug and links
- [ ] Delete the parent todo along with all the subtasks from todos.md and move to the next todo 

# Tips
## Best Practices
- Be specific and blame-free; focus on systems and decisions, not people
- Prefer measurable indicators (lead time, defects, rework, scope changes)
- Capture both wins and misses to avoid survivorship bias
- Convert insights into checklists/templates to make them durable

## Known Pitfalls & Workarounds
- Vague lessons without actions
  - End each lesson with a concrete change, owner, and due date
- Missing context for readers
  - Link to artifacts and include concise summaries
- Overlong essays
  - Keep posts short; one lesson per note; add links for depth

# Testing
## How to Test
- Verify each major artifact is referenced at least once in the reflection
- Confirm each lesson has an associated actionable improvement
- Ensure an experience entry exists and links to all lesson notes

## Success Criteria
- Lessons published in `~/memories/lessons` with clear actions
- Experience entry created with slug, summary, and links
- Improvement todos tracked and owned

# Self Improve
## How to research for updates
- Review prior reflections for recurring themes; address systemic issues
- Borrow postmortem templates and checklists from industry references

## Benchmarks
- Action rate: ≥ 80% of identified improvements tracked as todos
- Follow-through: ≥ 80% completion of improvement todos by next cycle
- Recurrence: downward trend of repeat issues across projects

# Resources
## Tools
- Docs, PRs, issue tracker, Slack search

## Relevant Links
None