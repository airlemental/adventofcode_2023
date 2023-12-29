import 'package:advent_2023/data/data_day3.dart';
import 'package:flutter/material.dart';

class AssignPositionsToValues {
  // This Model class stores the value of a number along with its x and y coordinates.
  const AssignPositionsToValues(this.value, this.x, this.y);

  final int value;
  final int x;
  final int y;
}

class SetOfValuesWithPositions {
  // This class stores a set of AssignPositionsToNumbers objects and prevents duplicates based on their values.
  SetOfValuesWithPositions(this.posVals);

  Set<AssignPositionsToValues> posVals = {};
  bool add(AssignPositionsToValues posVal) {
    if (posVals.contains(posVal)) {
      return false;
    }
    return posVals.add(posVal);
  }
}

class Pair<T1, T2, T3> {
  final T1 first;
  final T2 second;
  final T3 third;

  const Pair(this.first, this.second, this.third);
}

class Part5 {
  String loadedAsset = '';
  List<String> theXs = [];
  List<List<String>> linesOfXs = [];
  final RegExp regExAll = RegExp(r'\d|\*|\.|@|!|#|\$|%|\^|\&|\(|\)|\||_|-|\+|=|/|\?');
  final RegExp regOnlySymbols = RegExp(r'\*|\@|\#|\$|%|\&|\-|\+|\=|\/');

  List<String> getDataFile() {
    loadedAsset = day3data;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

  List<List<String>> theConverter() {
    List<String> flatData = getDataFile();
    for (var line in flatData) {
      theXs = line.split('').toList();
      linesOfXs.add(theXs);
    }
    return linesOfXs; // A List of Rows comprised of each character on a line saved into a List itself. A List of Lists.
  }

  bool isDigit(String character) {
    bool thisIsANumber = false;
    if (character.contains(RegExp(r'[0-9]'))) {
      thisIsANumber = true;
    }
    return thisIsANumber;
  }


  List<SetOfValuesWithPositions> identifiedNumberGroups(List<List<String>> data) {
    final List<List<String>> convertedDataset = data;
    final List<SetOfValuesWithPositions> completeValueSetsList = [];
    final int lengthX = convertedDataset.length;
    final int lengthY = convertedDataset[0].length;

    for(int y = 0; y < lengthX; y++) {
      for(int x = 0; x < lengthY; x++) {
        final String character = convertedDataset[y][x];
        // debugPrint('x: $x y: $y character: $character');
        if (isDigit(character)) {
          final int value = int.parse(character);
          final AssignPositionsToValues valWithXY = AssignPositionsToValues(value, x, y);
          SetOfValuesWithPositions currentSet = SetOfValuesWithPositions({});
          int lastInList = (completeValueSetsList.length - 1);
          if (completeValueSetsList.isEmpty) {
            currentSet.add(valWithXY);
            completeValueSetsList.add(currentSet);
          } else if (x - completeValueSetsList[lastInList].posVals.last.x <= 1
            && completeValueSetsList[lastInList].posVals.last.y == y
            ) { 
              completeValueSetsList[lastInList].add(valWithXY);
          } else if (x - completeValueSetsList[lastInList].posVals.last.x > 1
            || completeValueSetsList[lastInList].posVals.last.y < y
            ) { 
            
            currentSet.add(valWithXY);
            completeValueSetsList.add(currentSet);
          }
        }
      }
    }
    return completeValueSetsList;
  }


  List<SetOfValuesWithPositions> filterListToOnlyValuesWithAdjacentSymbols(
    List<SetOfValuesWithPositions> setsOfPosVals, 
    List<List<String>> grid) {
      // final int rows = grid.length;
      // final int columns = grid[0].length;
      List<SetOfValuesWithPositions> keepThese = [];

      for(var setOfNumbers in setsOfPosVals){
        int firstX = setOfNumbers.posVals.first.x;
        int lastX = setOfNumbers.posVals.last.x;
        int onlyY = setOfNumbers.posVals.first.y;
        bool aSymbolExists = false;
        // String capturedSymbol = '';
        for (int y = onlyY - 1; y <= onlyY + 1; y++) {
          for (int x = firstX - 1; x <= lastX + 1; x++) {
            // debugPrint('y: $y    x: $x  num: ${setOfNumbers.posVals.first.value} on line: $onlyY  beginX: $firstX  endX: $lastX');
            try {
              if(!(y == 0 && (x >= firstX && x <= lastX))){
                if(grid[y][x].contains(regOnlySymbols)){
                  aSymbolExists = true;
                  // capturedSymbol = grid[y][x];
                }
              } 
            } catch (error) {
              debugPrint('Looked off the grid');
            }
          }
        }
        if(aSymbolExists){
          final AssignPositionsToValues valWithXY = processNumberSequence(setOfNumbers);
          final SetOfValuesWithPositions tempset = SetOfValuesWithPositions({});
          tempset.add(valWithXY);
          // String printValue = (tempset.posVals.first.value).toString();
          // String lineNum = (tempset.posVals.first.y).toString();
          // String linePos = (tempset.posVals.first.x).toString();
          // debugPrint('On line $lineNum at position $linePos value $printValue located by $capturedSymbol');
          keepThese.add(tempset);
        }
      }
      return keepThese;
  }


  AssignPositionsToValues processNumberSequence(SetOfValuesWithPositions setOfValuesWithPositions) {
    int valueCollection = 0;
    int firstXCoordinate = -10;
    int firstYCoordinate = -10;
    for (final position in setOfValuesWithPositions.posVals) {
      if (firstXCoordinate == -10) {
        firstXCoordinate = position.x;
        firstYCoordinate = position.y;
      }
      valueCollection = valueCollection * 10 + position.value;
    }
    AssignPositionsToValues voltron = AssignPositionsToValues(valueCollection, firstXCoordinate, firstYCoordinate);
    return voltron;
}


  int processNumberSets(List<SetOfValuesWithPositions> numberSets) {
    int sum = 0;
    for (final set in numberSets) {
      sum = sum + set.posVals.first.value;
    }
    return sum;
  }





  Future<int> solvePuzzle() async {
    List<List<String>> schematic = theConverter();
    // Initialize a 2D array to store sum of adjacent "important" numbers
    // final int yCoords = schematic.length;
    // final int xCoords = schematic[0].length;
    // final List<List<int>> xyGrid = List.generate(yCoords, (_) => List.filled(xCoords, 0));
    List<SetOfValuesWithPositions> sequentialNumbers = identifiedNumberGroups(schematic);
    List<SetOfValuesWithPositions> justWhatWeNeed = filterListToOnlyValuesWithAdjacentSymbols(sequentialNumbers, schematic);
    return processNumberSets(justWhatWeNeed);

  }

}





    

