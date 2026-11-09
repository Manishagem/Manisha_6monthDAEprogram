# Documentation & Assets

This directory contains the documentation and static site assets for the project. It is structured to support a Jekyll-based static site, including layouts, styles, and reusable components.

## Directory Structure

| Folder | Description |
| :--- | :--- |
| [`_includes`](./_includes/) | Reusable HTML snippets and partials. |
| [`_layouts`](./_layouts/) | Page templates and structural layouts. |
| [`_sass`](./_sass/) | Sass stylesheets for the site's theme. |
| [`assets`](./assets/) | Static assets (CSS, fonts, images, JS). |
| [`docs`](./docs/) | Core documentation, guidelines, and policies. |
| [`script`](./script/) | Utility scripts for CI, releases, and setup. |

## Quick Start

To work with the documentation site locally:

```bash
# Install dependencies (requires Ruby and Bundler)
bundle install

# Start the Jekyll development server
bundle exec jekyll serve
```

For more details on contribution, see [CONTRIBUTING.md](./docs/CONTRIBUTING.md).
