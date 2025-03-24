all: clean container pdf 

pdf: 
	docker run -u $(shell id -u):$(shell id -g) -v .:/project latex-container:latest pdflatex main.tex

container:
	docker buildx build -t latex-container:latest .

clean: 
	docker image rm latex-container:latest
	rm *.log *.aux *.out *.pdf