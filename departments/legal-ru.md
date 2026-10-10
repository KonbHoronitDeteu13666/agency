# Russian legal compliance (websites, bots, ads)

NOT legal advice. Written from the model's general knowledge, NOT verified for the current date. Every item below must be re-checked by `legal-ru` against current official texts (pravo.gov.ru, consultant.ru, garant.ru, publication.pravo.gov.ru, rkn.gov.ru, official Roskomnadzor pages) at the start of each run; write "checked on <date>, source <url>" or "could not verify" per item. Laws change often. Everything the agent produces is a draft; the owner (and for payments on the site or large personal-data volumes, a lawyer) decides.

## Checklist by topic (verify applicability to the client's business)
1. **Personal data (152-ФЗ)**: published personal-data processing policy, linked in the footer and next to every form; consent checkbox (not pre-ticked, not bundled with other agreements) before any form or bot collects data; collect only needed fields; stated purpose, retention and deletion; contact for requests.
2. **Data localization**: databases with Russian citizens' personal data must be in Russia. Check every service touching the data: hosting, forms, CRM, email, analytics, fonts and scripts loaded from abroad, Telegram bot storage. List what is foreign; propose Russian alternatives (Yandex Metrika, Russian hosting). Flag unresolved items to the owner.
3. **Operator notification** to Roskomnadzor and cross-border transfer notification: the client business is the operator; say whether notification may be required and let the client's side confirm.
4. **Cookies, analytics, recording**: notice about cookies and analytics; session recording (e.g. Yandex Webvisor) must not capture form inputs.
5. **Seller and company details on the site**: full name or company name, INN, OGRN/OGRNIP, address, contacts; for online stores and paid services: public offer, price, goods or services description, delivery, payment, returns and consumer rights per consumer protection law (2300-1) and distance-sale rules. This covers the CLIENT's site and its customers only; never advise on money between the owner and the client (see below).
6. **Advertising law (38-ФЗ)**: no unprovable superlatives ("best", "№1", "cheapest") without proof; no invented reviews, ratings or guarantees; restricted topics and required disclaimers by product type; marking of internet ads (token ERID, advertising data operator) for ads and promotional posts; restrictions on advertising on certain foreign platforms; mentions of organizations recognized extremist or banned require the legal note.
7. **Russian language law**: requirements for Russian in consumer information and advertising and limits on foreign words; check current scope and exceptions (trademarks, names).
8. **Content rights**: licenses of fonts, images, icons, videos, libraries; no copying of others' texts, photos or logos; AI-generated images allowed only with the owner's approval.
9. **Reviews and testimonials**: only real, attributable, with consent; never invented (also an advertising-law and fraud risk).
## Out of scope
Money between the owner and the client: prices, invoices, contracts, payment terms, taxes, the owner's own legal or tax status. Never advise on these and do not raise them.

## Output files
- Requirements mode (before build): `projects/<slug>/02b-legal.md`: required pages and elements for THIS project, form and bot consent text, list of foreign services and Russian alternatives, open questions. Mandatory texts (policy, consent, offer for stores and paid services) as drafts in `projects/<slug>/outbox/` starting with "ЧЕРНОВИК, не юридическая консультация, форму проверяет владелец", requisites left as empty fields.
- Audit mode (before delivery): `projects/<slug>/05-legal.md`: per item ok / problem / could not verify with evidence (file, line, page), severity in words (критично, важно, мелочь), verdict "можно сдавать" or "нужны правки".
