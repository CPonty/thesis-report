
DOC := statement

CLEANTYPES := *.log *.lof *.lot *.toc *.out *.aux *.bbl *.bcf *.blg *.acn *.acr *.alg \
	*.glo *.idx *.ilg *.ind *.ist

# =====================================================================

open: all reopen

reopen:
	open -a /Applications/Skim.app $(DOC).pdf

all:
	pdflatex $(DOC).tex

clean: clean_lite
	rm $(DOC).pdf 2>/dev/null; exit 0

clean_lite:
	rm $(CLEANTYPES) 2>/dev/null; exit 0

release: all clean_lite
