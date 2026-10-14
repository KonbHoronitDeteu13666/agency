# Direct calls to executors (default)

Each agent call costs about 7 thousand tokens of baseline (measured 29.09.2026: an empty `qa-spec` = 6.9k, an empty `design-lead` = 12.3k, `ui-designer` with connected skills = 23k), before any work. The layer of leads adds its own baseline at each stage and mostly passes tasks along. So the main agent calls executors directly along these chains. Leads (`*-lead`) are called only for M and L stages where several executors work in sequence and a coordinator is needed, and even then at the main agent's decision.

In the prompt to an executor always specify: the absolute PROJECT_DIR (the project folder, chosen by the owner) and AGENCY_HOME (`C:\Users\HP\Desktop\agency`, shared rules, library, CRM), which files to read, which file to write, what to return (up to 15 lines). In all agency files `projects/<slug>/` means PROJECT_DIR and `brandbooks/<client>/` means `PROJECT_DIR\brandbook\`; departments, docs, design-library, leads, clients, marketing and templates stay in AGENCY_HOME.

| Department | Chain for an S project | What the main agent does itself |
|---|---|---|
| Brief and ТЗ | `brief-analyst`, then (after the client's answers) `seo-geo` (sites: `02a-seo.md`) and `legal-ru` in requirements mode (sites, shops, bots that collect data: `02b-legal.md`; pass them only the niche, city and project type, no client data), then `tz-writer` (writes `00-principles.md` first, then `02-tz.md` with numbered R and AC; see `departments/spec-flow.md`) | determines size S/M/L per `project-sizes.md`, passes questions to the owner |
| UX (after the ТЗ, before design; sites, shops, bots) | `ux-designer` writes `02e-ux.md` (goals, structure with standard sections, main action, forms, mobile, states, scenarios; for M and L also a grayscale `03-design/wireframe.html`) | shows the wireframe to the owner for M and L; passes the structure to design |
| Design | `reference-scout` (for visual projects), `brand-designer` (light variants, then the brandbook after the choice), `ui-designer` | shows HTML to the owner, runs the choice |
| Tasks and analysis (after the design is approved, before build) | `task-planner` writes `02c-tasks.md`; `spec-analyzer` writes `02d-analysis.md` (always for M and L; for S only if there is a form, bot, database, payment, login or data collection); up to two fix rounds (`tz-writer`, `task-planner`), then the owner decides | does not start the build while `02d-analysis.md` has a критично item; shows the owner the analysis summary |
| Development | one of `web-dev`, `bot-dev`, `automation-dev` by project type, working task by task from `02c-tasks.md` | |
| Checking | `qa-spec`, `qa-copy`, `qa-design` (if there are visuals), `qa-code` (if there is logic), `qa-security` (always when there is a form, bot, database, payment, login or data collection; delivery is blocked on its verdict), `qa-seo` (sites), `legal-ru` in audit mode (sites, shops, bots that collect data; delivery is blocked on its verdict), `qa-ux` (every site, shop and bot with a flow; a критично item blocks delivery) | collects findings into `05-qa.md`, verdict |
| Planning | without `planner`: the main agent writes `deadlines.md` | |
| Documents and closing | `doc-drafter` as needed | moves the client to `clients/` |
| Leads | `lead-finder`, then `lead-checker` | |
| Marketing | `content-planner`, `copywriter` | |
| SMM (analytics, competitors, strategy, plans for VK, Telegram, Instagram) | `smm-analyst` (`departments/smm.md`), texts: `copywriter` | asks the owner for statistics files and competitor links |
| Sales | `outreach-drafter`, `proposal-drafter` | |
| GitHub (only on the owner's explicit request) | `git-publisher`: creates a repository (private by default), commits and pushes a client project (`04-build/` only) or the agency repo itself; checks for leaks before every push | passes the owner's request, slug, repo name and visibility; shows the owner the repo URL and what was left out |
| Support | `support-drafter`, `guide-writer`; a code fix is done by the project's developer | assesses whether the fix falls within the original ТЗ, the owner decides |

For M and L you can call a lead (`tz-lead`, `design-lead`, `dev-lead`, `qa-lead`) if the stage is large; then its instructions apply.
