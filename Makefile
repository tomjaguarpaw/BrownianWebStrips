all: brownianwebstrips.pdf

brownianwebstrips.dvi: Paper/*.tex
	(cd Paper; latex -output-directory=.. brownianwebstrips.tex)

%.pdf: %.dvi
	dvipdf $<

%.dvi: %.tex
	latex $<

clean:
	rm -f *.aux *.dvi *.pdf *.log *~
	(cd Paper; rm -f *.pyc *.aux *.dvi *.pdf *.log *~)
