CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN=fcuda_gen_gaussian

HEADERS =
SOURCES = gaussian.c $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, gaussian.o $(FCUDA_GEN).o)

EXE = gaussian.exe

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
