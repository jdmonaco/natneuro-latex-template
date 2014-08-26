#
# Example makefile for working with AutoTeXify in a LaTeX document
#

MAIN = main
VIEWER = skim
TEXIFY_INCL = --include="figures/Figures_*.png" --include="figures/SuppFigures_*.png"

build: clean
	pdflatex -interaction=batchmode $(MAIN)
	bibtex -terse $(MAIN)
	pdflatex -interaction=batchmode $(MAIN)
	pdflatex -interaction=batchmode -synctex=1 $(MAIN)

view:
	open $(MAIN).pdf -a $(VIEWER)

texify:
	autotexify $(TEXIFY_INCL) &

terminal:
	autotexify $(TEXIFY_INCL) --nonotify --viewer=none --nosync &

isrunning:
	[ -z `pgrep -f autotexify` ] && echo 'not running' || echo running: pid `pgrep -f autotexify`

stop:
	pkill -TERM -f autotexify

#
# Clean should only be done if AutoTeXify is stopped, otherwise it will
# notice the missing <main>.aux and recompile, generating more output
# files. This is the same reason there is not a "--clean-after" option:
# it would just recompile on the next check.
#

clean:
	-rm *.{aux,log,bbl,blg,fls,fdb_latexmk,synctex.gz} */*.aux > /dev/null 2>&1
