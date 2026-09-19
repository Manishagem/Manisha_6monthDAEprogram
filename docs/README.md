# docs

Source for my portfolio website, **Manisha Gupta - IAM Engineer Portfolio**, published with GitHub Pages at:

https://manishagem.github.io/Manisha_6monthDAEprogram/

The site is a [Jekyll](https://jekyllrb.com/) site built on the **Minimal** theme (`pages-themes/minimal`). GitHub Pages is set up to serve it from this folder, so pushing a change to `main` updates the live site.

## Pages

| File | Page | Content |
|------|------|---------|
| `index.md` | Home | Welcome, headshot, and a summary of the six-month cohort, semester by semester. |
| `projects.md` | Projects | The Enterprise Identity Security Platform (EISP), the GoFit app, and the Roll-a-Die project. |
| `resume.md` | Resume | Professional summary, technical skills, and experience. |
| `about.md` | About | Background, learning journey, and career goals. |
| `contact.md` | Contact | Email, LinkedIn, and GitHub links. |
| `another-page.md` | Extra | A small placeholder page left over from the template. |

## Site configuration

`_config.yml` sets the site title and description, the theme (`pages-themes/minimal@v0.2.0` loaded through the `jekyll-remote-theme` plugin), and the navigation order in the header (`index`, `projects`, `resume`, `about`, `contact`).

## Folder layout

| Path | Purpose |
|------|---------|
| `assets/` | Site files: `img/` (headshot and logo), `css/` (`style.scss`), `js/` (`scale.fix.js`), `fonts/` (Noto Sans in several formats), and `manisha_gupta_resume.pdf`. |
| `_layouts/`, `_includes/`, `_sass/` | Page templates, reusable snippets, and style sheets inherited from the Minimal theme. |
| `docs/` | Theme project files: code of conduct, contributing guide, and support notes. |
| `script/` | Theme helper scripts for setup, build checks, and release. |
| `Gemfile`, `jekyll-theme-minimal.gemspec` | Ruby dependency files for building the site locally. |
| `LICENSE` | License for the Minimal theme. |
| `thumbnail.png` | Theme preview image. |
| `Manisha Gupta_Sr RPA Developer.pdf` | A resume PDF for a senior RPA developer role. |

## Editing the site

1. Edit the Markdown page you want to change (for example `projects.md`).
2. Commit and push to `main`.
3. GitHub Pages rebuilds the site, usually within a few minutes.

To preview locally you need Ruby and Bundler:

```bash
bundle install
bundle exec jekyll serve
```

Then open `http://localhost:4000`. The `github-pages` gem may need to be added to the `Gemfile` for a local build (see the Minimal theme documentation).

## Credits

Built on the [Minimal theme](https://github.com/pages-themes/minimal) for GitHub Pages. Site content is my own.
