# Browser access for checking agents (qa-ux, qa-design, qa-spec, qa-seo)

A page can only be checked in a real browser over `http://127.0.0.1:<port>`. Browser tools cannot drive `file:///` pages. Use this ladder; do not give up after the first failure.

1. **Playwright tools** (`mcp__plugin_playwright_playwright__*`) if they exist and respond. If a call fails or times out, retry at most once, then go to step 2. Never loop on a dead tool.
2. **Built-in browser tools** (`mcp__Claude_Browser__*`: `navigate`, `resize_window`, `get_page_text`, `read_page`, `find`, `form_input`, `computer`, `javascript_tool`, `read_console_messages`, tabs). Same checks: set the width with `resize_window`, read real numbers with `javascript_tool` (`getBoundingClientRect`, `getComputedStyle`, `document.documentElement.scrollWidth > innerWidth`), screenshots at scale 0.5 only when you need to see something.
3. **Where to serve from**:
   - If the owner's server is running (`scripts/serve-projects.cmd`, port 8777, serves the `projects` folder on localhost only), open `http://127.0.0.1:8777/<slug>/<file>` and do NOT stop that server.
   - Otherwise, if you have a shell: `py -3 -m http.server <free port> --bind 127.0.0.1 --directory <folder>`, and stop it when you finish. Never bind to all interfaces.
   - If you have no shell and the owner's server is not running: ask the main agent to have the owner start `scripts/serve-projects.cmd`.
4. **If no browser path works**: say so on the FIRST line of your report ("не проверено в браузере: <reason>"). You may still list findings from reading the code, but mark each one "по коду, не проверено глазами" and never present code reading as a browser result. Return without inventing numbers.

Viewports to use unless the task says otherwise: 360x640, 320x568, 740x360 (phone sideways), 768, 1280x720, 1920.
