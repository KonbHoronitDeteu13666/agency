# Project sizes

The agency takes projects of different scale. The main agent determines the size at the very start from the brief and tells the owner. The final decision on size, price and deadline belongs to the owner.

| Size | Examples | Timeline | How we run it |
|---|---|---|---|
| S, mass | landing page, business-card site, simple Telegram bot, small automation | 1–3 days, invoice from 10,000 rub. | brief, short ТЗ, mockup, build, one QA, delivery |
| M, larger | multi-page site, small shop, bot with a database, payment or admin panel, personal account area, linking several services, simple AI agent with several scenarios | from a few days to a few weeks, the owner decides the price | add a scheme of sections and data, split into stages with acceptance criteria, QA after each stage, interim showings to the client through the owner |
| L, at the limit | many roles and permissions, complex calculations, high loads, native mobile apps, deep integrations | the owner decides | not a refusal but a conversation: the main agent honestly names the risks and proposes a first stage (MVP), the rest depending on results |

The owner is not a programmer, and there are no tools other than Claude Code. So the larger the project, the stricter the acceptance: each stage has verifiable criteria the owner can check personally, and a note on what to do after delivery.

## What is added for M and L
- `02-scheme.md`: sections and screens, data entities, what is in the MVP and what comes later. Made by `tz-writer` before the ТЗ.
- In `02-tz.md`: stages, each with its own acceptance criteria, a data model with field types, a list of integrations, and for the backend a list of requests.
- `deadlines.md`: milestones per stage, not a single date.
- Development goes in stages, QA runs after each. The stage result is visible to the owner so they can show it to the client and get agreement before the next one.
- Each stage in git (`git init` in `04-build/`): you can go back if a stage broke earlier ones.
- If the client asks for something beyond the ТЗ along the way, the agent does not take it on but returns it to the owner: is it new work or a fix.
