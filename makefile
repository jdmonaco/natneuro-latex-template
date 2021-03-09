#
# Example makefile for compiling a manuscript document
#

MAIN = main
VIEWER = skim

build: clean
	pdflatex -interaction=batchmode $(MAIN)
	bibtex -terse $(MAIN)
	pdflatex -interaction=batchmode $(MAIN)
	pdflatex -interaction=batchmode -synctex=1 $(MAIN)

view:
	open $(MAIN).pdf -a $(VIEWER)

clean:
	-rm *.{aux,out,log,bbl,blg,fls,fdb_latexmk,synctex.gz} */*.aux > /dev/null 2>&1
