CC = gcc
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${BACKPROP}
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_backprop

HEADERS = backprop.h
SOURCES = backprop.c backprop_cuda.c facetrain.c imagenet.c $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, backprop.o backprop_cuda.o facetrain.o imagenet.o $(FCUDA_GEN).o)

EXE = backprop.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@ -std=c99

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
