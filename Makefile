
TEX := $(wildcard *.tex)
TEX_PDF := $(patsubst %.tex, %.pdf, $(TEX))

CLEANTYPES := *.log *.lof *.lot *.toc *.out *.aux *.bbl *.bcf *.blg *.acn *.acr *.alg \
	*.glo *.idx *.ilg *.ind *.ist

REFERENCES := references/bibliography.bib
DOC := thesis-report
RELEASE := 42345493_ponticello

# =====================================================================

%.pdf: %.tex
	pdflatex "$<" "$@"

open: all reopen

reopen:
	open -a /Applications/Skim.app $(DOC).pdf

all: $(TEX_PDF) doc

doc: refs single

single:
	pdflatex ${DOC}.tex

double:
	pdflatex $(DOC).tex
	pdflatex $(DOC).tex

refs:
	pdflatex $(DOC).tex
	bibtex $(DOC).aux
	makeindex -s $(DOC).ist -t $(DOC).alg -o $(DOC).acr $(DOC).acn
	pdflatex $(DOC).tex

clean: clean_lite
	rm $(DOC).pdf 2>/dev/null; exit 0

clean_lite:
	rm $(CLEANTYPES) 2>/dev/null; exit 0

o: reopen

1: single

2: double

c: clean

release: all clean_lite
	cp $(DOC).pdf $(RELEASE).pdf

