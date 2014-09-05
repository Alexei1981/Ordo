CC = gcc
CFLAGS = -DNDEBUG -flto -I myopt
WARN = -Wwrite-strings -Wconversion -Wshadow -Wparentheses -Wlogical-op -Wunused -Wmissing-prototypes -Wmissing-declarations -Wdeclaration-after-statement -W -Wall -Wextra
OPT = -O3
LIBFLAGS = -lm

EXE = ordo

SRC = myopt/myopt.c mystr.c proginfo.c pgnget.c randfast.c gauss.c groups.c cegt.c indiv.c encount.c ratingb.c rating.c xpect.c csv.c main.c 
DEPS = boolean.h  datatype.h  gauss.h  groups.h  mystr.h  mytypes.h  ordolim.h  pgnget.h  proginfo.h  progname.h  randfast.h  version.h myopt/myopt.h cegt.h indiv.h encount.h xpect.h csv.h ratingb.h rating.h
OBJ = myopt/myopt.o mystr.o proginfo.o pgnget.o randfast.o gauss.o groups.o cegt.o indiv.o encount.o ratingb.o rating.o xpect.o csv.o main.o

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

ordo: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(WARN) $(OPT) $(LIBFLAGS)

all:
	$(CC) $(CFLAGS) $(WARN) $(OPT) -o $(EXE) $(SRC) $(LIBFLAGS)

install:
	cp $(EXE) /usr/local/bin/$(EXE)

clean:
	rm -f *.o *~ myopt/*.o ordo-v*.tar.gz ordo-v*-win.zip *.out









