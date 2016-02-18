NVCC := nvcc

SRC0 = main.cu
OBJ0 = main.o

SRC1 = parboil.c
OBJ1 = parboil.o

EXE = cp_cuda.exe

all: $(OBJ0) $(OBJ1)
	$(NVCC) $(OBJ0) $(OBJ1) -o $(EXE)

$(OBJ0): $(SRC0)
	$(NVCC) $(SRC0) -c -fmad=false -arch=sm_30

clean:
	rm -f *.o cp_cuda.exe cuda_output.txt
