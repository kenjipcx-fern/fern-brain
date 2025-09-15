---
version: 0.1.0
name: Create Implementation Plan
tags: [planning, system design, implementation, convex, nextjs, vercel]
goal: Transform specs and design into a system design and implementation plan for building the app
inputs: ["specs.md", "contract-of-done.md", "design.md"]
outputs: ["impl-plan.md with features, tools, and high-level implementation instructions"]
---

# Instructions
- Create a system design & implementation plan from the specs, design, and contract of done
- Don't do any coding yet, just plan
- Use the default stack: Next.js frontend, Convex.dev backend, Vercel deployment, Vercel AI SDK for agents
- Map required features (auth, payments, file storage, AI agents, background jobs, cron, etc.)
- For each feature, decide how to implement it using Convex + available tools
- Record clear reasoning for tool choices (Convex vs others, Vercel AI SDK for agents, etc.)
- Go through Convex components and ask: do we need this? If yes, fetch docs and link them
- Organize plan into phases (scaffolding → core features → integrations → polish)

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Fetch specs.md, contract-of-done.md, and design.md
- [ ] Perform system design and document reasoning for each stack/tool choice
- [ ] Design the backend using the [use-convex-dev](../skills/design-convex-backend.md) skill to design the backend
- [ ] Write impl-plan.md with features, tools, implementation notes, and links
- [ ] Summarize the plan into high-level tasks in todos.md
- [ ] Delete the parent todo along with all the subtasks from todos.md and move to the next todo 

# Tips
## Best Practices
- Always scaffold the project first to anchor the plan
- Keep each feature isolated in reasoning and docs
- Include resource links for reproducibility
- Default to Convex/Next.js/Vercel stack unless justified otherwise

## Known Pitfalls & Workarounds
- Pitfall: Features scoped too vaguely → Workaround: refine each into clear component-level decisions
- Pitfall: Ignoring default stack → Workaround: index Convex/Next.js/Vercel first, only deviate if justified

# Testing
## How to Test
- Review impl-plan.md — should list all features with chosen tools + links
- Verify reasoning aligns with default stack unless justified otherwise
- Check that all required features from design are accounted for

## Success Criteria
- Plan is concrete, reproducible, and grounded in Convex/Next.js/Vercel stack
- All required features from design are accounted for
- Tools are linked to docs and tool memory
- Plan is organized into clear implementation phases

# Self Improve
## How to research for updates
- Continuously review Convex component library for new features at https://www.convex.dev/components
- Monitor best practices in system design for Next.js + Convex projects
- Study real-world implementations from case studies or open-source apps
- Stay updated on Vercel AI SDK capabilities and patterns

## Benchmarks
- Time from design → plan completion
- Completeness of features listed vs design requirements
- Reuse of indexed tools and components
- Quality of reasoning for stack/tool choices

# Resources
## Tools
- Next.js
- Convex.dev
- Vercel
- Vercel AI SDK
- Animate UI, Shadcn UI, Aceternity UI, AI Elements SDK

## Relevant Links
- https://nextjs.org/docs
- https://docs.convex.dev
- https://vercel.com/docs
- https://sdk.vercel.ai
- https://www.convex.dev/components