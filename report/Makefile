TARGET = qsys
CC = xelatex
CCFLAGS = -shell-escape -synctex=1 --interaction=nonstopmode
TEXFILES = $(wildcard *.tex)

all: $(TARGET).pdf

%.pdf:	$(TEXFILES) title/* files/*
	$(CC) $(CCFLAGS) $(TARGET)


.PHONY:	clean all spell
clean:
	rm -f $(TARGET).{pdf,log,aux,pyg}

spell:
	aspell -l el_gr --ignore-case=true -c $(TARGET).tex
