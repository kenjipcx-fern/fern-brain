---
version: 0.1.0
name: Brainstorm UI
tags: [ui, ux, design, prototyping]
goal: Produce low-fidelity designs and a contract of done for the app’s core user flows
inputs: ["Raw specs, user stories, and problem definition"]
outputs: ["`preview-designs.md` with agreed-upon UI/UX layouts and flows"]
---

# Instructions
Create low-fidelity previews of the app’s **core user flows** before committing to full implementation.  
- Use ASCII diagrams or quick React prototypes to visualize layouts.  
- Preview components early so users are not surprised by final design.  
- Scaffold UI using modern component libraries:  
  - **Animate UI** for base components (preferred)  
  - **Shadcn UI** as fallback for missing components  
  - **Aceternity UI** for flashy elements ([link](https://ui.aceternity.com/components))  
  - **AI Elements SDK** for AI chat UIs ([link](https://ai-sdk.dev/elements/components))  
  - **Tweakcn** for themes ([link](https://tweakcn.com/editor/theme?tab=ai))  

After refinement with the user, create a `contract-of-done.md` file capturing:  
- Final layout and flows  
- Agreed component looks and styles  
- A checklist of verification points  

Share this document with the user via Slack.  

# Tips
## Best Practices
- Screenshot outputs and self-check before showing to the user  
- Mix and match elements from different UI kits for variety  
- Preview early → adjust cheaply  

## Known Pitfalls & Workarounds
- Pitfall: Too many ports/processes → Workaround: don’t keep spawning ports unnecessarily  
- Pitfall: Overly polished prototypes too early → Workaround: keep fidelity low until user alignment  

# Testing
## How to Test
- Verify that `preview-designs.md` reflects all agreed decisions
- Verify that `contract-of-done.md` reflects all agreed UI/UX decisions
- Compare snapshots/ASCII sketches against final app UI later

## Success Criteria
- User explicitly approves low-fidelity previews  
- Contract of done is accepted and signed off
- Preview designs are accepted and signed off

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
- Shadcn CLI / MCP server  
- Animate UI  
- Aceternity UI  
- AI Elements SDK  
- Tweakcn  
- React + Terminal + File Editor  

## Relevant Links
- https://ui.aceternity.com/components  
- https://ai-sdk.dev/elements/components  
- https://animate-ui.com/docs/components  
- https://tweakcn.com/editor/theme?tab=ai  