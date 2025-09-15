---
version: 0.1.0
name: Task Decomposition
tags: [planning, tickets, decomposition, project-management, parallelization]
goal: Break down complex plans or features into individual, parallelizable tickets with clear acceptance criteria
inputs: ["Any plan document (impl-plan.md, feature-spec.md, etc.) describing work to be done"]
outputs: ["tickets/ folder with individual tickets", "updated todos.md with task references"]
---

# Instructions
- Read the input plan document to understand the scope and features
- Always start with a scaffolding step as the foundation (use `pnpx create-convex` for Convex projects)
- Identify top-level features from the plan (e.g., "User Authentication", "Payment System", "Dashboard")
- For each top-level feature, recursively break it down into smaller sub-tasks using tree decomposition
- At each level of breakdown, identify dependencies (both within features and cross-feature dependencies)
- Continue breaking down until you reach atomic tasks (1-3 days of work each)
- Build a complete dependency graph from all identified tasks, with scaffolding as the root dependency
- Run topological sort on the dependency graph to determine optimal execution order
- Create individual ticket files in tickets/ folder with dependency information
- Generate tickets in topological order for optimal parallelization
- Update todos.md with ticket references in dependency-aware sequence

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Read and analyze the input plan document
- [ ] Create scaffolding ticket as the root dependency (using `pnpx create-convex` for Convex projects)
- [ ] Identify top-level features from the plan
- [ ] For each feature, create a hierarchical tree breakdown into sub-tasks
- [ ] At each breakdown level, identify dependencies within and across features
- [ ] Continue recursive breakdown until reaching atomic tasks (1-3 days each)
- [ ] Build complete dependency graph with scaffolding as root node
- [ ] Run topological sort on dependency graph to determine execution order
- [ ] Create tickets/ folder if it doesn't exist
- [ ] Generate ticket files in topological order with dependency information, use the [issue template](../resources/issue-template.yaml) as a template, prefix them with a ticket id that can sort them by order of execution
    - [ ] Write clear descriptions, acceptance criteria, and QA steps for each ticket
    - [ ] Document dependencies and blockers for each ticket
- [ ] Create dependency-aware todos.md with optimal task sequence
- [ ] Delete the parent todo along with all the subtasks from todos.md and move to the next todo 

# Tips
## Best Practices
- Always create a scaffolding ticket first as the root dependency (e.g., "Project Setup" using `pnpx create-convex`)
- Start with clear top-level features before diving into details
- Use hierarchical tree structure for systematic breakdown (Scaffolding → Feature → Sub-feature → Task → Sub-task)
- At each level, ask "what depends on what?" to build accurate dependency graph
- Keep breaking down until tasks are atomic (1-3 days, single responsibility)
- Consider both technical dependencies (A must be built before B) and logical dependencies
- Use topological sort to find optimal execution order that maximizes parallelization
- Name tickets with hierarchy in mind (project-setup, auth-setup, auth-login-ui, auth-protected-routes)
- Include dependency information in each ticket for clarity
- Validate that topological order makes logical sense for the project

## Known Pitfalls & Workarounds
- Pitfall: Tickets too large or vague → Workaround: If a ticket feels complex, break it down further
- Pitfall: Too many dependencies → Workaround: Look for ways to make tickets more independent
- Pitfall: Unclear acceptance criteria → Workaround: Write criteria that can be objectively verified
- Pitfall: Missing QA steps → Workaround: Include both functional testing and edge cases

# Testing
## How to Test
- Review each ticket - can it be completed by one developer in 1-3 days?
- Check acceptance criteria - are they specific and verifiable?
- Verify QA steps are comprehensive and actionable
- Ensure tickets are properly named and organized
- Confirm todos.md references all tickets correctly

## Success Criteria
- All work from the input plan is covered by tickets
- Each ticket has clear description, acceptance criteria, and QA steps
- Tickets are properly scoped (1-3 days each)
- Dependencies are minimal and clearly documented
- Ticket names are descriptive and follow consistent patterns
- todos.md properly references all tickets for easy task management
- Tickets can be worked on in parallel by multiple developers

# Self Improve
## How to research for updates
- Study how experienced product managers create GitHub issues
- Research best practices for writing acceptance criteria
- Learn about story point estimation and ticket sizing
- Study dependency management in agile project management
- Look at examples of well-decomposed projects on GitHub
- Research parallel development workflows and practices

## Benchmarks
- Time from plan → complete ticket breakdown
- Average ticket completion time (should be 1-3 days)
- Percentage of tickets that can be worked on in parallel
- Quality of acceptance criteria (how often tickets need clarification)
- Dependency accuracy (how often dependencies cause blockers)

# Resources
## Tools
- File system for ticket storage
- Markdown for ticket formatting
- Git workflow concepts for dependency management

## Relevant Links
- Topological sorting algorithms and applications
- Tree decomposition techniques for project management
- Dependency graph analysis and visualization
- GitHub Issues best practices
- Agile story writing guidelines  
- Acceptance criteria templates
- Critical path method (CPM) for project scheduling
- Parallel development workflows