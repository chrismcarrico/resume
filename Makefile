all: clean pdf 

pdf: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project latex-container:latest pdflatex main.tex

clean: 
	rm *.log *.aux *.out *.pdf