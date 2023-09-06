
BUILD_DIR := $(CURDIR)/build

PDFLATEX := TEXINPUTS=$(CURDIR):$(CURDIR)/src:$(CURDIR)/dependencies/ucsb/sty: \
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory ${BUILD_DIR}

BIBTEX := BSTINPUTS=$(CURDIR)/dependencies/ucsb: BIBINPUTS=$(CURDIR)/src: \
	bibtex

JUNK := *.pdf *.aux *.log *.bbl *.blg *.toc *.out *.fdb_latexmk *.fls *.synctex.gz

all: thesis

thesis:
	mkdir -p ${BUILD_DIR}/final
	mkdir -p ${BUILD_DIR}/chapters
	$(PDFLATEX) thesis
	cd ${BUILD_DIR} && $(BIBTEX) thesis
	$(PDFLATEX) thesis
	$(PDFLATEX) thesis

clean:
	rm -rf build
