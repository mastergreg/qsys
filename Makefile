TARGET = qsyssim
CC = g++
CCFLAGS +=
OPT = 3

DEBUG = "n"

ifeq ($(DEBUG),"y")
	CCFLAGS += -D$(TARGET)_DEBUG=1 -D$(TARGET)
	CCFLAGS += -g -O0 -Werror -Wall -Wextra -Wuninitialized
else
	CCFLAGS += -D$(TARGET)_DEBUG=0 -D$(TARGET)
	CCFLAGS += -O$(OPT) -Werror -Wall
endif

CCFILES += $(wildcard *.cpp)
OBJ +=  $(patsubst %.cpp,%.o,$(CCFILES))
DEPENDS += $(wildcard *.h) 


all: $(TARGET)

$(TARGET): $(OBJ) $(DEPENDS)
	$(CC) $(OBJ) -o $(TARGET)

%.o:	%.cpp
	$(CC) -c $(CCFLAGS) $< -o $@


.PHONY:	clean all indent tags
clean:
	rm -f $(OBJ) $(TARGET)
indent:
	astyle --style=linux $(CCFILES)
tags:
	ctags -R *
