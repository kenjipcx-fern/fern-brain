---
version: 0.2.0
name: Brainstorm UI/UX
tags: [ui, ux, design, prototyping]
goal: Produce a concise UX plan (flows) and low-fidelity UI layouts for core workflows
inputs: ["Raw specs, user stories, problem definition"]
outputs: ["`skills/ux-design.md` (flows, rationale)", "`skills/ui-design.md` (pages, components, themes)"]
---

# Instructions
Work top-down from user stories to the minimum lovable flows. Focus only on key workflows; ignore auth/payments unless they are the product.

1) Transform stories into user flows
- Define start triggers (e.g., homepage) → actions → system responses → completion
- Prioritize 2–4 core flows that prove the product

2) Research inspirations
- Review competitor flows (e.g., Mobbin)
- For each, record the good element and why to adopt it

3) Low-fidelity POC
- Use ASCII and minimal Shadcn "blank page" layouts focusing on actions
- Draft key components and map them to pages/routes

4) Propose core pages
- Outline page structure, themes, and brand color directions
- For each page, list candidate Shadcn components and ASCII placements
- Capture screenshots of component examples if helpful

5) Propose theme and components
- Search up tweakcn for a suitable theme and note it down
- Search up relevent components from shadcn, animate ui, aceternity ui, ai elements sdk that we would want to use in different pages and note them down

Deliverables:
- `ux-design.md`: flows, ASCII, inspirations, rationale
- `ui-design.md`: pages, components, themes, screenshots

Share both docs with the user (e.g., Slack) and iterate until approved.

# Tips
## Best Practices
- Screenshot outputs and self-check before sharing  
- Keep fidelity low until alignment; optimize for flow clarity  
- Mix elements from different UI kits where helpful  

## Known Pitfalls & Workarounds
- Pitfall: Overbuilding non-core surfaces early (auth/payments) → Workaround: focus only on key workflows  
- Pitfall: Too many ports/processes → Workaround: avoid spawning unnecessary dev servers  

# Testing
## How to Test
- Verify that `/ux-design.md` captures flows, inspirations, and rationale
- Verify that `/ui-design.md` captures pages, components, themes, and screenshots
- Compare ASCII/wires against the final app UI later

## Success Criteria
- User explicitly approves core UX flows  
- User explicitly approves core UI pages and theme  
- `ux-design.md` and `ui-design.md` are accepted and signed off

# Self Improve
## How to Research for Updates
- Explore Mobbin for latest app flow patterns  
- Stay updated with Animate UI, Shadcn, and other UI libraries  
- Study real-world app onboarding flows for inspiration  

## Benchmarks
- Number of iterations needed before user approval  
- Time from spec → low-fidelity contract alignment  

# Resources
## Tools
- Shadcn CLI / MCP server (primary)  
- Animate UI (optional)  
- Aceternity UI (flashy elements)  
- AI Elements SDK  
- Tweakcn  
- React + Terminal + File Editor  

## Relevant Links
- [Aceternity UI components](https://ui.aceternity.com/components)  
- [AI Elements SDK components](https://ai-sdk.dev/elements/components)  
- [Animate UI components](https://animate-ui.com/docs/components)  
- [Tweakcn theme editor](https://tweakcn.com/editor/theme?tab=ai)  