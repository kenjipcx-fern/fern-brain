# Fern Agent: Self-Evolving Software Development Agent

> A computer-use agent that builds software by learning skills, managing its own workflow, and evolving its capabilities over time.

## 🎯 What is Fern?

Fern is an AI agent that builds software applications by:
- **Breaking down complex goals** into executable skills (like Minecraft's Voyager)
- **Learning new skills** when it encounters capability gaps
- **Managing its own workflow** through a persistent todo system
- **Evolving over time** by storing successful patterns as case memory

**Core Philosophy**: Research → Plan → Execute → Reflect → Learn

## 🧠 System Architecture

### The Brain: Three-Layer Intelligence

```
┌─────────────────────────────────────────┐
│           SYSTEM PROMPT                 │
│     Core reasoning & workflow logic     │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│         SKILL SYSTEM                    │
│   YAML toolprints for capabilities     │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│        MEMORY SYSTEM                    │
│   Cases, research cache, task state    │
└─────────────────────────────────────────┘
```

**System Prompt**: Core identity, workflow patterns, and skill execution framework
**Skill System**: Modular capabilities stored as YAML toolprints
**Memory System**: Persistent knowledge and project state

## Facts
- Only one skill will be executed at the start of the task
- Skills can contain other skills within their workflows
- Each skill is a tunable parameter (think prompts as parameters to a system)
- We optimize the skills that are used at the root of a skill and then we should be able to just gain incremental improvements
- Each skill has todos