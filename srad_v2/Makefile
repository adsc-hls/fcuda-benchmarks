CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${SRAD_V2}
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_srad_v2

HEADERS = srad.h
SOURCES = srad.c $(FCUDADIR)/$(FCUDA_GEN).c
#OBJECTS = $(addprefix $(OBJDIR)/, srad.o $(FCUDA_GEN1).o $(FCUDA_GEN2).o)
OBJECTS = $(addprefix $(OBJDIR)/, srad.o $(FCUDA_GEN).o)

EXE = srad_v2.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJECTS): | $(OBJDIR)
$(OBJDIR):
	mkdir -p $(OBJDIR)
clean:
	rm -rf  $(EXE) $(OBJDIR)


