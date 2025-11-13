all: clean build 

build: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project texbuilder:0.1.0 pdflatex carrico_resume.tex

clean: 
	rm -f *.log *.aux *.out *.pdf