# CLAUDE.md — Stats Beneath Blog (statsbeneath.com)

A Quarto-based site with two sections:

1. **Stats Beneath** — weekly statistics posts explaining the foundations of ML (audience: data scientists, ML practitioners)
2. **Notes** — a general personal blog for observations on AI, learning, tech, and daily life (audience: general public, no stats background required)

Claude assists with detection, editing, and publishing for both sections.

---

## Project Structure

```
statsblog/
  posts/                          # weekly stats posts
    _template/                    # base template for new posts
    01-why-stats-matter/
    02-random-variables-distributions/
    03-expected-value-loss-functions/
    04-likelihood-mle/            # published 2026-03-06
  notes/                          # general personal blog
    01-ai-laptops-2026/           # first note (draft)
  _quarto.yml
  index.qmd
  notes.qmd                       # notes listing page
  about.qmd
  archive.qmd
  styles.css
  homepage.css
  CNAME
```

---

## Weekly Monday Workflow

Every Monday, Claude should run the following routine automatically when
invoked, or when the user says anything like "check posts", "check notes",
"what's new", or "what needs publishing":

### Step 1 — Scan for unpublished content (BOTH sections)

**Stats posts:** Look in `posts/` for any subfolder that:
- Does NOT appear in `_site/posts/` (not yet rendered), OR
- Has a modified `index.qmd` more recent than its rendered HTML

**Notes:** Look in `notes/` for any subfolder that:
- Does NOT appear in `_site/notes/` (not yet rendered), OR
- Has a modified `index.qmd` more recent than its rendered HTML, OR
- Has `draft: true` in its YAML frontmatter

Flag everything found. Example output:
```
Found 1 unpublished stats post:
  posts/05-bayesian-inference/  (not yet rendered)

Found 1 unpublished note:
  notes/01-ai-laptops-2026/  (draft: true)

Proceed with review? [yes/no]
```

If nothing is found, say so and stop.

### Step 2 — Review against the relevant writing rules

Apply **Stats Writing Rules** to posts in `posts/`.
Apply **Notes Writing Rules** to posts in `notes/`.
These are different rule sets — see both sections below.

### Step 3 — Report issues, wait for approval before fixing

### Step 4 — After approval, render and confirm

For a stats post:
```bash
quarto render posts/<folder-name>/index.qmd
```
Confirm output appears in `_site/posts/<folder-name>/index.html`.

For a note:
```bash
quarto render notes/<folder-name>/index.qmd
```
Confirm output appears in `_site/notes/<folder-name>/index.html`.

### Step 5 — Update listings and site index
```bash
quarto render
```

---

## Stats Writing Rules (enforced on every post in `posts/` before publishing)

### Typography — HARD RULES

- **NO em dashes** (`—`). Always replace with one of:
  - A comma
  - A colon
  - Two sentences
  - WRONG: "The prior updates — given the data — to a posterior."
  - RIGHT: "Given the data, the prior updates to a posterior."
- **NO en dashes** (`–`) used in place of em dashes
- **NO Unicode ellipsis** (`…`) — use three plain dots `...`
- **NO curly/smart quotes** inside code blocks — straight quotes only
- Hyphens (`-`) only for compound adjectives: "well-specified model"

### Voice & Style

- Plain, direct English — like a knowledgeable colleague, not a textbook
- Audience: data scientists and ML practitioners who want statistical depth
- Every post must connect theory to a concrete ML use case
- Build from simple to complex: scalar case before matrix case
- Define every symbol the first time it appears — no dangling notation

### Post Structure (required)

Every `index.qmd` must have this YAML frontmatter:
```yaml
---
title: ""
date: YYYY-MM-DD
categories: []         # e.g. [Bayesian, Foundations, ML]
description: ""        # 1-2 sentence teaser for the listing page
image: ""              # path to cover image (optional but encouraged)
---
```

Required sections in this order:
1. **Hook** — a question, surprising fact, or motivation (before any equations)
2. Body with `##` and `###` headers only (never `#` in post body)
3. **Key Takeaways** — bullet list, maximum 5 items, at the end

### Mathematical Content

- Every equation must be followed by a plain-English sentence explaining it
- Use `$...$` for inline math, `$$...$$` for display math
- No equation should appear without its variables first being defined in prose

### Code

