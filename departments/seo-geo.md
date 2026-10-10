# SEO and GEO (search engines and AI answer engines)

GEO = being found and quoted by AI assistants and AI search (Yandex Alice and neuro-search, ChatGPT, Perplexity, Google AI overviews). It is young and unproven: nothing here guarantees rankings or citations; never promise results to the owner or client. Verify tool names, crawler names and engine rules against current sources at the start of each run (note date and source).

## Plan (before design and build) — `seo-geo`
1. **Intent and structure**: who searches what in this niche and city; page list with one main query per page; semantic core as a table (query, intent, page). Use real sources (search suggestions, competitor pages, Yandex and Google result pages); never invent search volumes.
2. **On-page rules**: unique title and description per page (patterns), one H1, logical H2/H3, readable URLs, internal links, image alt text, Russian text written for people.
3. **Structured data (schema.org JSON-LD)**: Organization or LocalBusiness, Service or Product, FAQPage, BreadcrumbList, Article where relevant. Never mark up reviews or ratings that do not really exist.
4. **Technical**: `sitemap.xml`, `robots.txt`, canonical, 404 page, redirects, language tag, Open Graph and favicon, mobile-first, speed targets (Core Web Vitals: loading, interactivity, layout stability), no content hidden behind scripts, wow effects must not hide text or slow the first screen (see `departments/wow-effects.md`).
5. **Local**: Yandex Business (Yandex Maps), 2GIS, Google Business Profile: same name, address and phone everywhere; instructions for the owner or client to register them (agents never register).
6. **Webmaster and analytics**: Yandex Webmaster and Search Console verification, Yandex Metrika counter (no recording of form inputs; see `departments/legal-ru.md`). Counter ids and verification are done by the owner.
7. **GEO**: short direct answers at the top of sections, a real FAQ block, clear facts about who, where, what, for whom, how to contact (consistent everywhere, no invented facts), clean headings, trustworthy mentions. Optional `llms.txt` (low-confidence value, say so). Decision for the owner: allow or block AI crawlers in `robots.txt`; list the current crawler names after verifying them.
8. **Forbidden**: keyword stuffing, hidden text, doorway pages, fake reviews, bought links, copied texts, invented statistics.

Output: `projects/<slug>/02a-seo.md` (semantic core, page table, meta, schema snippets, technical list, local and GEO tasks, open questions to the owner).

## Audit (before delivery) — `qa-seo`
Serve the build on `127.0.0.1`, open it, and check against `02a-seo.md`: titles, descriptions, H1, canonical, sitemap and robots, schema validity (parse the JSON-LD), alt texts, links, 404, mobile layout at 360, text present in the HTML without scripts, speed hints (page weight, blocking scripts, big images, fonts), console errors. Report numbers, severity in words, verdict "можно сдавать" or "нужны правки". Result: `projects/<slug>/05-seo.md`.
