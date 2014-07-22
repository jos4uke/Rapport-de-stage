all: clean tocpdf

tocpdf: main.tex
	# generate toc
	pdflatex main.tex; \
	echo "toc: done"; \
	# genertae pdf with toc
	pdflatex main.tex; \
	echo "pdf+toc: done";

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

