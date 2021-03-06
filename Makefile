cpp=g++
flag=-c -O2 -Iinclude -Wall
obj=inputOutput.o cell.o grid.o field.o matrix.o boundaryConditions.o

export path=.
bin=$(path)/bin
source=$(path)/source
include=$(path)/include

app: $(obj) simpleCFD.o
	mkdir -p $(bin)
	$(cpp) simpleCFD.o $(obj) -o bin/simpleCFD

simpleCFD.o: $(source)/simpleCFD.cpp
	$(cpp) $(flag) $(source)/simpleCFD.cpp

inputOutput.o: $(source)/inputOutput.cpp $(include)/inputOutput.hpp
	$(cpp) $(flag) $(source)/inputOutput.cpp

grid.o: $(source)/grid.cpp $(include)/grid.hpp
	$(cpp) $(flag) $(source)/grid.cpp

cell.o: $(source)/cell.cpp $(include)/cell.hpp
	$(cpp) $(flag) $(source)/cell.cpp

field.o: $(source)/field.cpp $(include)/field.hpp
	$(cpp) $(flag) $(source)/field.cpp

matrix.o: $(source)/matrix.cpp $(include)/matrix.hpp
	$(cpp) $(flag) $(source)/matrix.cpp

boundaryConditions.o: $(source)/boundaryConditions.cpp $(include)/boundaryConditions.hpp
	$(cpp) $(flag) $(source)/boundaryConditions.cpp
	
# leave just source code.
clean:
	rm -rf $(path)/*.o \#* *~ $(lib)/*.a $(bin)/simpleCFD
