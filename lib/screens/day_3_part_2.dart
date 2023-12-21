import 'package:advent_2023/data/data_day3.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AssignPositionsToValues {
  const AssignPositionsToValues(this.value, this.x, this.y);

  final int value;
  final int x;
  final int y;
}

class Coordinate {
  Coordinate(this.x, this.y);

  int x;
  int y;
}

class AssignPositionsToValuesAndAsterisks {
  // A gear is any * symbol that is adjacent to exactly two part numbers.
  // Its gear ratio is the result of multiplying those two numbers together.
  // Find the gear ratio of every gear and add them all
  const AssignPositionsToValuesAndAsterisks(
    this.value,
    this.x,
    this.y,
    this.asterX,
    this.asterY,
  );

  final int value;
  final int x;
  final int y;
  final int asterX;
  final int asterY;
}

class SetOfValuesWithPositions {
  SetOfValuesWithPositions(this.posVals);

  Set<AssignPositionsToValues> posVals = {};
  bool add(AssignPositionsToValues posVal) {
    if (posVals.contains(posVal)) {
      return false;
    }
    return posVals.add(posVal);
  }
}

class SetOfValuesAndAsterisks {
  SetOfValuesAndAsterisks(this.posVals);

  Set<AssignPositionsToValuesAndAsterisks> posVals = {};
  bool add(AssignPositionsToValuesAndAsterisks posVal) {
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

class Part6 {
  String loadedAsset = '';
  List<String> theXs = [];
  List<List<String>> linesOfXs = [];
  final RegExp regExAll =
      RegExp(r'\d|\*|\.|@|!|#|\$|%|\^|\&|\(|\)|\||_|-|\+|=|/|\?');
  final RegExp regOnlySymbols = RegExp(r'\*|\@|\#|\$|%|\&|\-|\+|\=|\/');
  final RegExp asterisksOnly = RegExp(r'\*');

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

  List<SetOfValuesWithPositions> identifiedNumberGroups(
      List<List<String>> data) {
    final List<List<String>> convertedDataset = data;
    final List<SetOfValuesWithPositions> completeValueSetsList = [];
    final int lengthX = convertedDataset.length;
    final int lengthY = convertedDataset[0].length;

    for (int y = 0; y < lengthX; y++) {
      for (int x = 0; x < lengthY; x++) {
        final String character = convertedDataset[y][x];
        // debugPrint('x: $x y: $y character: $character');
        if (isDigit(character)) {
          final int value = int.parse(character);
          final AssignPositionsToValues valWithXY =
              AssignPositionsToValues(value, x, y);
          SetOfValuesWithPositions currentSet = SetOfValuesWithPositions({});
          int lastInList = (completeValueSetsList.length - 1);
          if (completeValueSetsList.isEmpty) {
            currentSet.add(valWithXY);
            completeValueSetsList.add(currentSet);
          } else if (x - completeValueSetsList[lastInList].posVals.last.x <=
                  1 &&
              completeValueSetsList[lastInList].posVals.last.y == y) {
            completeValueSetsList[lastInList].add(valWithXY);
          } else if (x - completeValueSetsList[lastInList].posVals.last.x > 1 ||
              completeValueSetsList[lastInList].posVals.last.y < y) {
            currentSet.add(valWithXY);
            completeValueSetsList.add(currentSet);
          }
        }
      }
    }
    return completeValueSetsList;
  }

  List<SetOfValuesAndAsterisks> filterListToOnlyValuesWithAdjacentAsterisks(
      List<SetOfValuesWithPositions> setsOfPosVals, List<List<String>> grid) {
    List<SetOfValuesAndAsterisks> keepThese = [];

    for (var setOfNumbers in setsOfPosVals) {
      int firstX = setOfNumbers.posVals.first.x;
      int lastX = setOfNumbers.posVals.last.x;
      int onlyY = setOfNumbers.posVals.first.y;
      bool aSymbolExists = false;
      Coordinate coordinate = Coordinate(0, 0);
      List<Coordinate> xy = [];
      for (int y = onlyY - 1; y <= onlyY + 1; y++) {
        for (int x = firstX - 1; x <= lastX + 1; x++) {
          try {
            if (!(y == 0 && (x >= firstX && x <= lastX))) {
              if (grid[y][x].contains(asterisksOnly)) {
                aSymbolExists = true;
                coordinate.x = x;
                coordinate.y = y;
                xy.add(coordinate);
              }
            }
          } catch (error) {
            debugPrint('I do not care, it does not matter.');
          }
        }
      }
      if (aSymbolExists) {
        final AssignPositionsToValues valWithXY =
            processNumberSequence(setOfNumbers);
        for (var coordinate in xy) {
          final AssignPositionsToValuesAndAsterisks valAndAstPos =
              AssignPositionsToValuesAndAsterisks(
            valWithXY.value,
            valWithXY.x,
            valWithXY.y,
            coordinate.x,
            coordinate.y,
          );
          final SetOfValuesAndAsterisks tempset = SetOfValuesAndAsterisks({});
          tempset.add(valAndAstPos);
          keepThese.add(tempset);
        }
      }
    }
    return keepThese;
  }

  AssignPositionsToValues processNumberSequence(
      SetOfValuesWithPositions setOfValuesWithPositions) {
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
    AssignPositionsToValues voltron = AssignPositionsToValues(
        valueCollection, firstXCoordinate, firstYCoordinate);
    return voltron;
  }

// At this point it SHOULD have every complete value that is next to an asterisk with that value saved, even if there are multiple asterisks.
// Now we need to compare asterisk values and find pairs of numbers that have that same asterisk coordinate.

  int multiplyPairsThenSum(List<SetOfValuesAndAsterisks> listOfSets) {
    List<AssignPositionsToValuesAndAsterisks> listOfAsterisks =
        listOfSets.expand((set) => set.posVals).toList();

    final grouped = groupBy<AssignPositionsToValuesAndAsterisks, int>(
        listOfAsterisks, (astSet) => astSet.asterX * 100 + astSet.asterY);

// Keeping this section as it is a good example of how to flatten out all the grouped objects back to a single list, but in order.
    final matchingObjects = grouped.values
      .where((group) => group.length > 1) // Only include groups with multiple objects
      .expand((group) => group)
      .toList();
    final matchingObjects2 = grouped.values
      .where((group) => group.length == 2) // Only include groups with multiple objects
      .expand((group) => group)
      .toList();
    
    debugPrint('Matched Objects > 1 ${matchingObjects.length.toString()}');
    debugPrint('Matched Objects == 2 ${matchingObjects2.length.toString()}');

    List<int> multSavedList = [];
    // ignore: avoid_function_literals_in_foreach_calls
    grouped.values.forEach((group) {
      if (group.length == 2) {
        final multipliedValue =
            group.fold<int>(1, (product, astVal) => product * astVal.value);
        multSavedList.add(multipliedValue);
      }
    });

    

    //   debugPrint('${each.asterX.toString()} ${each.asterY.toString()} ${each.value.toString()}');

    return multSavedList.sum;
  }

  int grindGears() {
    List<List<String>> schematic = theConverter();
    List<SetOfValuesWithPositions> sequentialNumbers =
        identifiedNumberGroups(schematic);
    List<SetOfValuesAndAsterisks> justWhatWeNeed =
        filterListToOnlyValuesWithAdjacentAsterisks(
            sequentialNumbers, schematic);
    return multiplyPairsThenSum(justWhatWeNeed);
  }
}

// First number returned is too high. 15042851169
// Changed group.length > 1 to group.length == 2, number returned is 82655993, this one is too low.
