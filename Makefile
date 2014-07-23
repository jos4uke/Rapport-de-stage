all: clean tocbibpdf

tocbibpdf: main.tex
	# generate toc
	pdflatex main.tex; \
	echo "toc: done"; \
	# generate bib
	bibtex main; \
	echo "bib: done"; \
	# generate toc + bib
	#pdflatex main.tex; \
	#echo "toc+bib: done"; \	
	# generate pdf with toc and bib
	pdflatex main.tex; \
	echo "pdf+toc+bib: done";

clean_toc:
	# main.aux  main.log  main.out  main.pdf  main.tdo  main.tex  main.toc
	for ext in aux log pdf; do \
		if [ -e main.$$ext ]; \
		then \
	   		rm main.$$ext; \
		fi; \
	done

clean: 
	# main.aux  main.log  main.out  main.pdf  main.tdo  main.tex  main.toc 
	for ext in aux log out pdf tdo toc; do \
        if [ -e main.$$ext ]; \
        then \
            rm main.$$ext; \
        fi; \
    done

