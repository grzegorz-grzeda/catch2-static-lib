PROJ = catch2
EXT = lib

SRC = \
	main.cpp  
	
INC_DIR = \
	.

COMPILE_FLAGS = \
	--std=c++11

ARCHIVE_FLAGS = \
	rs

COMPILER = g++
ARCHIVER = ar
RM = rm

INCLUDES = $(patsubst %,-I%,$(INC_DIR))

OBJ = $(patsubst %.cpp, %.o, $(SRC))

%.o : %.cpp
	@echo Compiling $<
	@$(COMPILER) $(COMPILE_FLAGS) $(INCLUDES) -c $< -o $@

build: $(OBJ)
	@echo Creating library $(PROJ).$(EXT)
	@$(ARCHIVER) $(ARCHIVE_FLAGS) $(PROJ).$(EXT) $(OBJ)
	@$(RM) -f *.o

clean:
	@echo Cleaning the project
	@$(RM) -f *.$(EXT)