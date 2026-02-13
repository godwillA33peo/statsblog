# Stats Beneath Homepage Redesign — Instructions

## What these files do

You have 2 files to apply from the updates folder:

1. **index.qmd** — Replaces your current homepage. Uses `page-layout: full` and
   `sidebar: false` to suppress the default Quarto title block, author label, and
   categories sidebar. The hero section is the first thing visitors see.

2. **homepage.css** — Custom styles for the hero, articles listing, topics pills,
   newsletter CTA, and about teaser. Designed to work with your existing dark theme.

## Step-by-step

### 1. Back up your current files
```bash
cp index.qmd index.qmd.bak
```

### 2. Replace index.qmd
Copy the new `index.qmd` into your project root, replacing the existing one.

### 3. Add the CSS
Copy `homepage.css` into your project root (or wherever your other CSS files live).

### 4. Wire the CSS into _quarto.yml
In your `_quarto.yml`, under `format: html:`, add `homepage.css` to your css list.
For example, if you currently have:

```yaml
format:
  html:
    theme: darkly  # or whatever theme you use
    css: styles.css
```

Change it to:

```yaml
format:
  html:
    theme: darkly
    css:
      - styles.css
      - homepage.css
```

If you don't have a `css` field yet, just add one.

### 5. Trim the nav social icons (optional but recommended)
In `_quarto.yml`, under `website: navbar:`, reduce the right-side icons to just
GitHub, LinkedIn, and the search tool. Remove Twitter, RSS, and the eye/preview icon.

Example:
```yaml
website:
  navbar:
    right:
      - icon: github
        href: https://github.com/godwillA33peo
      - icon: linkedin
        href: ttps://www.linkedin.com/in/godwill-zulu/ 
      - text: ""
        icon: search
```

### 6. Preview
```bash
quarto preview
```

### 7. Deploy
```bash
quarto render
git add -A
git commit -m "Homepage redesign: hero-first, no sidebar/counters"
git push
```

## What changed vs. the old homepage

| Before | After |
|--------|-------|
| "Stats Beneath" title + "AUTHOR: Godwill" above hero | Suppressed — site name is already in nav |
| Categories sidebar (right column) | Removed — not useful with <5 articles |
| Stats counters (149 ZB, 1763, etc.) | Removed |
| "Did You Know?" section | Removed |
| Article listing below lots of decoration | Article listing directly after hero |
| 6 social icons in nav | 3 (GitHub, LinkedIn, Search) |
| Green hero banner below wasted space | Green hero banner is first content element |

## Troubleshooting

**Categories sidebar still shows:** Make sure `sidebar: false` and `categories: false`
are in the YAML front matter. Also check that `homepage.css` is loaded (the CSS has
`display: none !important` rules for sidebar elements as a fallback).

**Title block still shows:** The `title-block-banner: false` and absence of a `title:`
field (we use `pagetitle:` instead) should suppress it. If it still appears, add this
to your `_quarto.yml` under the page or format section:
```yaml
title-block-style: none
```

**Listing shows no articles:** Make sure your posts are in a `/posts` directory and
each has `draft: false` (or no draft field) in the YAML front matter.

**CSS not applying:** Check the browser dev tools console for 404 errors on homepage.css.
Make sure the path in `_quarto.yml` matches where you placed the file.