                // int adjacentRow = onlyY + y;
            // int columnInFront = firstX + x;
            // int columnAfter = lastX + x;
            // if (adjacentRow >= 0 && adjacentRow < rows && columnInFront >= 0 && columnAfter < columns) {
            //   if(grid[adjacentRow][columnInFront].contains(regOnlySymbols)){
            //     aSymbolExists = true;
            //   }
            //   if(grid[adjacentRow][columnAfter].contains(regOnlySymbols)){
            //     aSymbolExists = true;
            //   }
            // }


  // Iterate through the grid
    // for (int row = 0; row < yCoords; row++) {
    //   for (int col = 0; col < xCoords; col++) {
    //     // Check if current cell is adjacent to any symbol
    //     if (isSymbolAdjacent(row, col, sequentialNumbers, schematic)) {
    //       // Add the current number to the sum
    //       // xyGrid[row][col] += int.parse(schematic[row][col]); // This can't work when you don't split/parse out non integers

    //       // Add the sum of adjacent "important" numbers
    //       for (final adjacentRowCol
    //           in getAdjacentCells(row, col, yCoords, xCoords)) {
    //         int adjacentRow = adjacentRowCol[0];
    //         int adjacentCol = adjacentRowCol[1];
    //         if (isSymbolAdjacent(adjacentRow, adjacentCol, schematic)) {
    //           xyGrid[row][col] += xyGrid[adjacentRow][adjacentCol];
    //         }
    //       }
    //     }
    //   }
    // }

      // List<List<int>> getAdjacentCells(int row, int col, int rows, int columns) {
  //   final List<List<int>> adjacentCells = [];

  //   // Add all surrounding cells within bounds
  //   for (int i = -1; i <= 1; i++) {
  //     for (int j = -1; j <= 1; j++) {
  //       int adjacentRow = row + i;
  //       int adjacentCol = col + j;
  //       if (adjacentRow >= 0 &&
  //           adjacentRow < rows &&
  //           adjacentCol >= 0 &&
  //           adjacentCol < columns &&
  //           !(i == 0 && j == 0)) {
  //         adjacentCells.add([adjacentRow, adjacentCol]);
  //       }
  //     }
  //   }
  //   return adjacentCells;
  // }