- All code in R unless the post explicitly covers Python
- Stan code blocks: use ` ```stan ` fencing
- Every block must be self-contained (include `library()` calls)
- Comment the *why*, not the *what*

### Series Continuity (Foundations Series)

Posts follow this narrative arc:
```
01 → Why stats matter for ML
02 → Random variables and distributions
03 → Expected value and loss functions
04 → Likelihood and MLE          ← current frontier
```

When editing or creating a post, verify:
- Notation is consistent with prior posts (`theta` for parameters, `L` for likelihood)
- Each post references the previous one where relevant
- The arc is respected — don't jump ahead conceptually

---

## Notes Writing Rules (enforced on every note in `notes/` before publishing)

Notes are general-audience writing: observations, opinions, reflections. No
statistics background is assumed. No equations. No series continuity.

### Typography — same HARD RULES as stats posts

- **NO em dashes** (`—`). Replace with a comma, colon, or two sentences.
- **NO en dashes** (`–`) used in place of em dashes
- **NO Unicode ellipsis** (`…`) — use three plain dots `...`
- **NO curly/smart quotes** — straight quotes only throughout

### Voice & Style

- Conversational, honest, direct — like a journal entry or a well-argued opinion piece
- Audience: general public. No jargon without explanation.
- First-person perspective is expected and encouraged
- One clear point per note. Do not try to cover everything.
- Can be opinionated. Should not be preachy.

### Note Structure (required)

Every `notes/*/index.qmd` must have this YAML frontmatter:
```yaml
---
title: ""
date: YYYY-MM-DD
categories: []         # e.g. [AI, Education, Opinion]
description: ""        # 1-2 sentence teaser shown in the notes listing
draft: true            # set to false when ready to publish
---
```

Required structure:
1. Open with a concrete observation or scene — something real, not an abstract thesis
2. Body with `##` headers only if the note is long enough to need them (short notes need no headers)
3. No "Key Takeaways" section. End naturally.

### What Notes Must NOT Contain

- Equations or mathematical notation
- R or Python code blocks
- References to other Stats Beneath posts (notes stand alone)
- "In conclusion" or similar closing phrases

### Flagging for Author Review (notes-specific)

Raise a warning and wait for instruction when:
- Any sentence exceeds 40 words
- A paragraph exceeds 150 words
- The note reads more like a stats post than a personal observation
- The note has no clear point of view

---

## .gitignore Rules

The `.gitignore` should ensure that **only what the site needs to run** is
pushed to GitHub. Raw source files (`.qmd`, `.Rmd`, `.R`, `.stan`, `.rds`,
figures used only locally) should NOT be pushed.

Update `.gitignore` to include the following:

```gitignore
# R project artefacts
/.quarto/
.Rproj.user
.Rhistory
.RData
.Ruserdata
*.Rproj

# Quarto freeze cache
/_freeze/

# Raw post source files — do not push to remote
# NOTE: posts/*.qmd are excluded because the QMD is a working draft; the
# rendered _site/ output is the canonical published artefact.
# notes/*.qmd are NOT excluded — the QMD is the only source for notes.
posts/**/*.qmd
posts/**/*.Rmd
posts/**/*.R
posts/**/*.stan
posts/**/*.jags
posts/**/*.rds
posts/**/*.RData
posts/**/data/
posts/**/raw/
posts/**/_targets/

# Local figures not needed by site (only _site/ figures are needed)
posts/**/figures/
posts/**/img/

# Template folder — internal only
posts/_template/

# macOS
.DS_Store

# Node / npm (if any JS tooling used)
node_modules/

# Rendered site is built on deploy — exclude from source tracking
# (only keep if you are NOT using CI/CD to build)
# _site/

# Quarto notebook artefacts
**/*.quarto_ipynb
```

> NOTE: If you deploy via Netlify or GitHub Pages with a build step, you can
> also add `_site/` to `.gitignore` and let the CI build it. If you push the
> built site directly, keep `_site/` tracked but exclude everything else above.

---

## Things Claude Must Never Do Without Asking

Applies to both stats posts and notes:

- Rewrite the author's core argument or restructure sections
- Add new content not in the original draft
- Change YAML categories or the post date
- Push or deploy anything — only render locally and report

Stats posts only:
- Remove equations (flag for clarity review instead)
- Add examples or derivations not already in the draft

---

## Repository

GitHub: https://github.com/godwillA33peo/statsblog
Remote: `origin` → `https://github.com/godwillA33peo/statsblog.git`

All commits must be authored as **Godwill Zulu** (`godwillzulu51@gmail.com`).
Claude must never commit under its own name. Git identity is set globally:
```
user.name  = Godwill Zulu
user.email = godwillzulu51@gmail.com
```

To push from WSL, the credential helper must be set:
```bash
git config --global credential.helper "/mnt/c/Program Files/Git/mingw64/bin/git-credential-manager.exe"
```

---

## Render and Deploy Commands

```bash
# Preview locally
quarto preview

# Render one stats post
quarto render posts/<folder-name>/index.qmd

# Render one note
quarto render notes/<folder-name>/index.qmd

# Render full site (posts + notes + all listing pages)
quarto render

# Deploy to GitHub Pages (statsbeneath.com)
cmd.exe /c "quarto publish gh-pages --no-prompt"
```

---

## Flagging for Author Review — Stats Posts (do not auto-fix)

Raise a warning and wait for instruction when:
- Any sentence exceeds 40 words
- More than 3 equations appear in a row without explanatory prose
- A paragraph exceeds 150 words
- A statistical claim could be contested or is field-specific
- The post breaks series continuity (jumps ahead, skips a concept)

See also: Notes-specific flagging rules in the **Notes Writing Rules** section above.
