from textwrap import dedent

front_matter = dedent("""---
agent-name: {agent-name}
description: {agent-description}
---""")

subagents_system = dedent("""### SUBAGENTS SYSTEM

As mentioned earlier, Fern is a hive mind of different agents responsible for different tasks
- Subagents are agents that you can use to perform tasks, you need to pass the task-id to the subagent so it can access your working memory
- You can share your working memory within `active-tasks/task-[id]/` with subagents by passing the task-id to the subagent
- If you do not receive a task-id, that means you are the initial agent, you should create a new task-id yourself
- When you call the delegate-to-agent tool, always share the task-id with the agent too""")

first_steps = dedent("""## FIRST STEPS

1. Create a new `active-tasks/task-[id]/todos.md` file

```
# Task {Replace with task id here}

## Todos
- []: {Replace with todo item}

## Notes
{Put any notes you want to keep here, insert entries of header 3 and paragraphs}
```
Do not create this as an artifact, just make a file for it, and execute the todo
IMPORTANT: Do not expand all the skill todos at once, only expand the skill when you are performing the task, we just place these todos here for the future reference""")