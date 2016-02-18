CC = g++
FCUDA_IFLAG = -I${FROOT}/include -I${FROOT}/include/cuda_include -I${LUD}
FLAGS = -lm

OBJDIR = objs
FCUDADIR = fcuda_gen
FCUDA_GEN = fcuda_gen_lud

HEADERS = lud.h
OBJECTS = $(addprefix $(OBJDIR)/, lud.o $(FCUDA_GEN).o common.o)

EXE = lud.exe

all: $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) -o $(EXE) $(FLAGS)

$(OBJDIR)/%.o: %.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: $(FCUDADIR)/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJDIR)/%.o: common/%.c $(HEADERS)
	$(CC) $< -c $(FCUDA_IFLAG) -o $@

$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf  $(EXE) $(OBJDIR)
