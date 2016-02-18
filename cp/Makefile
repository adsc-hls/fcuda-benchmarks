CC = gcc
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include
INCLUDE = -I${CP}

FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_cp

HEADERS = cuenergy.h
SOURCES = parboil.c main.c $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, parboil.o main.o $(FCUDA_GEN).o)

EXE = cp.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS) $(CFLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
