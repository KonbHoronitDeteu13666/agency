# SMM

Executor: `smm-analyst`. Works with `content-planner` and `copywriter` (marketing).
Input: platform and goal from the owner; files with statistics (exports from VK, TGStat, Instagram); links to competitors' public pages.
Output: files in `projects/<slug>/smm/` (competitors, audience, analytics, strategy, content plan, drafts). Anything for a client goes to `outbox/` as ЧЕРНОВИК.

Rules:
- Read-only on social networks: no publishing, likes, subscriptions or messages.
- No client data in web queries. No tokens or keys: the owner enters them if ever needed.
- Numbers only from the owner's files or with a source link; guesses are marked «гипотеза».
- Result readiness: findings are short and in plain language, each recommendation says what to do and why.

Tools: plugins `social-media-skills` and `marketing` (installed by the owner on 2026-10-08, checked before install), skill `xlsx` for tables.
