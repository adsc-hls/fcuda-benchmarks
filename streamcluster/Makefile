CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${STREAMCLUSTER}

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_streamcluster

HEADERS = streamcluster_header.cpp define.h
SOURCES = streamcluster_cuda_cpu.cpp streamcluster_cuda.cpp $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, streamcluster_cuda_cpu.o streamcluster_cuda.o $(FCUDA_GEN).o)

EXE = streamcluster.exe

# link objects (binaries) together
all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) -lm

# compile function files into objects (binaries)
$(OBJDIR)/%.o: %.cpp $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

# delete all object and executable files
clean:
	rm -rf $(EXE) $(OBJDIR)
