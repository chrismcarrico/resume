all: clean build 

build: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project latex-container:latest pdflatex christian_carrico.tex

clean: 
	docker image rm --force latex-container:latest
	rm -f *.log *.aux *.out *.pdf