all: brownianwebstrips.pdf

# The version with images
# This will end up in Paper/
Paper/brownianwebstrips.pdf:
	cd Paper; latex brownianwebstrips.tex
	cd Paper; dvips -o brownianwebstrips.ps brownianwebstrips.dvi
	cd Paper; ps2pdf brownianwebstrips.ps

brownianwebstrips.dvi: Paper/*.tex
	(cd Paper; latex -output-directory=.. brownianwebstrips.tex)

%.pdf: %.dvi
	dvipdf $<

%.dvi: %.tex
	latex $<

clean:
	rm -f *.aux *.dvi *.pdf *.log *~
	(cd Paper; rm -f *.pyc *.aux *.dvi *.pdf *.log *~)