              //   for (final existingSet in completeValueSetsList){ // completeValueSetsList = [0: {value: 4, x: 16, y:0}];
              //   if(existingSet.add(valWithXY)){ // existingSet = {{value: 4, x: 16, y:0}, {value: 5, x: 17, y:0}};
              //     currentSet = existingSet; // currentSet = {{value: 4, x: 16, y:0}, {value: 5, x: 17, y:0}, {value: 8, x: 18, y:0}};
              //     break;
              //   }
              // }


// Removed because I don't see that it is needed. There should never be a point where the process gets here without a currentSet having the current valWithXY

    // currentSet will be either a new valWithXY OR it will be multiples from existingSet
    // if(!currentSet.contains(valWithXY)){ // currentSet = [{value: 4, x: 16, y:0}, {value: 5, x: 17, y:0}];
    //   currentSet = SetOfValuesWithPositions({}); // currentSet = ({});
    //   currentSet.add(valWithXY); // currentSet = [{value: 5, x: 17, y:0}];
    //   completeValueSetsList.add(currentSet); // completeValueSetsList =  [{value: 4, x: 16, y:0}, {value: 5, x: 17, y:0}];
    // }


// void main() {
//   // Example puzzle grid
//   final List<List<String>> grid = [
//     ["4", "6", "7", ".", ".", "1", "1", "4", ".", "."],
//     [".", ".", ".", "*", ".", ".", ".", ".", ".", "."],
//     ["..", "3", "5", ".", ".", "6", "3", "3", ".", "."],
//     [".", ".", ".", ".", ".", ".", ".", ".", "#", "."],
//     ["6", "1", "7", "*", ".", ".", ".", ".", ".", "."],
//     [".", ".", ".", "+", ".", "5", "8", ".", ".", "."],
//     ["..", "5", "9", "2", ".", ".", ".", ".", ".", "."],
//     [".", ".", ".", ".", "7", "5", "5", ".", ".", "."],
//     ["..", "$.", "*", ".", ".", ".", ".", ".", ".", "."],
//     [".", "6", "6", "4", ".", "5", "9", "8", ".", "."],
//   ];

//   final int totalSum = solvePuzzle(grid);
//   print(totalSum); // Output: 655
// }

  


// This code implements the dynamic programming approach described above. It iterates through the grid and stores the sum of adjacent "important" 
//    numbers for each cell. The final sum is retrieved from the bottom right corner cell of the dp array.

// Techniques and algorithms for solving the given puzzle:

// Technique	            Small Grids	Medium Grids	  Large Grids
// Dynamic Programming	  Excellent	  Excellent	      Excellent
// Graph Traversal	      Good	      Good	          Moderate
// Divide and Conquer	    Good	      Good	          Good
// Brute Force	          Good	      Moderate	      Not recommended
// Recursive Backtracking	Moderate	  Not recommended	Not recommended


// Ordering the techniques by their suitability for Dart:
// Dynamic Programming: This is the most suitable technique for Dart, as it offers a good balance of efficiency and memory usage. 
//    Dart's built-in map data structure is well-suited for storing the 2D array used in dynamic programming. Additionally, 
//    Dart's efficient garbage collection helps manage memory usage effectively.
// Graph Traversal: This approach is also suitable for Dart, especially for smaller grids. 
//    Dart provides libraries like dart:collection and graphlib that facilitate efficient graph creation and traversal. 
//    However, for larger grids, the memory overhead of maintaining the graph data structure might outweigh the benefits.
// Divide and Conquer: This technique can be implemented efficiently in Dart using recursion or iterative approaches. 
//    It's a good option for larger grids where splitting into smaller sub-grids can simplify the problem and improve performance.
// Brute Force: While this is the simplest approach, it's not the most recommended for Dart, especially for larger grids. 
//    While Dart handles iteration efficiently, the time complexity of brute force grows exponentially with the grid size, making it impractical for large puzzles.
// Recursive Backtracking: This approach can be implemented in Dart, but it's not the most efficient or recommended option, 
//    especially for large grids. The recursive nature of the algorithm can lead to performance issues and stack overflows for larger problems.

