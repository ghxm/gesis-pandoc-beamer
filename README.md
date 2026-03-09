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

### Background switching

Backgrounds cannot be changed via markdown alone. Mid-presentation background changes require raw LaTeX blocks that: (1) end the current frame, (2) call `\setbgimage{path}`, (3) start a dummy frame:

`````text
```{=latex}
% Change the background mid-slides
% end the last slide
\end{frame}

% change the background image
\mode<all>\setbgimage{path/to/image}

% start a new slide so that it will end when the next slide starts
\begin{frame}<0| handout:0>
```
`````

To avoid additional complexity when changing the background, stick to slide level 1, i.e. use `#` to add a new slide. If you want to use `#` to create a new section, you might need to adjust the code above to end the last block in addition to the frame and start a new one.

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
