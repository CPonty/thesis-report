
TEX := $(wildcard *.tex)

TEX_PDF := $(patsubst %.tex, %.pdf, $(TEX))

REFERENCES := references/bibliography.bib
DOC_AUX := thesis-report.aux
DOC_PDF := thesis-report.pdf
DOC_TEX := thesis-report.tex

# =====================================================================

%.pdf: %.tex
	pdflatex "$<" "$@"

open: all reopen

reopen:
	open -a /Applications/Skim.app $(DOC_PDF)

all: $(TEX_PDF) doc

#doc: $(REFERENCES)
doc: refs
	pdflatex $(DOC_TEX)
	pdflatex $(DOC_TEX)

refs:
	pdflatex $(DOC_TEX)
	bibtex $(DOC_AUX)
	pdflatex $(DOC_TEX)

single: $(DOC_PDF)

clean: clean_lite
	rm $(DOC_PDF) 2>/dev/null; exit 0

clean_lite:
	rm *.log *.lof *.lot *.toc *.out *.aux *.bbl *.bcf *.blg 2>/dev/null; exit 0

release: all clean_lite

