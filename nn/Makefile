CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${NN}
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_nn

HEADERS = nn.h
SOURCE_NN = nn_cuda.cpp $(FCUDADIR)/$(FCUDA_GEN).c
SOURCE_HU = hurricane_gen.c
OBJECT_NN = $(addprefix $(OBJDIR)/, nn_cuda.o $(FCUDA_GEN).o)
OBJECT_HU = $(addprefix $(OBJDIR)/, hurricane_gen.o)

EXE_NN = nn.exe

EXE_HU = hurricane_gen.exe

all: $(EXE_NN) $(EXE_HU)

$(EXE_NN): $(OBJECT_NN)
	$(CC) $(OBJECT_NN) -o $(EXE_NN) $(FLAGS)

$(EXE_HU): $(OBJECT_HU)
	$(CC) $(OBJECT_HU) -o $(EXE_HU) $(FLAGS)

$(OBJDIR)/%.o: %.cpp $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJECT_NN): | $(OBJDIR)

$(OBJECT_HU): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE_NN) $(EXE_HU) $(OBJDIR)
