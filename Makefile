TARGET=resume

default:
	make pdf

.PHONY: dvi
dvi: ${TARGET}.tex
	latex ${TARGET}.tex
	latex ${TARGET}.tex

.PHONY: ps
ps:
	make dvi
	dvips -R -Poutline -t letter ${TARGET}.dvi -o ${TARGET}.ps

.PHONY: pdf
pdf: ps
	ps2pdf ${TARGET}.ps
	make clean

clean:
	@rm -f ${TARGET}.dvi
	@rm -f ${TARGET}.ps
	@rm -f ${TARGET}.log
	@rm -f ${TARGET}.out
	@rm -f ${TARGET}.aux
