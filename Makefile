COMMONFORM=node_modules/.bin/commonform

all: terms.pdf terms.json

%.pdf: %.docx
	unoconv $<

terms.docx: terms.cform blanks.json | $(COMMONFORM)
	$(COMMONFORM) render -f docx -t "Terms of Use" -b blanks.json --left-align-title --indent-margins --number outline $< > $@

terms.json: terms.cform | $(COMMONFORM)
	$(COMMONFORM) render -f native $< > $@
