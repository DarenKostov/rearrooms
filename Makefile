
# https://www.cs.colostate.edu/~cs157/LectureMakefile.pdf

CXX= g++
CXXFLAGS= -std=c++17
OBJFILES= bin/main.o bin/licence.o bin/mainClass.o
TARGET= bin/rearrooms


all: $(TARGET)


install: all
	cp $(TARGET) /usr/bin/

$(TARGET): bin $(OBJFILES)
	@echo FINAL BINARY:
	$(CXX) $(CXXFLAGS) $(OBJFILES) -o $(TARGET)
	
bin:
	mkdir bin

bin/main.o: src/main.cpp
	@echo MAIN CPP:
	$(CXX) $(CXXFLAGS) src/main.cpp -c -o bin/main.o

bin/licence.o: src/licence.cpp
	@echo LICENCE:
	$(CXX) $(CXXFLAGS) src/licence.cpp -c -o bin/licence.o
	


bin/mainClass.o: src/mainClass.cpp src/mainClass.h
	@echo MAIN CLASS:
	$(CXX) $(CXXFLAGS) src/mainClass.cpp -c -o bin/mainClass.o



clean:
	rm -f bin/*



.PHONY: clean install all


