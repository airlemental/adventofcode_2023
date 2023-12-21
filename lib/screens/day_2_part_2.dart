import 'dart:developer';
import 'package:collection/collection.dart';
import 'package:advent_2023/data/data_day2.dart';

class Part4 {

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

  List<int> savedPower = [];

  int finalNumber4() {
    List<Map<String, dynamic>> games = gamesLinesConverted();
    for (var game in games) {
      final int gameNumber = game['gameID'];
      final Map<String, dynamic> oneWholeLineOfGames = game['cubes'];
      final List<Map<String, dynamic>> indexedGrabs = [];
      oneWholeLineOfGames.forEach((key, value) {
        final Map<String, dynamic> oneFistfulOfCubes = {};
        oneFistfulOfCubes[key] = value;
        indexedGrabs.add(oneFistfulOfCubes);
      });
      
      
      int maxRed = 0;
      int maxGreen = 0;
      int maxBlue = 0;

      for (var indexedGrab in indexedGrabs) {
        indexedGrab.forEach((indexNumber, grab) {
          grab.forEach((keyColor, cubeCount) {
            // save the highest number for each color
            if(keyColor == 'red' && cubeCount > maxRed){maxRed = cubeCount;}
            if(keyColor == 'green' && cubeCount > maxGreen){maxGreen = cubeCount;}
            if(keyColor == 'blue' && cubeCount > maxBlue){maxBlue = cubeCount;}
            
          });
        });
      }
      // Multiply red, green, blue highest values together
      // Add the multiplies totals together.
      int power = maxRed * maxGreen * maxBlue;
      savedPower.add(power);
    }
    return savedPower.sum;
  }

}

// what is the fewest number of cubes of each color that could have been in the bag to make the game possible?

// Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
// In game 1, the game could have been played with as few as 4 red, 2 green, and 6 blue cubes. If any color had even one fewer cube, the game would have been impossible.
// Game 2 could have been played with a minimum of 1 red, 3 green, and 4 blue cubes.
// Game 3 must have been played with at least 20 red, 13 green, and 6 blue cubes.
// Game 4 required at least 14 red, 3 green, and 15 blue cubes.
// Game 5 needed no fewer than 6 red, 3 green, and 2 blue cubes in the bag.
// The power of a set of cubes is equal to the numbers of red, green, and blue cubes multiplied together. The power of the minimum set of cubes in game 1 is 48. In games 2-5 it was 12, 1560, 630, and 36, respectively. Adding up these five powers produces the sum 2286.

// For each game, find the minimum set of cubes that must have been present. What is the sum of the power of these sets?



// int doTheMath = cubeCount - colorMaxValues[keyColor]!.toInt();
//             if(doTheMath > 0){
//               log('OMFG');
//             }
//             if (cubeCount > colorMaxValues[keyColor]!.toInt() && !fail.contains(gameNumber)) {
//               fail.add(gameNumber);
//             }