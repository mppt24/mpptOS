## mpptOS — AI agent instructions

This repository is small and currently contains only a `README.md` at the repo root. The README identifies the project as "mpptOS" and links the GitHub Pages site: https://mppt24.github.io/mpptOS.

These notes are intentionally minimal and focused on what is immediately discoverable. Follow the steps below when you are assigned a task in this repo.

1. Quick discovery (always run first)
   - Read `README.md` (root) to capture project intent and public site URL.
   - List files and branches to see where source code may live (examples below).

     Example (PowerShell):
     ```powershell
     git status
     git branch -a
     git log -n 5 --pretty=oneline
     gci -Recurse -File | select FullName
     ```

   - Search for common build manifests; if you find any, follow the conventional build; otherwise ask the human maintainer.
     - Files to look for: `package.json`, `pyproject.toml`, `requirements.txt`, `setup.py`, `Makefile`, `Dockerfile`, `index.html`, `src/`, `docs/`.

2. If you find a manifest, use these conditional rules (do not assume they exist):
   - package.json -> run `npm ci` then `npm run build` (or inspect `scripts` to choose the right script).
   - pyproject.toml / requirements.txt -> create a venv, `pip install -r requirements.txt`, run tests via `pytest` if present.
   - index.html and no build files -> repo may be a static site; verify `gh-pages` or `docs/` branch before changing.

3. Code and style conventions (discoverable patterns)
   - There are no source files currently. When adding code, prefer small, focused changes with tests and a short commit message describing intent.
   - Put site/static files in `docs/` when targeting GitHub Pages, or use `gh-pages` branch if the repo already uses it.

4. PR and commit guidance for AI agents
   - Make a single-purpose branch: `fix/<short-desc>` or `feat/<short-desc>`.
   - Include a short description and list of changed files in the PR body.
   - If you add a build step or CI, include a README update describing `how to build` and `how to run`.

5. When you can't find required files or the task is underspecified
   - Explicitly ask the maintainer for the following: preferred language/runtime, expected build commands, tests to run, and which branch is canonical for deployment (e.g., `master`, `main`, `gh-pages`).

6. Examples from this repo
   - `README.md` (root): project description and live site link. Use it as primary canonical documentation when no other files exist.

7. Safety and non-functional rules
   - Don't push breaking changes to `master`/`main` without tests and a human reviewer.
   - Avoid adding secrets or credentials; use placeholders and document where secrets should be supplied.

If any of the above sections are unclear or you find additional files (source directories, CI config, manifests), tell me what you found and I'll update these instructions to include concrete examples from those files.
