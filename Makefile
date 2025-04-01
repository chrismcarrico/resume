all: clean container pdf 

pdf: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project latex-container:latest pdflatex christian_carrico.tex

container:
	docker buildx build -t latex-container:latest .

clean: 
	docker image rm --force latex-container:latest
	rm -f *.log *.aux *.out *.pdf