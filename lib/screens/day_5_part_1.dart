
import 'package:advent_2023/data/data_day5.dart';

class Almanac {
  const Almanac(
    this.destination,
    this.source,
    this.range,
  );
  final int destination;
  final int source;
  final int range;
}

class Part9 {
  String seedData = '';
  String seedToSoilData = '';
  String soilToFertilizerData = '';
  String fertilizerToWaterData = '';
  String waterToLightData = '';
  String lightToTemperatureData = '';
  String temperatureToHumidityData = '';
  String humidityToLocationData = '';

  List<int> seeded() {
    seedData = seeds;
    final seedsOnly = seedData.split(":");
    final eachSeed = seedsOnly[1].split(RegExp(r"\s+"))
      .where((element) => element.isNotEmpty)
      .map(int.parse).toList();
    return eachSeed;
  }

  Map<int, Almanac> soiled() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> seedToSoilLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        seedToSoilLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in seedToSoilLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> fertilized() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> soilToFertilizerLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        soilToFertilizerLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in soilToFertilizerLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> watered() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> fertilizerToWaterLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        fertilizerToWaterLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in fertilizerToWaterLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> lit() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> waterToLightLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        waterToLightLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in waterToLightLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> temped() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> lightToTemperatureLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        lightToTemperatureLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in lightToTemperatureLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> humidified() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> temperatureToHumidityLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        temperatureToHumidityLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in temperatureToHumidityLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  Map<int, Almanac> located() {
    seedToSoilData = seedToSoil;
    final soilNumbers = seedToSoilData.split(":");
    final eachLine = soilNumbers[1].split('\n');
    List<String> humidityToLocationLinesList = [];
    for(var line in eachLine){
      if(line.isNotEmpty){
        humidityToLocationLinesList.add(line);
      }
    }
    Map<int, Almanac> convertToAlmanac = {};
    int mapKey = 0;
    for(var group in humidityToLocationLinesList){
      mapKey++;
      final destSourceRange = group.split(RegExp(r"\s+"))
        .where((element) => element.isNotEmpty)
        .map(int.parse).toList();
      convertToAlmanac[mapKey] = Almanac(destSourceRange[0], destSourceRange[1], destSourceRange[2]);
    }
    return convertToAlmanac;
  }

  // Take a seed number
      // start each with source comparison to see if no mapping applies, and the number does not change.
  // Map to fertilizer
  // Map to water
  // Map to light
  // Map to temp
  // Map to humidity
  // Map to location
  // Find the lowest location number

  List<Map> allTheMaps = [];
  

  Future<int> lowestLocation() async {
    int lowLoc = 0;
    allTheMaps.add(soiled());
    allTheMaps.add(fertilized());
    allTheMaps.add(watered());
    allTheMaps.add(lit());
    allTheMaps.add(temped());
    allTheMaps.add(humidified());
    allTheMaps.add(located());
    List<int> seedList = seeded();
    for(int seed in seedList){
      for(Map<int, Almanac> mapping in allTheMaps){

      mapping.forEach((key, almanac) {
        int newMappedNumber = 0;
        if((seed >= almanac.source) && (seed <= almanac.source + almanac.range)){
          int diff = seed - almanac.source;
          newMappedNumber = almanac.destination + diff;
        }
        
      });
      return seed;

      }
    }


    return lowLoc;
  }

}