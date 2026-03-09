# GESIS Beamer Template for Pandoc

[**Preview**](slides.pdf)

This is a simple and unofficial markdown template for creating slides with pandoc and `beamer` in the GESIS presentation layout. It is based on the GESIS template for PowerPoint presentations. The template uses the `metropolis` theme for `beamer` with minor tweaks and custom background images. The `slides.md` file provides a starting point for creating a simple GESIS-themed presentation. All available backgrounds can be found in the `template/` folder.

## File structure

```
slides.md                  # The presentation file (edit this)
template/
  preamble.tex             # LaTeX preamble (backgrounds, colors, title page)
  before-body.tex          # LaTeX inserted before slide content
  background1-12.pdf       # Background images
_quarto.yml                # Quarto project config (for Quarto users)
library.bib                # BibTeX references
Makefile                   # Build targets for dev/testing
```

## Rendering

The template works with three toolchains. Pick whichever you prefer.

### Standalone pandoc

```bash
pandoc slides.md -t beamer --pdf-engine=xelatex \
  --include-in-header=template/preamble.tex \
  --include-before-body=template/before-body.tex \
  --citeproc -o slides.pdf
```

### Quarto

With `_quarto.yml` in the same directory:

```bash
quarto render slides.md --to beamer
```

### RMarkdown

```r
rmarkdown::render("slides.md",
  output_format = rmarkdown::beamer_presentation(
    keep_tex = TRUE,
    latex_engine = "xelatex",
    includes = rmarkdown::includes(
      in_header = "template/preamble.tex",
      before_body = "template/before-body.tex")),
  output_file = "slides.pdf")
```

## Usage notes

### Choosing background images

The template ships with 12 background images (`template/background1-12.pdf`). By default, the title slide uses `background3.pdf` and all other slides use `background8.pdf`.

To change the defaults, add `header-includes` to your YAML front matter:

```yaml
header-includes: |
    \newcommand{\titlebgimage}{template/background5.pdf}
    \newcommand{\defaultbgimage}{template/background1.pdf}
```

### Switching backgrounds mid-presentation

To change the background starting from the next slide, place `\switchbg{path}` on any slide:

```markdown
# Last content slide

Some content here.

\switchbg{template/background12.pdf}

# {.plain .c}

\color{white}
**Thank you!**
```

To switch back to the default background, use `\switchtodefaultbg`.

### Date format

Use ISO dates in the YAML front matter (`date: "2023-10-24"`). Pandoc and RMarkdown pass the string as-is. Quarto parses it and applies the display format set in `_quarto.yml` (`date-format: "DD.MM.YYYY"`).

### Section slides

To introduce a new section while keeping slide level 1:

````markdown
# {.plain}

\section{First section}
````

### References

If you do not use a "References" slide, remove the references frame entirely. The LaTeX compiler will throw an error if you try to include an empty list of references.

## TODO

- [ ] Adjust the font size and style to match the GESIS template
- [x] Add a custom title page without an `\hrule` and footer
- [x] Add all background options and adjust as used in the Powerpoint template
- [ ] Custom section background?
- [x] Put the includes in their own file and include that file in the YAML header
- [x] Add pure-pandoc + Quarto example files
