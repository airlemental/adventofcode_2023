// ignore_for_file: move-variable-closer-to-its-usage, prefer-correct-handler-name

import 'package:advent_2023/screens/day_1_part_1.dart';
import 'package:advent_2023/screens/day_1_part_2.dart';
import 'package:advent_2023/screens/day_2_part_1.dart';
import 'package:advent_2023/screens/day_2_part_2.dart';
import 'package:advent_2023/screens/day_3_part_1.dart';
import 'package:advent_2023/screens/day_3_part_2.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _displayNumber = 0;
  int _displayNumber2 = 0;
  int _displayNumber3 = 0;
  int _displayNumber4 = 0;
  int _displayNumber5 = 0;
  int _displayNumber6 = 0;

  void _findAndAddNumbers() async {
    _displayNumber = 0;
    _displayNumber2 = 0;
    int getTotal = await Part1().finalNumber();
    int getTotal2 = await Part2().finalNumber2();
    int getTotal3 = await Part3().finalNumber3();
    int getTotal4 = await Part4().finalNumber4();
    int getTotal5 = await Part5().solvePuzzle();
    int getTotal6 = await Part6().grindGears();
    if(getTotal > 0){
    setState(() {
      _displayNumber = _displayNumber + getTotal;
      _displayNumber2 = _displayNumber2 + getTotal2;
      _displayNumber3 = _displayNumber3 + getTotal3;
      _displayNumber4 = _displayNumber4 + getTotal4;
      _displayNumber5 = _displayNumber5 + getTotal5;
      _displayNumber6 = _displayNumber6 + getTotal6;
    });
    }
  }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Trebuchet Initial Calculation'),
              Text(
                '$_displayNumber',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('Trebuchet LAUNCH!'),
              Text(
                '$_displayNumber2',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('Elf Cube Game'),
              Text(
                '$_displayNumber3',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('That is SUM Elf POWER you have'),
              Text(
                '$_displayNumber4',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('HOW is THAT an engine part?'),
              Text(
                '$_displayNumber5',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('Transmission Gear Booster'),
              Text(
                '$_displayNumber6',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _findAndAddNumbers,
        tooltip: 'Create the Code',
        child: const Icon(Icons.ac_unit),
      ),
    );
  }





}