EXE = pngpaf

OBJS_EXE = RGBAPixel.o PNG.o main.o twoDtree.o stats.o

CXX = g++
CXXFLAGS = -std=c++11 -c -Wall -Wextra -pedantic 
LD = g++
LDFLAGS = -std=c++11 -lpthread -lm -llodepng
SRCS = src

all : $(EXE)

$(EXE) : $(OBJS_EXE)
	$(LD) $^ $(LDFLAGS) -o $@

#object files
RGBAPixel.o : $(SRCS)/util/RGBAPixel.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

PNG.o : $(SRCS)/util/PNG.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

stats.o : $(SRCS)/stats.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

twoDtree.o : $(SRCS)/twoDtree.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

main.o : $(SRCS)/main.cpp
	$(CXX) $(CXXFLAGS) $^ -o $@

clean :
	-rm -f *.o $(EXE)
