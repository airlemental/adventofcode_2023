import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:advent_2023/data/data_day2.dart';

class Part3 {
  // Pull in all the Game Data
  String loadedAsset = '';

  List<String> getDataFile() {
    loadedAsset = day2data;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

  List<Map<String, dynamic>> gamesLinesConverted() {
    List<String> gameLine = getDataFile();
    List<Map<String, dynamic>> games = [];
    Map<String, Map<String, int>> indexedGrabsMap = {};

    for (String game in gameLine) {
      String gameKey = '';
      gameKey = game.split(':').first;
      int gameID = 0;
      gameID = int.parse(gameKey.split(' ').last);
      String allGames = ''; // Place to store the String with just the colors and counts
      allGames = game.split(':').last;
      List<String> eachGrab = [];
      eachGrab = allGames.split(';');
      int grabIndex = 0;
      indexedGrabsMap = {};
      for (String grab in eachGrab) {
        // " 2 red, 11 blue, 4 green;"
        List<String> listOfSetsPerGame = [];
        listOfSetsPerGame = grab.split(',');
        Map<String, int> newMapForEachGrab = {}; // add each grab to this map with the grab number as the key
        for (String kvpSet in listOfSetsPerGame) {
          // " 2 red"
          kvpSet = kvpSet.trimLeft(); // "2 red" get rid of the extra space at the beginning
          int cubeCount = int.parse(kvpSet.split(' ').first);
          String cubeColor = kvpSet.split(' ').last;
          newMapForEachGrab[cubeColor] = cubeCount;
        }
        indexedGrabsMap["$grabIndex"] = newMapForEachGrab;
        grabIndex++;
      }
      games.add({'gameID': gameID, 'cubes': indexedGrabsMap});
    }
    return games;
  }

  int finalNumber3() {
    // Go through each line and determine if these criteria are violated...
    //    only 12 red cubes, 13 green cubes, and 14 blue cubes
    // Add the combined total of the possible Game Line numbers.
    // Save the line number of the Game if none of those maximums are violated
    Set<int> pass = {};
    Set<int> fail = {};
    final colorMaxValues = {'red': 12, 'green': 13, 'blue': 14};
    List<Map<String, dynamic>> games = gamesLinesConverted();
    int runNo = 0;
    for (var game in games) {
      final int gameNumber = game['gameID'];
      final Map<String, dynamic> oneWholeLineOfGames = game['cubes'];
      final List<Map<String, dynamic>> indexedGrabs = [];

      oneWholeLineOfGames.forEach((key, value) {
        final Map<String, dynamic> oneFistfulOfCubes = {};
        oneFistfulOfCubes[key] = value;
        indexedGrabs.add(oneFistfulOfCubes);
      });

      // Begin Processing Indexed Grab Sections
      for (var indexedGrab in indexedGrabs) {
        indexedGrab.forEach((indexNumber, grab) {
          grab.forEach((keyColor, cubeCount) {
            // int doTheMath = cubeCount - colorMaxValues[keyColor]!.toInt();
            // if(doTheMath > 0){
            //   log('$doTheMath is > 0');
            // }
            if (cubeCount > colorMaxValues[keyColor]!.toInt() && !fail.contains(gameNumber)) {
              fail.add(gameNumber);
            }
          });
        });
      }
    }
    for(int game = 1; game <= 100; game++){
      if(!fail.contains(game)){
        pass.add(game);
      }
    }
    // log('Passed: ${pass.toString()}');
    // log('Failed: ${fail.toString()}');
    return pass.sum;
  }
}



            // if (cubeCount <= colorMaxValues[keyColor]!.toInt()) {

            //   pass.add(gameNumber);
            // }


            // bool tooManyCubes = false;
              // tooManyCubes = true;
              // tooManyCubes = true;

            // log('GameID: $gameNumber | runNo $runNo | indexNumber $indexNumber | grabNo $grabNo');
// log('$runNo $tooManyCubes $doTheMath GameID: $gameNumber Index: $indexNumber Color: $keyColor has $cubeCount cubes. Max allowed ${colorMaxValues[keyColor]}');
            // if (!tooManyCubes && !pass.contains(gameNumber)) {
            //   pass.add(gameNumber);
            // } else if (tooManyCubes && !fail.contains(gameNumber)) {
            //   fail.add(gameNumber);
            // }
