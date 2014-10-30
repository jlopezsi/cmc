all: 

github:
	./knit github
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md -o seriationcombinatorics_github.md

md:
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md -o seriationcombinatorics.md

odt:
	./knit docx
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md --reference-odt=reference.odt -o seriationcombinatorics.odt


docx:
	./knit docx
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md --reference-docx=reference.docx -o seriationcombinatorics.docx


pdf:
	./knit pdf
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md --template=xelatex-rmarkdown-template.tex --latex-engine=xelatex -o seriationcombinatorics.tex --natbib
	latexmk -pdf seriationcombinatorics

epub:
	./knit epub
	pandoc -s -S --biblio seriationcombinatorics.bib seriationcombinatorics.md -o seriationcombinatorics.epub

bib:
	bibtool -s -d -x citations.aux ~/research/biblio/ct-proposal.bib > seriationcombinatorics.bib


clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md *.pdf *.docx seriationcombinatorics.tex *.epub
