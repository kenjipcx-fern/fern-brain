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
│   Best practices • pitfalls • resource  │
│   index • prompt-based workflows        │
└─────────────────────────────────────────┘
                    ↓
┌─────────────────────────────────────────┐
│        MEMORY SYSTEM                    │
│   Tool • Skill • Case • Working memory  │
└─────────────────────────────────────────┘
```

**System Prompt**: Core identity, workflow patterns, and skill execution framework (see `system-prompt/system-prompt-single.md` for the single-agent prompt)
**Skill System**: Prompt-based workflows storing best practices, pitfalls, and an index of relevant resources
**Memory System**: Persistent knowledge partitioned into tool, skill, case, and working memory

## 🧠 Memory types (where things live)

- **Tool memory**: How to use specific tools; indexes of useful links and notes → `memory/tools/`
- **Skill memory**: The skill prompt itself plus its working notes and indexes → `skills/*.md` and `skills/*.todos.md`
- **Case memory**: Episodic logs and reflections from past work → `memory/lessons/`
- **Working memory**: Task-scoped state and todos → `active-tasks/task-[id]/*.md` and `skills/*.todos.md`

## 📦 What this repo is

- **Prompt store**: A simple, transparent place to author and version skills (prompts) in `skills/`.
- **VPS-local memory**: A filesystem-first memory structure that lives entirely on your VPS (`memory/`, skill `*.todos.md`).
- **Hive syncing via Git**: Multiple VPS agents can collaborate by committing/pushing tuned prompts and pulling updates.

## 🐝 Hive mode via Git (distributed collaboration)

- **Many agents, one repo**: Run agents on different VPSes. Each tunes skills (prompts/steps) while working.
- **Share improvements**: Agents commit and push refined skills or new learnings; other nodes `git pull` to sync.
- **Conflict = conversation**: When two agents change the same skill, normal Git conflict resolution becomes the review step.

## 🧩 Skills are prompts (and usually steps)

- **Skills = prompts**: Each file in `skills/` is a prompt that describes a capability or step.
- **Composable**: Skills reference other skills to form execution plans.
- **Stateful**: Each skill keeps its own working memory in a sibling `*.todos.md` file.

## 🔌 Using these skills with other agents

- **Copy-paste**: Copy the prompt content from `skills/*.md` directly into another agent's tool/skill.
- **Dynamic read**: If this repo is mounted at the project root, an agent can read `skills/...` files on demand.
- **Thin contract**: Prompts are plain text, so they work across frameworks (Fern, custom agents, etc.).

## 🗂️ Working memory and case experiences

- **Working memory (todos)**: Persistent task state lives alongside skills as `*.todos.md`.
- **Case experiences**: Post-task learnings and patterns live in `memory/lessons/` and similar folders.
- **Good enough today**: Filesystem-backed memory is simple, diffable, and easy to sync.

## 🚀 Quickstart on a fresh VPS

1. Clone the repo and enter the project directory:
   - Using HTTPS:
     ```bash
     git clone https://github.com/your-org/fern-brain.git
     cd fern-brain
     ```
   - Or using SSH:
     ```bash
     git clone git@github.com:your-org/fern-brain.git
     cd fern-brain
     ```
2. Run the setup script (installs fnm, Node 24, pnpm, Claude Code CLI):
   ```bash
   bash scripts/setup-vps.sh
   ```
3. Open a new shell (or `source ~/.zshrc` / `source ~/.bashrc`) so your PATH updates apply.
4. Optional: To reset and re-run cleanly later, use the teardown script:
   ```bash
   bash scripts/teardown-vps.sh
   ```

Once set up, point your agent to read from `skills/` and write to `memory/` and `*.todos.md`.

### Build system prompts from sections

- Generate both prompts: `make prompts`
- Single only: `make prompts-single`
- Subagents only: `make prompts-subagents`
- Or run the builder directly: `python3 system-prompt/builder.py --all`

## 🗺️ Roadmap

- **Vector search backend**: When needed, swap/augment the filesystem memory with a vector store for semantic recall.
- **Auto-tuning loop**: Background agents that continuously test and tune prompts for specific skills, then push updates.

## Facts
- Only one skill will be executed at the start of the task
- Skills can contain other skills within their workflows
- Each skill is a tunable parameter (think prompts as parameters to a system)
- We optimize the skills that are used at the root of a skill and then we should be able to just gain incremental improvements
- Each skill has todos