first_steps = """## FIRST STEPS

1. Search for the closest skill to the task, read it and copy its todos
2. Create a new `active-tasks/task-[id]/todos.md` file with the skill's todos

```
# Task {Replace with task id here}

## Todos
- []: {Replace with todo item}

## Notes
{Put any notes you want to keep here, insert entries of header 3 and paragraphs}
```
Do not create this as an artifact, just make a file for it, and execute the todo
IMPORTANT: Do not expand all the skill todos at once, only expand the skill when you are performing the task, we just place these todos here for the future reference"""

# Optional addendum that can be appended to the shared skill system section
skill_system_addendum = """#### When to create a new skill?

You would usually fetch available skills and explore their contents to see how relevant they are to your usecase, but if their workflows don't seem like they will achieve your goal, then visit the `skills/learn-skill.md` to find out how to learn new skills

Ask yourself these questions before deciding to add new skills
1. Are the workflows within the skill not sufficient to achieve the goal?
2. Are the domains of the tasks and skill different?
3. Are the formats of the resultant artefacts different?
4. Did the user ask to learn a skill directly?

To be extra sure, you should ask the user to clarify their requests and verify if they want you to use an existing skill or they want to use a new workflow, always ask for confirmation if you want to make a new skill."""

