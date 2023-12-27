// ignore_for_file: move-variable-closer-to-its-usage, prefer-correct-handler-name

import 'package:advent_2023/screens/day_1_part_1.dart';
import 'package:advent_2023/screens/day_1_part_2.dart';
import 'package:advent_2023/screens/day_2_part_1.dart';
import 'package:advent_2023/screens/day_2_part_2.dart';
import 'package:advent_2023/screens/day_3_part_1.dart';
import 'package:advent_2023/screens/day_3_part_2.dart';
import 'package:advent_2023/screens/day_4_part_1.dart';
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
  int _displayNumber7 = 0;

  void _findAndAddNumbers() async {
    _displayNumber = 0;
    _displayNumber2 = 0;
    int getTotal = await Part1().finalNumber();
    int getTotal2 = await Part2().finalNumber2();
    int getTotal3 = Part3().finalNumber3();
    int getTotal4 = Part4().finalNumber4();
    int getTotal5 = Part5().solvePuzzle();
    int getTotal6 = Part6().grindGears();
    int getTotal7 = Part7().theLottery();
    if (getTotal > 0) {
      setState(() {
        _displayNumber = _displayNumber + getTotal;
        _displayNumber2 = _displayNumber2 + getTotal2;
        _displayNumber3 = _displayNumber3 + getTotal3;
        _displayNumber4 = _displayNumber4 + getTotal4;
        _displayNumber5 = _displayNumber5 + getTotal5;
        _displayNumber6 = _displayNumber6 + getTotal6;
        _displayNumber7 = _displayNumber7 + getTotal7;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/christmas-tree.png'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: const Alignment(-1.0, 0.05),
            end: const Alignment(1.0, -0.05),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /// Day 1 Part 1
                Text(
                  ' Trebuchet Initial Calculation ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 1 Part 2
                Text(
                  ' Trebuchet LAUNCH! ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber2 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 2 Part 1
                Text(
                  ' Elf Cube Stake ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber3 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 2 Part 2
                Text(
                  ' That is SUM Elf POWER you have ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber4 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 3 Part 1
                Text(
                  ' HOW is THAT an engine part? ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber5 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 3 Part 2
                Text(
                  ' Transmission Gear Booster ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber6 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 4 Part 1
                Text(
                  ' Is it really worth it? ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber7 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),
              ],
            ),
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
