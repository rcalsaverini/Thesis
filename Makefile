continuous:
	@pywatch "make -B main.pdf | grep 'Warning\|!|I found no' " *.tex ./tex/*tex ./confs/*.tex ./tex/apendices/*.tex ./tex/pretext/*.tex

main.pdf:
	-@pdflatex -interaction=nonstopmode main.tex
	-@pdflatex -interaction=nonstopmode main.tex
	@bibtex main
	@pdflatex -interaction=nonstopmode main.tex
	
clean:
	cd ./tex; $(RM) *.dvi *.toc *.bbl *.blg *.swp *.aux *.idx *.lof *.log *.out *~
	cd ./tex/apendices; $(RM) *.dvi *.toc *.bbl *.blg *.swp *.aux *.idx *.lof *.log *.out *~
	cd ./tex/pretex; $(RM) *.dvi *.toc *.bbl *.blg *.swp *.aux *.idx *.lof *.log *.out *~
	cd ./confs; $(RM) *.dvi *.toc *.bbl *.blg *.swp *.aux *.idx *.lof *.log *.out *~

