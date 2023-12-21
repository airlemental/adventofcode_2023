import 'package:advent_2023/data/data_day1.dart';
import 'package:flutter/material.dart';

class Part1 {
  String loadedAsset = '';

  List<String> getDataFile() {
    loadedAsset = originalData;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

  List<String> create2DigitList() {
    List<String> matchedPairs = [];
    List<String> linesOfDataList = getDataFile();
    for (final line in linesOfDataList) {
      String onlyNonLetters = line.replaceAll(RegExp(r'[^0-9]'), '');
      int lastPlace = onlyNonLetters.length - 1;
      String slot1 = onlyNonLetters[0];
      String slot2 = onlyNonLetters[lastPlace];
      matchedPairs.add('$slot1$slot2');
    }
    return matchedPairs;
  }

  Future<int> finalNumber() async {
    int theTotal = 0;
    List<String> pairOfNumList = await create2DigitList();
    for (final numString in pairOfNumList) {
      int numFromString = int.parse(numString);
      theTotal = theTotal + numFromString;
    }
    debugPrint(theTotal.toString());
    return theTotal;
  }

  

  
}
