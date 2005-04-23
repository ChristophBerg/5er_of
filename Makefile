all: 5er_of.ps

%.dvi: %.tex
	latex -src-specials=par,math $<
	latex -src-specials=par,math $<

clean:
	rm -f 5er_of.ps 5er_of.dvi *.log *.aux *.toc
