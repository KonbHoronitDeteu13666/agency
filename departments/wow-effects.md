# Showy animation and 3D

Allowed and encouraged in «Вау» mode. The rules exist not to cut back, but so the effect works on the client's phone and does not break the site.

## What to use
| Task | Tool | Note |
|---|---|---|
| Scroll animation, complex sequences | GSAP (ScrollTrigger) | for static and React sites; main choice |
| Smooth transitions and gestures on React | Motion | only if the stack is React |
| 3D background, shaders, waves, particles | Unicorn Studio or Spline (ready export embed) | easiest for a non-programmer: the scene can be edited without code |
| Custom 3D and shaders | three.js | if a unique scene is needed; harder to maintain |
| Cursors, backgrounds, text effects | ideas from reactbits, fancycomponents, cursify, magicui | take code according to its license |
| Numbers, counters | number-flow | |

## Mandatory quality conditions
- **Phone.** On weak devices a heavy 3D scene is replaced by a light one (poster, video, simplified scene). Check at 360 px width.
- **Weight and speed.** Effects load after the first screen, 3D has a poster image while the scene loads. The first screen is visible immediately.
- **Readability.** Text over an animated background passes contrast in the worst frame.
- **Accessibility.** `prefers-reduced-motion` turns off motion, 3D has a static variant.
- **Does not interfere with action.** The request button is visible and clickable at any moment, the effect does not cover it and does not block scrolling.
- **Licenses.** Every library and scene with its license in the project note. Unicorn Studio and Spline may have free-plan limits and watermarks; we tell the owner about paid plans before connecting (budget).
- **Works without internet access to third-party CDNs, if that is critical.** Otherwise a variant with a local copy.

## How we decide what to animate
The general decision (whether animation is needed, which one and how fast for interface elements) follows `animate`. Showy scenes and strong techniques on the first screen and key blocks are chosen by `ui-designer` from references and the site's idea, while `animate` checks interface motion (buttons, menus, forms).
