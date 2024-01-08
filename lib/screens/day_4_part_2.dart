import 'package:advent_2023/data/data_day4.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ScratchCard extends Equatable {
  ScratchCard(this.cardNumber, this.matches, this.instances);
  final int cardNumber;
  final int matches;
  int instances;

  ScratchCard copyWith({
    int? cardNumber,
    int? matches,
    int? instances,
  }) {
    return ScratchCard(
      cardNumber ?? this.cardNumber, 
      matches ?? this.matches, 
      instances ?? this.instances,
    );
  }
  @override
  List<Object?> get props => [cardNumber, matches, instances];
}

class Part8 {
  String loadedAsset = '';

  List<String> getDataFile() {
    loadedAsset = day4data;
    List<String> dataLines = loadedAsset.split('\n');
    return dataLines;
  }

// Object of this is to find just the number of cards, no scores or numbers from the cards.
// Need to check each card for the number of matches, and keep every card with that number.
// For every card that isn't zero, add 1 of each card after it per amount matched.
    // This will be { card no, match score, instances of card }

  List<ScratchCard> allTheCardsAndMatchesList() {
    List<String> flatData = getDataFile();
    List<ScratchCard> allTheCards = [];
    // final RegExp numberRegex = RegExp(r"\d+"); // <- look up to see why this didn't work.
    final RegExp numberRegex = RegExp(r'[^0-9]');
    
    for (var line in flatData) {
      final removeCard = line.split(":");
      final cardNum = int.parse(removeCard[0].replaceAll(numberRegex, ''));
      final leftRight = removeCard[1].split(" | ");
      final group1 = leftRight[0].split(RegExp(r"\s+")).where((element) => element.isNotEmpty).map(int.parse).toList();
      final group2 = leftRight[1].split(RegExp(r"\s+")).where((element) => element.isNotEmpty).map(int.parse).toList();

      List<int> compareAndSave(){ // This just saves any numbers on the left that match with the right to a list, no calculation here.
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

      final numberOfMatches = compareAndSave().length; // Determines the total number of matches.
      int instances = 1; // Every card counts as one, even if no matches so they default to 1 instance.
      final ScratchCard currentCard = ScratchCard(cardNum, numberOfMatches, instances); // Sets up the specific card with default instance, and total matches.

      allTheCards.add(currentCard); // Each card is saved to the total list, no extra instances are added yet.
    }
    return allTheCards; // This should be the complete List of 206 cards.
  }

  Map<int, ScratchCard> addInstancesOfExtraScratchcards(){
    List<ScratchCard> allTheCardsList = allTheCardsAndMatchesList();
    final allTheCardsMap = {
      for(final card in allTheCardsList) card.cardNumber : card //Concise notation to convert a List to a Map
    };

    for(var cardEntry in allTheCardsMap.entries){
      final cardNumber = cardEntry.key;
      final card = cardEntry.value;
      if(card.matches > 0){
        for(int count = 1; count <= card.instances; count++){
          for(int sequence = 1; sequence <= card.matches; sequence++){
            int nextCardNumber = cardNumber + sequence;
            var nextCard = allTheCardsMap.putIfAbsent(nextCardNumber, () => card.copyWith());
            nextCard.instances = nextCard.instances + 1;
          }
        }
      }

    }
    return allTheCardsMap;
  }

  Future<int> pileOfCards() async {
    Map<int, ScratchCard> rawCardData = addInstancesOfExtraScratchcards();
    int lotteryScore = 0;
    rawCardData.forEach((cardNumber, scratchCard) {
      lotteryScore = lotteryScore + scratchCard.instances;
    });
    return lotteryScore;
  }
}

