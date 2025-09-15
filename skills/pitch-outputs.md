---
version: 0.1.0
name: Pitch Outputs (Demo + Stakeholder Update)
tags: presentation, demo, screenshots, storytelling, slack, communication
goal: Present the completed work with compelling visuals and a clear Slack update, highlighting outcomes, gaps, and next steps
inputs: validation.md findings, demo URL/credentials, acceptance criteria, changelog/PRs, stakeholder list
outputs: Screenshots gallery, concise summary, and a well-structured Slack message with links and attachments
---

# Instructions
- Collect evidence
  - Review `validation.md` and acceptance criteria; list features to showcase
  - Capture high-quality screenshots for each key page/flow (desktop + mobile if relevant)
  - Optional: short GIF/video for marquee interactions
- Curate the story
  - Order visuals to match the primary user journey
  - Add one-line captions emphasizing value and what to try
  - Note known limitations and workarounds discovered during validation
- Prepare Slack update
  - Lead with outcomes, then blockers, then asks
  - Include demo link, credentials (if needed), and a quick “How to try it” list
  - Attach screenshots (or link to a gallery) and reference `validation.md` for details
- Send and follow up
  - Post in the right Slack channel/thread; @mention owners if decisions are needed
  - Offer to walk through live; collect feedback and convert into todos

# Todos
Add these as subtasks to your current todo in [todos.md](memory/current-tasks/task-[id]/todos.md)  
- [ ] Identify the user flows from `specs.md` and pages to showcase from `validation.md`
- [ ] Capture screenshots of each key page/flow (include mobile variants if needed)
- [ ] Write 1–2 line captions for each screenshot focusing on outcomes
- [ ] Compile a gallery folder or doc and verify links/visibility
- [ ] Draft the Slack message (outcomes → blockers → asks) with demo link and how-to-try steps
- [ ] Attach screenshots or link to the gallery and reference `validation.md`
- [ ] Send the Slack update and capture feedback as todos
- [ ] Delete the parent todo along with all the subtasks from todos.md and move to the next todo 

# Tips
## Best Practices
- Outcome-first: highlight what works and user value before details
- Keep the message scannable: bold headings, short bullets, numbered steps
- Include clear calls-to-action and ownership for next steps
- Use timestamps or versions in screenshots to avoid confusion
- Redact secrets/PII from screenshots

## Known Pitfalls & Workarounds
- Overloading with too many visuals
  - Curate to the top 5–8 images; move the rest to the gallery
- Broken or private links
  - Open in incognito and mobile to verify access before sending
- Ambiguous asks
  - State explicit decisions needed with owners and due dates

# Testing
## How to Test
- Open the draft Slack message on desktop and mobile; ensure formatting/screenshot previews look good
- Verify demo link and credentials work; run the “How to try it” steps end-to-end
- Confirm attachments are accessible to all stakeholders

## Success Criteria
- Stakeholders can understand status and try the demo in under 2 minutes
- Screenshots clearly illustrate the core user journey and value
- Clear next steps and ownership acknowledged in the thread

# Self Improve
## How to research for updates
- Save strong examples of prior updates; keep a reusable message template
- Track questions that recur and preempt them in future pitches

## Benchmarks
- Engagement: time-to-first response < 15 minutes, at least one actionable reply
- Clarity: zero follow-up questions about how to access the demo
- Coverage: all acceptance criteria represented visually or referenced

# Resources
## Tools
- Screenshot tools (system capture or browser devtools)
- Optional: screen recorder for short GIFs/videos

## Slack Message Template
```markdown
**Release Update – <Project/Feature Name>**

**Demo**: <URL>  
Credentials: <user/pass or SSO note>  
How to try it:
1) <Step 1>
2) <Step 2>
3) <Step 3>

**Outcomes**
- <Outcome 1>
- <Outcome 2>

**Evidence**
- Screenshot: <image or link> – <caption>
- Screenshot: <image or link> – <caption>
(Full results in `validation.md`)

**Blockers / Known Issues**
- <Issue> – <impact> – <workaround>

**Asks / Next Steps**
- <Decision/Owner/Date>
- <Follow-up task>
```