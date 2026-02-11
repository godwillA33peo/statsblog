# Stats Beneath 🔍

**Statistics simplified — the foundations beneath AI and machine learning.**

A weekly blog explaining statistical concepts in plain language, built with [Quarto](https://quarto.org).

🌐 **Live at**: [statsbeneath.com](https://statsbeneath.com)

## Quick Start

### Prerequisites
- [R](https://cran.r-project.org/)
- [Positron](https://positron.posit.co/)
- [Quarto](https://quarto.org/docs/get-started/) (bundled with Positron)

### Run locally
```bash
git clone https://github.com/YOUR_USERNAME/stats-beneath.git
cd stats-beneath
quarto preview
```

### Write a new post
```bash
cp -r posts/_template posts/02-your-topic
# Edit posts/02-your-topic/index.qmd
# Change draft: true → draft: false when ready
quarto preview
```

### Deploy
```bash
git add .
git commit -m "New post: Your Title"
git push
quarto publish gh-pages
```

## Project Structure
```
stats-beneath/
├── _quarto.yml            # Site configuration
├── styles.css             # Custom brand styling
├── index.qmd              # Home page (hero, stats, blog listing)
├── about.qmd              # Author bio
├── archive.qmd            # All articles table view
├── learning-path.qmd      # Guided 12-week curriculum timeline
├── cheatsheets.qmd        # Quick reference cards per topic
├── did-you-know.qmd       # Fun facts, paradoxes, quotes
├── resources.qmd          # Curated books, courses, tools, datasets
├── images/                # Logo, favicon, profile pic
└── posts/
    ├── _template/         # Copy for each new post
    └── 01-why-stats-matter/
```

## Site Pages

| Page | Purpose |
|------|---------|
| **Home** | Hero banner, fun fact, stats counters, latest articles |
| **Articles** | Searchable archive of all posts |
| **Learning Path** | 12-week visual timeline — guided curriculum |
| **Cheat Sheets** | One-page reference cards per topic |
| **Did You Know?** | Fun facts, paradoxes, quotes, data science stats |
| **Resources** | Books, courses, tools, communities, datasets |
| **About** | Author bio and contact links |

## Content Calendar
| Week | Topic | Category |
|------|-------|----------|
| 1 | Why Statistics Matters Before ML | foundations |
| 2 | What Data Actually Is | foundations |
| 3 | Mean, Median, Mode — When Averages Lie | descriptive-stats |
| 4 | Variance & Standard Deviation | descriptive-stats |
| 5 | The Normal Distribution | distributions |
| 6 | Probability Basics | probability |
| 7 | Sampling & the Population | inference |
| 8 | Hypothesis Testing & P-Values | inference |
| 9 | Correlation ≠ Causation | relationships |
| 10 | Linear Regression | regression |
| 11 | Matrices | linear-algebra |
| 12 | From Regression to ML | machine-learning |

## License
Content © 2026 Godwil. Code examples are MIT licensed.
