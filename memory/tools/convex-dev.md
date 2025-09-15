version: 0.1.0
name: Convex.dev
tags: serverless-backend, database, realtime, typescript, functions, react, nextjs, auth
useful-for: Building full‑stack backends with real‑time data, server functions, storage, auth, and scheduling
---

# Overview
- Convex is a hosted serverless backend with a strongly‑typed database, reactive queries, and TypeScript server functions (queries, mutations, actions).
- You write schema and server functions in the `convex/` directory; Convex generates typed clients for your frontend.
- Real‑time reactivity keeps UI in sync automatically. Use `convex/react` hooks (`useQuery`, `useMutation`, `useAction`).
- Use queries for reads, mutations for writes, and actions for external network access or long‑running tasks.
- Built‑in features: auth integrations, file storage, schedules/cron jobs, optimistic updates, and typed IDs.

# Quick Start
- Install packages
  - `pnpm install convex`
- Initialize local dev (creates `convex/` if missing)
  - `pnpx convex dev`
- Define schema in `convex/schema.ts`
  - Use validators (e.g., `import { v } from "convex/values"`) and export the default schema
- Create server functions in `convex/` (e.g., `convex/items.ts`)
  - `import { query, mutation, action } from "convex/server"`
  - Use `ctx.db` to `insert`, `get`, `patch`, `delete`, and `query` with indexes
- Connect frontend
  - `import { ConvexProvider, ConvexReactClient } from "convex/react"`
  - Create client with your deployment URL and wrap your app with `ConvexProvider`
- Run locally
  - Backend: `pnpx convex dev`
- Deploy to production
  - `pnpx convex deploy`

# Tips
## Best Practices
- Model data with explicit validators in `schema.ts`; add indexes for your access patterns
- Keep queries pure and fast; move external calls and heavy compute to actions
- Prefer small, focused server functions; return only needed fields
- Use typed IDs and validate inputs server‑side; never trust client data
- Use optimistic UI updates sparingly and reconcile with server state
- Store large blobs in Convex storage APIs rather than embedding in documents
- Organize by domain: `convex/users.ts`, `convex/orders.ts`, etc.
- For Next.js/React, keep `use*` hooks in client components; avoid SSR with Convex hooks

## Known Pitfalls & Workarounds
- External network calls inside queries/mutations will fail
  - Use `action` functions for HTTP calls and long‑running work
- Slow or failing queries due to missing indexes
  - Define indexes in `schema.ts` and use `.withIndex()` in queries
- Large documents or oversized responses
  - Normalize data, paginate, or move blobs to file storage
- Real‑time reactivity causing excessive re‑renders
  - Narrow returned fields, paginate, and use stable filters/args
- Breaking schema changes
  - Use two‑phase rollouts: write backwards‑compatible code, backfill, then clean up
- Environment/config issues (e.g., missing URL)
  - Ensure `NEXT_PUBLIC_CONVEX_URL` (or client URL) and `CONVEX_DEPLOYMENT` are set correctly

# Configs
- `convex/schema.ts`: data model and indexes (validators via `v`)
- `convex/*.ts`: queries, mutations, actions, and helpers
- `convex/crons.ts`: scheduled jobs (cron)
- `convex/_generated/*`: auto‑generated clients and types (do not edit)
- `convex.json`: project configuration
- `.env.local` / env vars: `CONVEX_DEPLOYMENT`, `NEXT_PUBLIC_CONVEX_URL`
- `package.json` scripts: `convex:dev` = `pnpx convex dev`, `convex:deploy` = `pnpx convex deploy`

# Relevant Links
- Docs: [Convex Documentation](https://docs.convex.dev)
- Quickstart: [Build your first app](https://docs.convex.dev/quickstart)
- React Client: [convex/react](https://docs.convex.dev/using/react)
- Server Functions: [Queries, Mutations, Actions](https://docs.convex.dev/functions/server)
- Auth: [Authentication](https://docs.convex.dev/auth)
- File Storage: [Storage](https://docs.convex.dev/file-storage)
- Scheduling: [Cron Jobs](https://docs.convex.dev/scheduling)
- CLI: [convex CLI](https://docs.convex.dev/cli)
- Components: [Convex Components](https://www.convex.dev/components)