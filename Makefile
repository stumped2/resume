TARGET=resume

default: pdf


.PHONY: dvi
dvi: ${TARGET}.tex
	latex ${TARGET}.tex
	latex ${TARGET}.tex

.PHONY: ps
ps: dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

.PHONY: pdf
pdf: ps
	ps2pdf ${TARGET}.ps

clean:
	@rm -f ${TARGET}{.dvi,.ps,.out,.log,.aux,.c.tex,}
