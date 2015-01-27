doc:
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block \
		-w docx \
		-s -S -N \
		--csl ../../group/library.grp/apa.csl \
		--filter pandoc-citeproc \
		--reference-docx=../../group/library.grp/reference.docx \
		--bibliography=../../group/bibliography.grp/database.bib \
		--latexmathml \
		main.Rmd \
		--output=main.docx
	pandoc -r markdown\
		-w docx table1.Rmd -o table1.docx
	pandoc -r markdown\
		-w docx table2.Rmd -o table2.docx
	pandoc -r markdown\
		-w docx table3.Rmd -o table3.docx
	pandoc -r markdown\
		-w docx table4.Rmd -o table4.docx
	pandoc -r markdown\
		-w docx table5.Rmd -o table5.docx
	libreoffice main.docx

pdf:
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block \
		main.Rmd \
		-s -S -N \
		--csl=../../group/library.grp/apa.csl \
		--filter pandoc-citeproc \
		--latex-engine=pdflatex \
		--bibliography=../../group/bibliography.grp/database.bib \
		--output=main.pdf
	evince main.pdf

html:
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block \
		--latexmathml \
		-s -S -N \
		--template=../../group/library.grp/html.template \
		--filter pandoc-citeproc --csl=../../group/library.grp/apa.csl \
		--bibliography=../../group/bibliography.grp/database.bib \
		-output main.html
	firefox main.html
