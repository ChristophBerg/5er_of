all: 5er_of.ps 5er_of.pdf

%.ps: %.dvi
	dvips  -o $@ $<

%.dvi: %.tex
	latex -src-specials=par,math $<
	makeindex 5er_of.idx
	latex -src-specials=par,math $<

%.pdf: %.tex %.dvi
	pdflatex -src-specials=par,math $<

fontproof: suitsymbols.mf
	mf '\mode:=proof; input suitsymbols'
	gftodvi suitsymbols.2602gf

clean:
	rm -f 5er_of.ps 5er_of.dvi 5er_of.pdf *.log *.aux *.toc *pk *.tfm
