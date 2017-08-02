COMMONFORM=node_modules/.bin/commonform

all: terms.pdf

%.pdf: %.docx
	unoconv $<

terms.docx: terms.cform blanks.json | $(COMMONFORM)
	$(COMMONFORM) render -f docx -t "Terms of Use" -b blanks.json --left-align-title --indent-margins --number outline $< > $@
