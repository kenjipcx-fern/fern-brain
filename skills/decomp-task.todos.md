# Todos (Lean Decomposition)

- [ ] Read the plan document (impl-plan.md / feature-spec.md)
- [ ] List pages/flows (e.g., Dashboard, Items, Settings)
- [ ] List integrations (auth provider, payments, storage, Convex components, webhooks)
- [ ] Enforce cap: **ticket budget = 10**
  - [ ] Reserve 1 for scaffolding
  - [ ] Allocate 1 per integration
  - [ ] Use remaining for **page CRUD bundles** (merge simple pages if over budget)

## Generate tickets (dependency-light order)
- [ ] Create `tickets/` folder
- [ ] 001-setup-convex (scaffolding)
- [ ] 00X-integration-* (one per integration; only if truly needed before a page)
- [ ] 00Y-page-<name>-crud (one per page; CRUD bundled)
- [ ] 00Z-polish-qa (optional, only if budget remains)

## For each ticket (minimal content)
- [ ] Description (outcome & scope; what’s in/out)
- [ ] Acceptance Criteria (user-visible demo steps)
- [ ] QA (happy path + 1–2 edge cases)
- [ ] Depends On (keep minimal; typically scaffolding)

## Finalize
- [ ] Confirm total tickets **≤10**
- [ ] Update `todos.md` with the flat ordered list above