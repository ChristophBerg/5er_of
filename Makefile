all: a4_all a5_all a6_all

dvionly: 5er_of_a4.dvi 5er_of_a5.dvi 5er_of_a6.dvi

a4_all: 5er_of_a4.ps 5er_of_a4.pdf
a5_all: 5er_of_a5.ps 5er_of_a5.pdf
a6_all: 5er_of_a6.ps 5er_of_a6.pdf

%.ps: %.dvi
	dvips  -o $@ $<

%.dvi: %.tex 5er_of.tex 5er_of_macros.tex 5er_of_params.tex
	latex -src-specials=par,math $<
	latex -src-specials=par,math $<
#	makeindex 5er_of.idx

%.pdf: %.tex %.dvi
	pdflatex -src-specials=par,math $<

fontproof: suitsymbols.mf
	mf '\mode:=proof; input suitsymbols'
	gftodvi suitsymbols.2602gf

clean:
	rm -f 5er_of_a4.ps 5er_of_a4.dvi 5er_of_a4.pdf 5er_of_a5.ps 5er_of_a5.dvi 5er_of_a5.pdf 5er_of_a6.ps 5er_of_a6.dvi 5er_of_a6.pdf *.log *.aux *.toc *pk *.tfm
