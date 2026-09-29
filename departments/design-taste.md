# Design taste and currency

Goal: so the visuals do not look like typical AI generation but are at the level of modern studio sites. Mandatory for `brand-designer`, `ui-designer`, `reference-scout`.

## 1. What "AI-generated" design looks like (forbidden by default)
- Centered first screen: large heading, subheading, two buttons, under it three identical cards.
- Purple-blue gradients, glowing blobs, "glass" panels for no reason.
- The same characterless font (Inter, Roboto, system) in all headings.
- All blocks of the same width, the same corner rounding, the same spacing, no rhythm and scale.
- Emoji icons, stock phrasing ("Innovative solutions for your business").
- No strong idea: you cannot answer in one phrase what is memorable about this site.
All of this is acceptable only if the owner decided so.

## 2. How we build design experience
1. **Reference library** `design-library/`. Each entry: link, date, category (niche, technique, motion, 3D, fonts), a breakdown from the live page: real colors, fonts and sizes (from computed styles), which animation and 3D libraries are connected, what makes the work strong (composition, scale, rhythm, contrast, motion). Index `design-library/index.md`.
2. **Before designing** the agent reads the library and opens 3–5 live references for the project's niche and mood. From them it picks 2–3 and writes what it takes from each (a technique, not a copy).
3. **Idea in one phrase.** Before the mockup the agent formulates the site's main idea and how it differs from the "AI-generated" template of section 1.
4. **Self-check by eye.** After the mockup the agent opens the result in a browser (via a local server: `py -3 -m http.server`), looks at phone and desktop widths and compares with the references. Finds at least three weak spots and fixes them. Only then delivers.
5. **Currency.** `reference-scout` updates the library once a month (scheduled task) and on request: looks at fresh selections and gallery winners.

## 3. Where to look
Checked 29.09.2026 by a request from the computer. Sites that answered with codes 403, 429 and 202 block bots: open only in a browser, do not read as text.

| Task | Sites |
|---|---|
| Best sites in the world, modern presentation | awwwards.com, godly.website, httpster.net, minimal.gallery, siteinspire.com (429), brutalistwebsites.com |
| Studio templates, view live | framer.com/marketplace |
| Ideas and visual selections | savee.it, dribbble.com (202), behance.net (403) |
| Landing pages for ordinary niches | onepagelove.com, landingfolio.com, hoverstates.com, land-book.com (403), lapa.ninja (403) |
| Motion and 3D | codrops.com, gsap.com/showcase, unicorn.studio, spline.design |
| Fonts | fonts.google.com (Cyrillic, free license), fontshare.com (often without Cyrillic), typewolf.com (which font pairs are in use now) |
| Client's niche | sites of the client's competitors in their city and worldwide, found by search |
| Owner's selection | `docs/references.md` (effects, components, fonts) |

These sites have no available API, everything goes through the browser. What is on them now is checked by `reference-scout` during collection.

## 4. Modes
- **«Вау»** (default for landing pages, business-card sites, sites where visuals sell): strong idea, characterful fonts, unusual composition, expressive motion, 3D where appropriate. Effect rules: `departments/wow-effects.md`.
- **«Стандарт»** (bots, data panels, account areas, utilitarian sites, unless the owner asks otherwise): clean, readable, no showy effects.
The mode per project is assigned by the owner. If they did not say, the agent proposes a mode by project type and shows the choice visually.

## 5. Order of spending: cheap first, expensive after the choice
- **Style variants (3 pieces)** are made light: one file `variants.html` with three first-screen previews, a palette with codes, a font pair and a row of buttons. No effects, no full pages, a shared skeleton for all three. Goal: for the owner to choose a direction.
- **First-screen effect** (animation, 3D, stickers) is built once, already for the chosen variant.
- **Full mockup** is made only after the choice and approval of the brandbook.
- Between stages the agent stops and shows the result and does not move on by itself, unless the owner allowed running the project to the end.
Reason: three full pages with effects cost three times one, and only one needs to be chosen from them.
