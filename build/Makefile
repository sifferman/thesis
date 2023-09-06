
PDFLATEX := TEXINPUTS=../:../src:../dependencies/ucsb/sty: pdflatex -interaction=nonstopmode -halt-on-error
BIBTEX := BSTINPUTS=../dependencies/ucsb: BIBINPUTS=../src: bibtex

JUNK := *.pdf *.aux *.log *.bbl *.blg *.toc *.out *.fdb_latexmk *.fls *.synctex.gz

all: thesis

thesis:
	mkdir -p final
	mkdir -p chapters
	$(PDFLATEX) thesis
	$(BIBTEX) thesis
	$(PDFLATEX) thesis
	$(PDFLATEX) thesis

clean:
	rm -f ${JUNK}
