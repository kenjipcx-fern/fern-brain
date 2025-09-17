---
version: 0.2.0
name: Task Decomposition (Lean)
tags: [planning, tickets, decomposition, project-management, parallelization]
goal: Create a small set of execution-ready tickets (≤10) that ship end-to-end value fast.
inputs: ["Any plan document (impl-plan.md, feature-spec.md, etc.)"]
outputs: ["tickets/ folder with ≤10 tickets", "updated todos.md with ticket refs"]
---

# Rules of Thumb
- Cap: **≤10 tickets total** (hard limit).
- Structure by **pages/flows**, not granular features.
- **CRUD is bundled** per page (one ticket per page’s CRUD set).
- **Integrations are split**: 1 ticket per external/complex integration (auth provider, payments, file storage, Convex component, webhooks, etc.).
- **Scaffolding is its own ticket** (e.g., `pnpx create-convex`).
- Keep tasks **0.5–2 days** each; avoid dependency webs.

# Ticket Types
1) **Scaffolding** – project setup, environments, base libs.
2) **Page CRUD Bundle(s)** – one ticket per page/section that covers schema, queries, mutations, and UI.
3) **Integration(s)** – one ticket per complex integration.
4) *(Optional, if budget remains)* **Polish/QA pass** – accessibility, error states, metrics.

# Decomposition Steps
1) List pages/flows from the plan (e.g., Dashboard, Items, Settings).
2) Create **Scaffolding** ticket.
3) For each page, create **one CRUD bundle** ticket.
4) Identify **integrations**; create **one ticket each**.
5) If total >10, **merge** low-complexity pages into nearest bundle until ≤10.
6) Define **light dependencies** only (Scaffolding → others; Integrations only if strictly required).
7) Generate tickets (flat order: Scaffolding → critical integrations → page bundles → optional polish).

# Naming
- `001-setup-convex`
- `002-integration-auth-github`
- `003-page-items-crud`
- `004-page-settings-crud`
- `005-integration-payments`

# Ticket Content (minimal)
- **Description**: outcome + scope (what’s in/out).
- **Acceptance Criteria**: user-visible demo steps.
- **QA**: basic happy path + 1–2 edge cases.
- **Depends On**: ids (keep minimal).

# Success Criteria
- ≤10 tickets, each demoable; CRUD grouped by page; integrations isolated; shallow deps; fast path to first usable flow.

# Anti-Patterns (avoid)
- Splitting CRUD into separate “create/read/update/delete” tickets.
- Deep dependency graphs or per-component tickets.
- Over-specifying order beyond what’s necessary.