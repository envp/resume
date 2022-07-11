REPOROOT:=$(shell pwd)

DOCKERARGS=
DOCKERARGS+=--rm
DOCKERARGS+=-v $(shell realpath ${REPOROOT})/src/:/latex

PDFIN:=resume.tex
PDFOUT_BASENAME:=$(subst .tex,,${PDFIN})

container:
	docker build -t builder -f Dockerfile ${REPOROOT}

pdf: container
	docker run ${DOCKERARGS} builder pdflatex -jobname ${PDFOUT_BASENAME} /latex/${PDFIN}

clean:
	rm -fv src/*.aux
	rm -fv src/*.log
	rm -fv src/*.out
	rm -fv src/*.pdf
