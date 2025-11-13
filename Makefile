all: clean build 

build: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project texbuilder:latest pdflatex christian_carrico.tex

clean: 
	rm -f *.log *.aux *.out *.pdf