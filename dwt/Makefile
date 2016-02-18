CPP = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include

FLAGS = -lm
INCLUDE = -I${DWT}

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_dwt

SOURCES = dwtHaar1D.c $(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, dwtHaar1D.o $(FCUDA_GEN).o)

EXE = dwt.exe

all: $(OBJECTS)
	$(CPP) $(OBJECTS) -o $(EXE) $(FLAGS) $(CFLAGS)

$(OBJDIR)/%.o: %.c
	$(CPP) $< -c $(FCUDA_IFLAG) $(INCLUDE) $(DFLAGS) -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(FCUDADIR)/%.c
	$(CPP) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(EXE) $(OBJDIR)

