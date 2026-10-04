# Direct calls to executors (default)

Each agent call costs about 7 thousand tokens of baseline (measured 29.09.2026: an empty `qa-spec` = 6.9k, an empty `design-lead` = 12.3k, `ui-designer` with connected skills = 23k), before any work. The layer of leads adds its own baseline at each stage and mostly passes tasks along. So the main agent calls executors directly along these chains. Leads (`*-lead`) are called only for M and L stages where several executors work in sequence and a coordinator is needed, and even then at the main agent's decision.

In the prompt to an executor always specify: project slug, which files to read, which file to write, what to return (up to 15 lines).

| Department | Chain for an S project | What the main agent does itself |
|---|---|---|
| Brief and ТЗ | `brief-analyst`, then (after the client's answers) `tz-writer` | determines size S/M/L per `project-sizes.md`, passes questions to the owner |
| Design | `reference-scout` (for visual projects), `brand-designer` (light variants, then the brandbook after the choice), `ui-designer` | shows HTML to the owner, runs the choice |
| Development | one of `web-dev`, `bot-dev`, `automation-dev` by project type | |
| Checking | `qa-spec`, `qa-copy`, `qa-design` (if there are visuals), `qa-code` (if there is logic), `qa-security` (always when there is a form, bot, database, payment, login or data collection; delivery is blocked on its verdict) | collects findings into `05-qa.md`, verdict |
| Planning | without `planner`: the main agent writes `deadlines.md` | |
| Documents and closing | `doc-drafter` as needed | moves the client to `clients/` |
| Leads | `lead-finder`, then `lead-checker` | |
| Marketing | `content-planner`, `copywriter` | |
| Sales | `outreach-drafter`, `proposal-drafter` | |
| Support | `support-drafter`, `guide-writer`; a code fix is done by the project's developer | assesses whether the fix falls within the original ТЗ, the owner decides |

For M and L you can call a lead (`tz-lead`, `design-lead`, `dev-lead`, `qa-lead`) if the stage is large; then its instructions apply.
