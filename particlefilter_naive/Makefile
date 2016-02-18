CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${PARTICLEFILTER_NAIVE}
FLAGS = -lm

OBJDIR = objs
FCUDADIR= fcuda_gen
FCUDA_GEN = fcuda_gen_particlefilter_naive

HEADERS = device_func.h
SOURCES = ex_particle_CUDA_naive_seq.c device_func.c $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, ex_particle_CUDA_naive_seq.o device_func.o $(FCUDA_GEN).o)

EXE = particlefilter_naive.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@ $(FLAGS)

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@ $(FLAGS)

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
