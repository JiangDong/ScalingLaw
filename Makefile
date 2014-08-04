FLAG= -s -S --biblio fun.bib #如果需要其他的参数，可以添加到这后面 -N --toc 
#pandoc  -t slidy -s  -o $@ $<
#pandoc  -t dzslides --template default.dzslides -o $@ $<
#pandoc $(FLAG) --latex-engine xelatex -t beamer -o $@ $<

%.pdf : %.md
	pandoc $(FLAG) --latex-engine xelatex -o $@ $<

%.html : %.md
	pandoc $(FLAG)  -t revealjs -s -V theme=beige -o $@ $<

.PHONY: clean

clean:
	rm -f *.pdf *.html
