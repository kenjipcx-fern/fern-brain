# Todos

- [ ] Read up the [Task Decomposition](./decomp-task.md) skill
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


