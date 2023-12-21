import 'package:advent_2023/data/data_day1.dart';
import 'package:flutter/material.dart';

class Part2 {
  String loadedAsset = '';
  final reg1a = RegExp('one');
  final reg2a = RegExp('two');
  final reg3a = RegExp('three');
  final reg4a = RegExp('four');
  final reg5a = RegExp('five');
  final reg6a = RegExp('six');
  final reg7a = RegExp('seven');
  final reg8a = RegExp('eight');
  final reg9a = RegExp('nine');
  final reg0a = RegExp('zero');
  final reg1n = RegExp('1');
  final reg2n = RegExp('2');
  final reg3n = RegExp('3');
  final reg4n = RegExp('4');
  final reg5n = RegExp('5');
  final reg6n = RegExp('6');
  final reg7n = RegExp('7');
  final reg8n = RegExp('8');
  final reg9n = RegExp('9');
  final reg0n = RegExp('0');



  List<String> getDataFile() {
    loadedAsset = originalData;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

  // Create RegEx matcher for words to numbers
  List<String> extractAndStoreInOrder() {
    List<String> linesOfDataList = getDataFile();
    List<String> orderedNumChars = [];
    // extract each pattern and assign it an indexOf
    for (final line in linesOfDataList){
      int inOrder;
      String converted = '';
      Map<int, String> orderedNumberStrings = {};
      if(reg1a.hasMatch(line)){
        Iterable<RegExpMatch> matches = reg1a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '1';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg2a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg2a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '2';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg3a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg3a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '3';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg4a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg4a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '4';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg5a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg5a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '5';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg6a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg6a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '6';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg7a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg7a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '7';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg8a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg8a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '8';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg9a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg9a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '9';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg0a.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg0a.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '0';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg1n.hasMatch(line)){
        Iterable<RegExpMatch> matches = reg1n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '1';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg2n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg2n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '2';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg3n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg3n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '3';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg4n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg4n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '4';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg5n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg5n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '5';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg6n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg6n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '6';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg7n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg7n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '7';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg8n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg8n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '8';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg9n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg9n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '9';
          orderedNumberStrings[match.start] = converted;
        }
      }
      if(reg0n.hasMatch(line)) {
        Iterable<RegExpMatch> matches = reg0n.allMatches(line);
        for(RegExpMatch match in matches){
          converted = '0';
          orderedNumberStrings[match.start] = converted;
        }
      }
      // Flush the sorted Map so it doesn't keep adding pairs from every string.
      var sortedByKey = {};
      String voltron = '';
      // Sort by index and put the numbers back into the same order but as digits, but still as a String
      sortedByKey = Map.fromEntries(
        orderedNumberStrings.entries.toList()..sort((entry1, entry2) => entry1.key.compareTo(entry2.key)),);
      // Take just the values out of the map and put them into a single string to feed to create2DigitList
      voltron = sortedByKey.values.join();
      // Add the new combined number string to the List that is going to be returned.
      orderedNumChars.add(voltron);
    }
    return orderedNumChars;
  }



  
  // Feed that string to create2DigitList

  List<String> create2DigitList() {
    List<String> matchedPairs = [];
    List<String> linesOfDataList = extractAndStoreInOrder();
    for (final onlyNonLetters in linesOfDataList) {
      int lastPlace = onlyNonLetters.length - 1;
      String slot1 = onlyNonLetters[0];
      String slot2 = onlyNonLetters[lastPlace];
      matchedPairs.add('$slot1$slot2');
    }
    return matchedPairs;
  }

  Future<int> finalNumber2() async {
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
