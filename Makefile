
BUILD_DIR := $(CURDIR)/build

PDFLATEX := TEXINPUTS=$(CURDIR):$(CURDIR)/src:${BUILD_DIR}/dependencies/ucsb/sty: \
	pdflatex -interaction=nonstopmode -halt-on-error -output-directory ${BUILD_DIR}

BIBTEX := BSTINPUTS=${BUILD_DIR}/dependencies/ucsb: BIBINPUTS=$(CURDIR)/src: \
	bibtex

JUNK := *.pdf *.aux *.log *.bbl *.blg *.toc *.out *.fdb_latexmk *.fls *.synctex.gz


.PHONY: all thesis patch clean

all: clean thesis

thesis: patch
	mkdir -p ${BUILD_DIR}/final
	mkdir -p ${BUILD_DIR}/chapters
	${PDFLATEX} thesis
	cd ${BUILD_DIR} && $(BIBTEX) thesis
	${PDFLATEX} thesis
	${PDFLATEX} thesis

patch: dependencies.patch
	mkdir -p ${BUILD_DIR}
	rm -rf ${BUILD_DIR}/dependencies
	cp -ra dependencies ${BUILD_DIR}/dependencies
	cd ${BUILD_DIR} && patch -p0 < ../dependencies.patch

clean:
	rm -rf build
