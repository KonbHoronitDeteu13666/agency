# Testing department

Lead: `qa-lead`. Executors: `qa-code`, `qa-design`, `qa-copy`, `qa-spec`, `qa-security`, `qa-seo`, `qa-ux` (usability, scenarios from `02e-ux.md`), plus `legal-ru` in audit mode. A "нужны правки" verdict from `qa-security` or `legal-ru` blocks delivery until fixed. Specs for these checks: `02a-seo.md` and `02b-legal.md`; rules: `departments/seo-geo.md`, `departments/legal-ru.md`.
Input: the whole project. Output: `05-qa.md`, findings from most serious to least, verdict.
Rules: QA only checks. Up to two rounds of fixes, then the owner decides. If there is nothing to check something with, say so plainly.
