---
version: 0.1.0
name: Execute Plan
tags: [execution, orchestration, tickets, workflow, automation]
goal: Add build-feature and test-feature todos for each ticket to orchestrate plan execution
inputs: todos.md with ticket references, tickets/ folder in active-tasks/task-[id]/tickets
outputs: Updated todos.md with build-feature and test-feature tasks for each ticket
---

# Instructions
- Read through your todos.md to identify ticket references
- For each ticket found, add one todo to the list:
  1. "Build ticket using [build-feature](../skills/build-feature) for ticket [ticket-id]"
- Process tickets in order (e.g., if tickets 001, 002, 003 exist, add build+test pairs for each)
- This skill only adds the todos - the actual building and testing is handled by the respective skills

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Read current todos.md to identify all ticket references
- [ ] For each ticket reference, locate the ticket file in active-tasks/task-[id]/tickets
- [ ] Add build-feature todo for each ticket: "Build ticket using [build-feature](../skills/build-feature.md) for ticket [ticket-id]"
- [ ] Ensure todos are added in logical order (build before test for each ticket)
- [ ] Delete the parent todo along with all the subtasks from todos.md and move to the next todo 

# Tips
## Best Practices
- Add build+test pairs for each ticket in sequence
- Use consistent naming pattern for todos
- Ensure build-feature todo comes before test-feature todo for each ticket
- Keep the skill simple - it only adds todos, doesn't execute them
- Reference tickets by their ID consistently

## Known Pitfalls & Workarounds
- Pitfall: Missing ticket IDs → Workaround: Ensure ticket references in todos.md are clear and complete
- Pitfall: Wrong todo order → Workaround: Always add build-feature before test-feature for each ticket
- Pitfall: Inconsistent naming → Workaround: Use exact format "Build ticket using [build-feature](../skills/build-feature.md) for ticket [ticket-id]"

# Testing
## How to Test
- Check that todos.md contains build-feature todos for all identified tickets
- Verify todos.md contains test-feature todos for all identified tickets
- Confirm build-feature todos come before test-feature todos for each ticket
- Ensure todo formatting matches expected pattern exactly
- Verify all ticket IDs are correctly referenced

## Success Criteria
- All ticket references from original todos.md are processed
- Each ticket has exactly one build-feature todo and one test-feature todo added
- Todos are in correct order (build before test for each ticket)
- Todo formatting is consistent and correct
- No duplicate todos are created

# Self Improve
## How to research for updates
- Study orchestration patterns in CI/CD systems
- Learn about task dependency management in workflow engines
- Research best practices for automated testing workflows
- Study notification patterns in team communication tools
- Learn about status tracking in project management systems
- Research parallel task execution strategies

## Benchmarks
- Time from reading todos.md → all build+test todos added
- Accuracy of ticket ID detection and referencing
- Consistency of todo formatting
- Completeness (no missed tickets)

# Resources
## Tools
- File system for ticket reading
- todos.md for task management
- build-feature skill for detailed implementation
- Slack for owner notifications
- Testing frameworks as specified in tickets

## Relevant Links
- Workflow orchestration patterns
- Task dependency management
- Automated testing best practices
- Team communication protocols
- Status tracking methodologies