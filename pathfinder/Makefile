CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include
INCLUDE = -I${PATHFINDER}
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_pathfinder

HEADERS =
SOURCES = pathfinder.c $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, pathfinder.o $(FCUDA_GEN).o)

EXE = pathfinder.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS) $(CFLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) $(CFLAGS) -o $@

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) $(CFLAGS) -o $@

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
