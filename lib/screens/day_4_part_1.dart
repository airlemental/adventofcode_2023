import 'package:advent_2023/data/data_day4.dart';

class Part7 {
  int lotteryScore = 0;

  String loadedAsset = '';

  List<String> getDataFile() {
    loadedAsset = day4data;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

// Suggested approach is a 'Memoization Table'
  List<int> howManyMatched() {
    List<String> flatData = getDataFile();
    List<int> matchesCountInAList = [];
    for (var line in flatData) {
      final removeCard = line.split(":");
      final leftRight = removeCard[1].split(" | ");
      final group1 = leftRight[0].split(RegExp(r"\s+")).where((element) => element.isNotEmpty).map(int.parse).toList();
      final group2 = leftRight[1].split(RegExp(r"\s+")).where((element) => element.isNotEmpty).map(int.parse).toList();

      List<int> compareAndSave(){
        List<int> matched = [];
        for(int win in group1){
          for(int have in group2){
            if(win == have){
              matched.add(win);
            }
          }
        }
        return matched;
      }

      // final matchesTable = List.filled(group1.length + 1, List.filled(group2.length + 1, 0));

      // int countMatches(int i, int j) {
      //   if (matchesTable[i][j] > 0) return matchesTable[i][j]; // Memoization

      //   if (i == 0 || j == 0) {
      //     matchesTable[i][j] = 0;
      //   } else if (group1[i - 1] == group2[j - 1]) {
      //     matchesTable[i][j] = 1 + countMatches(i - 1, j - 1);
      //   } else {
      //     matchesTable[i][j] = max(countMatches(i - 1, j), countMatches(i, j - 1));
      //   }
      //   return matchesTable[i][j];
      // }

      // final numberOfMatches = countMatches(group1.length, group2.length);

      // debugPrint("Number of matching values: $numberOfMatches");

      final numberOfMatches = compareAndSave().length;
      matchesCountInAList.add(numberOfMatches);
    }
    // for(var match in matchesCountInAList){
    //   debugPrint("Claims to be a match -> $match");
    // }
    return matchesCountInAList;
  }

  int doubleByHowManyMatched(){
    int calculateDoubledCount(int count) {
      return 1 << (count-1); // geometric progression with a common ratio of 2
    }
    List<int> initialCountsList = howManyMatched();
    for(int i = 1; i <= initialCountsList.length; i++){
      // debugPrint("Line $i has ${initialCountsList[i-1]} matches");
    }
    int score = 0;
    for(int next in initialCountsList){
      if(next > 0){
        score = score + calculateDoubledCount(next);
      }
    }
    return score;
  }

  Future<int> theLottery() async {
    lotteryScore = doubleByHowManyMatched();
    return lotteryScore;
  }
}

// First calculation that arrived: 219 -> That's not the right answer; your answer is too low.
// Second calculation that arrived: 438 -> changed return 1 << (count -1) to just (count) -> your answer is too low.
// Third change, brute force comparison 46882 -> That's not the right answer; your answer is too high.
// Fourth Change, Geometric Progression changed back to (count - 1) 23441 -> That's the right answer! You are one gold star closer to restoring snow operations. 
