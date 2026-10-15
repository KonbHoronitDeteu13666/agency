# Spec flow: principles, spec, tasks, analysis (Spec Kit style)

Idea taken from Spec Kit (github/spec-kit): constitution, specify, clarify, plan, tasks, analyze, implement. Our mapping, with files in the project folder (`projects/<slug>/` in the agency files means PROJECT_DIR, the folder the owner chose for this project):

| Spec Kit step | Ours | Who | File |
|---|---|---|---|
| constitution | project principles | `tz-writer` | `00-principles.md` |
| specify + clarify | brief with client questions, then the spec | `brief-analyst`, `tz-writer` | `01-brief.md`, `02-tz.md` |
| (extra) | competitor analysis: who they are, strengths and weaknesses, gaps | `competitor-analyst` | `01b-competitors.md`, `competitors.html` |
| (extras) | SEO/GEO and legal requirements | `seo-geo`, `legal-ru` | `02a-seo.md`, `02b-legal.md` |
| plan | stack, structure, data model inside the spec | `tz-writer` | `02-tz.md` (plan sections) |
| (extra) | UX: goals, structure, main action, forms, scenarios | `ux-designer` | `02e-ux.md` (and `03-design/wireframe.html` for M and L) |
| (extra) | design | design agents | `03-design/` |
| tasks | task breakdown after the design is approved | `task-planner` | `02c-tasks.md` |
| analyze | consistency and coverage check before build | `spec-analyzer` | `02d-analysis.md` |
| implement | build task by task | `web-dev`, `bot-dev`, `automation-dev` | `04-build/` |

## IDs for traceability
- Requirements in `02-tz.md`: `R1`, `R2`, ... Acceptance criteria: `AC1`, `AC2`, ..., each linked to a requirement (`AC3 (R2)`).
- Tasks in `02c-tasks.md`: `T001`, `T002`, ... each lists the `R`/`AC` ids it covers.
- Every `R` has at least one `AC`; every `AC` is covered by at least one task; every task points to at least one `AC`.

## `00-principles.md` (short, up to 25 lines)
Mode («Вау» or «Стандарт»), quality bar (what "done" means for this client), security level by project type, stack limits (simple, maintainable through Claude Code), tone of texts, hard bans (see `CLAUDE.md`: decor and wording bans, no demo markers), what is out of scope. Every later file must obey it.

## `02c-tasks.md` format
Grouped by stage (for S one stage). Each task: id, one-line title, executor agent, files it touches, depends on, `[P]` if it can run in parallel, covers (`AC` ids), how to check it is done (verifiable). Checkbox `- [ ]` that the developer ticks `- [x]` when done. Small tasks (a developer finishes one in one sitting), in dependency order. No task outside the spec.

## `02d-analysis.md`
Written by `spec-analyzer` (read-only): coverage gaps, orphan tasks, contradictions between brief, spec, `02a`, `02b`, design and tasks, open questions nobody answered, principle violations, risks. Severity in words (критично, важно, мелочь), verdict «можно собирать» or «нужны правки» with who fixes. Build does not start on «нужны правки» with any критично item. Findings go to the owner first; fixes start only on his choice, at most two rounds, each started by him.

## When
- M and L: always, per stage.
- S: `task-planner` writes a short list; `spec-analyzer` runs only if the project has a form, bot, database, payment, login or data collection, or if the owner asks.
