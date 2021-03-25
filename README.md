# Presentation Template

This is my presentation template using pandoc to translate a markdown file called `slides.md` to HTML. The presentation
is created using the [`markdown-presentation` package](https://github.com/danrot/markdown-presentation).

## Prerequisites

- [pandoc](https://pandoc.org/installing.html) has to be installed and be available in the `PATH`
- The [`make`](https://www.gnu.org/software/make/) command has to be available in the `PATH`
- The [`dot`](https://www.graphviz.org/download/) command has to be available in the `PATH` as well if diagrams should
be generated

## Create the presentation

Building the presentation into a single self-contained HTML file is done by executing the following command:

```bash
make
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

Afterwards the other slides are defined. Every first and second level header will be its own slide.

```markdown
# Slide 1

## Slide 2

### Content on Slide 2
```

### Diagrams

Diagrams are automatically created using `dot` from the files ending with `.dot` in the `diagrams` folder. They are
placed as SVGs in the same `diagram` folder, but will have a `.svg` ending. By this name it can be included in the
presentation. So `diagrams/test.dot` will become `diagrams/test.dot.svg` and can be included in the `slides.md` file:

```markdown
![test](diagram/test.dot.svg)
```
