# Presentation Template

This is my presentation template using pandoc to translate a markdown file called `slides.md` to HTML. The presentation
is styled using CSS contained in the `slides.css` file. The `make` command is used to easily create a self-contained
HTML presentation, which means a single HTML file is enough to start the presentation from any machine.

## Prerequisites

- [pandoc](https://pandoc.org/installing.html) has to be installed and be available in the `PATH`
- The [make](https://www.gnu.org/software/make/) command has to be available in the `PATH`

## Create the presentation

Building the presentation into a single self-contained HTML file is done by executing the following command:

```bash
make html
```

## Customizing the presentation

This is just a project template, so it only contains boilerplate code, that can be changed as required. The following
sections explain each file in detail.

### slides.md

This file is written using [pandoc's flavour of markdown](https://pandoc.org/MANUAL.html#pandocs-markdown). The first
lines are information for the title slide of the presentation:


```markdown
% Title of the presentation
% Author of the presentation
% Date of the presentation
```

Afterwards the other slides are defined. Every second level header will 
