CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include
INCLUDE = -I${MATMUL}

FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_matmul

HEADERS = matrixMul.h
SOURCES = matrixMul.cpp $(FCUDADIR)/$(FCUDA_GEN).c
OBJECTS = $(addprefix $(OBJDIR)/, matrixMul.o $(FCUDA_GEN).o)

EXE = matmul.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS) $(CFLAGS)

$(OBJDIR)/%.o: %.cpp $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) $(INCLUDE) -o $@ $(CFLAGS)

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
