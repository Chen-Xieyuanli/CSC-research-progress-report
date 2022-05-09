.PHONY : all latex bibtex view clean distclean small smaller tiny nonstop
# Change "paper" in the next line to the name of your document.
TARGET=rpr-letter
SOURCE=$(TARGET).tex

all: $(TARGET).pdf

$(TARGET).pdf: $(SOURCE)
	pdflatex -halt-on-error $(SOURCE)

clean:
	rm -f $(TARGET).aux $(TARGET).bbl $(TARGET).blg $(TARGET).log
	
distclean:clean
	rm -f $(TARGET).pdf


