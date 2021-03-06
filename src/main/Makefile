UNAME := $(shell uname)

GIT_REV  = $(shell git rev-parse HEAD || "unknown")
GIT_DATE = $(shell git show -s --format=%ci $(GIT_REV) || "unknown")
CXXDEFS  = -DGIT_REVISION="\"$(GIT_REV)\"" -DGIT_TIMESTAMP="\"$(GIT_DATE)\""

CXXWARN  = -Wall -Wextra -ansi -pedantic
CXXDEBUG = -g
CXXOPTIM = -O3
CXXLIBS  = -I ../lib 
CXXFLAGS = $(CXXDEFS) $(CXXWARN) $(CXXDEBUG) $(CXXOPTIM) $(CXXLIBS)
BINDIR   = ../../bin

ifeq ($(UNAME), Darwin)
LDFLAGS  = -lboost_filesystem-mt -lboost_system-mt
else
LDFLAGS  = -lboost_filesystem -lboost_system
endif

MAKEDEPEND= $(CXX) $(CXXFLAGS) -MM -MP -MT $(BINDIR)/$* -o $*.P $<

.PHONY:	all clean

.SUFFIXES:	.C

$(BINDIR)/% : %.C
	@$(MAKEDEPEND);
	$(CXX) $(CXXFLAGS) $< -o $@ $(LDFLAGS)


SRCS := $(wildcard *.C)

all:	$(BINDIR) $(SRCS:%.C=$(BINDIR)/%)

$(BINDIR):
	mkdir -p $(BINDIR)

clean:
	rm -f *.P

-include $(SRCS:.C=.P)
