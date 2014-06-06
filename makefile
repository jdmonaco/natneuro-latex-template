#
# Example makefile for working with AutoTeXify in a LaTeX document
#

PID = `pgrep -f autotexify`

texify:
	autotexify &

terminal:
	autotexify --nonotify --viewer=none --nosync &

isrunning:
	[ -z $(PID) ] && echo 'not running' || echo 'running: pid' $(PID)

stop:
	pkill -TERM -f autotexify

#
# Clean should only be done if AutoTeXify is stopped, otherwise it will
# notice the missing <main>.aux and recompile, generating more output
# files. This is the same reason there is not a "--clean-after" option:
# it would just recompile on the next check.
#

clean:
	-rm *.{aux,log,bbl,blg,synctex.gz} */*.aux > /dev/null 2>&1