# Step-by-step mode (owner rule 15.10.2026)

Like Spec Kit: one step, then a stop. Nothing runs on its own. The main agent never chains steps, never starts the next step, never starts fixes and never runs QA rounds without the owner's go. Only the owner moves the project forward.

## After EVERY step the main agent stops and reports (in Russian, up to 12 lines)
- **Шаг N из M: <name>**, who did it.
- **Сделано:** what was produced, with file paths; show visual files (`SendUserFile`, `display: "render"`).
- **Нашёл / нужно решить:** findings, open questions, risks, anything that blocks the next step.
- **Дальше:** the next step and which agent would do it.
- **Ответь:** «дальше» (go on), «переделай: <what>» (redo this step), «пропусти» (skip the next step), «стоп».
Then wait. No other action until the owner answers. Workers run in the background only so that «стоп» works; they never start another worker themselves.

## Steps for a website (project size S; M and L add `02-scheme.md`, stages, wireframe)
| # | Step | Agent | Output |
|---|---|---|---|
| 1 | Intake, project folder, size | main agent | folder, size, questions |
| 2 | Brief and client questions | `brief-analyst` | `01-brief.md` |
| 3 | Competitor analysis | `competitor-analyst` | `01b-competitors.md`, `competitors.html` |
| 4 | SEO/GEO and legal requirements | `seo-geo`, `legal-ru` | `02a-seo.md`, `02b-legal.md` |
| 5 | Principles and spec | `tz-writer` | `00-principles.md`, `02-tz.md` |
| 6 | UX | `ux-designer` | `02e-ux.md` (+ wireframe for M, L) |
| 7 | References | `reference-scout` | `references.html` |
| 8 | Style variants | `brand-designer` | `variants.html` |
| 9 | Brandbook | `brand-designer` | `brandbook.html` |
| 10 | First design (raw, shown as is) | `ui-designer` | `03-design/` |
| 11 | Design check and polish (only after the owner says the direction is right) | `qa-design`, `ui-designer` | fixes |
| 12 | Texts | `copywriter` | texts |
| 13 | Tasks | `task-planner` | `02c-tasks.md` |
| 14 | Consistency check | `spec-analyzer` | `02d-analysis.md` |
| 15 | Build | `web-dev` / `bot-dev` / `automation-dev` | `04-build/` |
| 16 | Checks before delivery | QA agents (the group is one step) | `05-qa.md` and the other reports |
| 17 | Fixes (only those the owner chose) | developer or designer | fixes |
| 18 | Handover materials | `guide-writer`, `doc-drafter` | drafts in `outbox/` |
| 19 | GitHub repository (only on request) | `git-publisher` | repository |
Bots and automations skip the design steps they do not need. The main agent tells the owner the exact step list for the project at step 1 (numbers N of M).

## Evidence the main agent must see BEFORE it reports a step (otherwise send it back, do not report it as done)
Everything the agents "found" must come from pages they really opened (they have web search, `WebFetch`, a browser). Nothing is taken from memory.
| Step | Evidence required |
|---|---|
| 3 competitors | at least 5 competitors, each with a URL and the date it was viewed |
| 7 references | at least 5 sources in `references.html`, each with a URL, real computed colors, fonts and sizes, and what makes it strong; a reference without a URL or measured data counts as invented |
| 10 first design | `03-design/photos.md` exists, every image on the pages has a row with a source URL and a licence status; no subject drawn in SVG or CSS; any slot without a photo is listed openly and asked to the owner |
| 12 texts | no invented facts, numbers or reviews |
| 16 checks | each checking agent says whether it really ran in the browser; "не проверено в браузере" is not a pass |
If the evidence is missing, the main agent returns the step to the agent once with the exact gap; if it is still missing, it tells the owner plainly.

## Rules
- A step may use several agents in parallel when they do not depend on each other (for example `seo-geo` with `legal-ru`, or the QA group); that is still one step with one report.
- QA and analysis findings go to the OWNER first. Fixes start only on the owner's choice of what to fix (all, some, none). Maximum two fix rounds per step, each started by the owner.
- The owner may say «веди шаги N–M сам» for a named range: then the main agent runs only that range without stops, and returns to step-by-step mode right after.
- A department lead (`*-lead`), if ever called, also returns after each sub-step and does not continue on its own.
- Steps never skip the owner's approvals already required elsewhere (ТЗ, direction of the design, brandbook, delivery).
