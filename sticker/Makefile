
DOC_PDF := sticker.pdf
DOC_TEX := sticker.tex

#%.pdf: %.tex
#	pdflatex "$<" "$@"

open: all reopen

reopen:
	open -a /Applications/Skim.app $(DOC_PDF)

all:
	pdflatex $(DOC_TEX)

clean: clean_lite
	rm $(DOC_PDF) 2>/dev/null; exit 0

clean_lite:
	rm *.log *.lof *.lot *.toc *.out *.aux *.bbl *.bcf *.blg 2>/dev/null; exit 0

release: all clean_lite
