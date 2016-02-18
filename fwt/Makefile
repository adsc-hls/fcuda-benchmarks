CPP = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include
INCLUDE = -I$(FWT)
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_fwt

SOURCES = fastWalshTransform.c $(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, fastWalshTransform.o $(FCUDA_GEN).o)

EXE = fwt.exe

all: $(OBJECTS)
	$(CPP) $(OBJECTS) -o $(EXE) $(FLAGS) $(CFLAGS)

$(OBJDIR)/%.o: %.c
	$(CPP) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(FCUDADIR)/%.c
	$(CPP) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(EXE) $(OBJDIR)

