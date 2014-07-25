all: clean tocbibpdf

tocbibpdf: main.tex
	# generate toc
	pdflatex main.tex; \
	#echo "toc: done"; \
	# generate bib
	bibtex main; \
	#echo "bib: done"; \
	# generate pdf + bib
	pdflatex main.tex; \
	#echo "pdf+bib: done"; \	
	# generate pdf with toc and bib
	pdflatex main.tex; \
	echo "pdf+toc+bib: done";

clean_toc:
	# main.aux  main.log  main.out  main.pdf  main.tdo  main.tex  main.toc
	for ext in tdo toc; do \
		if [ -e main.$$ext ]; \
		then \
	   		rm main.$$ext; \
		fi; \
	done

clean_bib:
	# main.bbl main.blg
	for ext in bbl blg; do \
		if [ -e main.$$ext ]; \
		then \
            rm main.$$ext; \
        fi; \
    done

clean: clean_toc clean_bib
	# main.aux  main.log  main.out  main.pdf  main.tdo  main.tex  main.toc 
	for ext in aux log out pdf; do \
        if [ -e main.$$ext ]; \
        then \
            rm main.$$ext; \
        fi; \
    done

