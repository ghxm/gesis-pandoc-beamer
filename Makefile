.PHONY: all pandoc quarto rmarkdown test clean

PANDOC_FLAGS = -t beamer --pdf-engine=xelatex \
    --include-in-header=template/preamble.tex \
    --include-before-body=template/before-body.tex \
    --citeproc

all: pandoc quarto rmarkdown

pandoc:
	pandoc slides.md $(PANDOC_FLAGS) -o slides-pandoc.tex
	pandoc slides.md $(PANDOC_FLAGS) -o slides-pandoc.pdf

quarto:
	quarto render slides.md --to beamer --output slides-quarto.pdf

rmarkdown:
	Rscript -e "rmarkdown::render('slides.md', output_format = rmarkdown::beamer_presentation(keep_tex = TRUE, latex_engine = 'xelatex', includes = rmarkdown::includes(in_header = 'template/preamble.tex', before_body = 'template/before-body.tex')), output_file = 'slides-rmarkdown.pdf')"

test: all
	@echo "Checking pandoc output..."
	@test -s slides-pandoc.pdf || (echo "FAIL: slides-pandoc.pdf missing or empty" && exit 1)
	@grep -q '\\setbgimage' slides-pandoc.tex || (echo "FAIL: missing \\setbgimage in pandoc tex" && exit 1)
	@grep -q '\\defbeamertemplate' slides-pandoc.tex || (echo "FAIL: missing \\defbeamertemplate in pandoc tex" && exit 1)
	@grep -q 'metropolis' slides-pandoc.tex || (echo "FAIL: missing metropolis in pandoc tex" && exit 1)
	@echo "pandoc: OK"
	@echo "Checking quarto output..."
	@test -s slides-quarto.pdf || (echo "FAIL: slides-quarto.pdf missing or empty" && exit 1)
	@echo "quarto: OK"
	@echo "Checking rmarkdown output..."
	@test -s slides-rmarkdown.pdf || (echo "FAIL: slides-rmarkdown.pdf missing or empty" && exit 1)
	@echo "rmarkdown: OK"
	@echo "All tests passed."

clean:
	rm -f slides-pandoc.* slides-quarto.* slides-rmarkdown.*
