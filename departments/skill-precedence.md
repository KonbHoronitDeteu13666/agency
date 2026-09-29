# Skills: who is in charge, so rules do not conflict

Connected skills sometimes contradict each other. Checked against their texts:
- `frontend-design` demands bold, unusual aesthetics, "not like everyone else", active animation, and not repeating the same solutions.
- `better-ui`, `better-typography`, `animate`, `refactoring-ui` demand restraint, exact values, and short, necessary animation.
- `ui-ux-pro-max` gives its own animation presets (GSAP) and font selections.

If left as is, the designer gets opposite instructions and makes something random. So the order is as follows.

## 1. Who wins in any dispute
1. The owner's word in chat.
2. The project ТЗ (`02-tz.md`).
3. The client's brandbook (`brandbooks/<client>/`).
4. Approved mockups (`03-design/`). The developer reproduces them and does not invent their own.
5. The table below.
6. General advice of any skill.

A higher item always beats a lower one. A skill does not override the ТЗ and brandbook.

## 2. Who is in charge by topic

| Topic | In charge | Helpers, only where the one in charge is silent | What not to apply |
|---|---|---|---|
| General style and mood | the client's brandbook; without it `brand-designer` from references in `design-library/` and the owner's choice | in «Вау» mode: `frontend-design` (bold direction, unusual composition); in «Стандарт» mode: `refactoring-ui`. Modes: `departments/design-taste.md` | "AI-generated" templates from `design-taste.md` (section 1) without the owner's decision |
| Font choice | `brand-designer` | pair selections from `ui-ux-pro-max` | any font without Cyrillic; the "never Inter/system" rule from `frontend-design` |
| Sizes, spacing, line breaks, readability | `better-typography` | size scale from `refactoring-ui` | values contradicting `better-typography` |
| Palette and contrast | brandbook; `color-expert` when creating | contrast check from `refactoring-ui` | palettes from `ui-ux-pro-max` if the brand is already set |
| Hierarchy, spacing, grouping, buttons | `refactoring-ui` | `ui-ux-pro-max` for typical screens | |
| Small details (radii, icons, tap targets, shadows) | `better-ui` | | |
| Interface motion (buttons, menus, forms, block appearance) | `animate` | exact values from `better-ui` after `animate` decides | `ui-ux-pro-max` GSAP presets, unless there is a reason |
| Showy scenes, scroll animation, 3D backgrounds («Вау» mode) | `ui-designer` from references and `departments/wow-effects.md` | `frontend-design`, GSAP, Unicorn Studio, Spline, three.js | an effect without the quality conditions from `wow-effects.md` (phone, weight, contrast, `prefers-reduced-motion`) |
| Library choice | the stack from the ТЗ | `pick-ui-library` within that stack | connecting a library "because it looks nice" |
| Variants | `brand-designer`: whole style variants. `prototype`: variants of a single block | | mixing levels: first style, then mockup, then block variants |
| Russian texts of interfaces, sites, instructions | `sasha` | tone from `brand` and the brandbook | |
| Posts and replies to clients | `copywriter` per the rules in its file | tone from the brandbook | `sasha` does not apply here per its description |
| References, effects, components from the site selection (`docs/references.md`) | the owner's choice via `references.html` | ideas for the mockup, components within the ТЗ stack | effects and libraries for a static S site, effects against `animate`, any font without Cyrillic or without a verified license |
| Design check | `qa-design` per `better-ui` and `better-typography` | `ux-audit` on request for M and L projects | |

## 3. When a conflict remains
The agent does not choose silently. It records in the work notes in one line: which two rules collided, what it chose and why. If the choice affects appearance or price, the question goes to the owner.

## 4. Python
`ui-ux-pro-max`, `sasha` and other skills suggest the `python` or `python3` command. Here only `py -3` works.
