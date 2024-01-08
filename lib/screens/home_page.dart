// ignore_for_file: move-variable-closer-to-its-usage, prefer-correct-handler-name

import 'package:advent_2023/screens/day_1_part_1.dart';
import 'package:advent_2023/screens/day_1_part_2.dart';
import 'package:advent_2023/screens/day_2_part_1.dart';
import 'package:advent_2023/screens/day_2_part_2.dart';
import 'package:advent_2023/screens/day_3_part_1.dart';
import 'package:advent_2023/screens/day_3_part_2.dart';
import 'package:advent_2023/screens/day_4_part_1.dart';
import 'package:advent_2023/screens/day_4_part_2.dart';
import 'package:advent_2023/screens/day_5_part_1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _displayNumber1 = 0;
  int _displayNumber2 = 0;
  int _displayNumber3 = 0;
  int _displayNumber4 = 0;
  int _displayNumber5 = 0;
  int _displayNumber6 = 0;
  int _displayNumber7 = 0;
  int _displayNumber8 = 0;
  int _displayNumber9 = 0;


  void _solveTheProblems() {
    _displayNumber1 = 0;
    _calculateAndUpdate(Part1().findTheDigits(), (value) => _displayNumber1 += value);
    _displayNumber2 = 0;
    _calculateAndUpdate(Part2().findAllNumsInWords(), (value) => _displayNumber2 += value);
    _displayNumber3 = 0;
    _calculateAndUpdate(Part3().possibleCubeGames(), (value) => _displayNumber3 += value);
    _displayNumber4 = 0;
    _calculateAndUpdate(Part4().fewestCubes(), (value) => _displayNumber4 += value);
    _displayNumber5 = 0;
    _calculateAndUpdate(Part5().solvePuzzle(), (value) => _displayNumber5 += value);
    _displayNumber6 = 0;
    _calculateAndUpdate(Part6().grindGears(), (value) => _displayNumber6 += value);
    _displayNumber7 = 0;
    _calculateAndUpdate(Part7().theLottery(), (value) => _displayNumber7 += value);
    _displayNumber8 = 0;
    _calculateAndUpdate(Part8().pileOfCards(), (value) => _displayNumber8 += value);
    _displayNumber9 = 0;
    _calculateAndUpdate(Part9().lowestLocation(), (value) => _displayNumber9 += value);
  }

  Future<void> _calculateAndUpdate<T>(
      Future<T> calculation,
      ValueSetter<T> updater,
    ) async {
      try {
        final value = await calculation;
        if (value != null) {
          setState(() {
            updater(value);
          });
        }
        await Future.delayed(const Duration(seconds: 3));
      } catch (error) {
        debugPrint("Error during calculation: $error");
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
                  '-- $_displayNumber1 --\n',
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
                  ' Is that Card really worth it? ',
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
                
                /// Day 4 Part 2
                Text(
                  ' oh yay, you win more cards -.- ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber8 --\n',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                      ),
                ),

                /// Day 5 Part 1
                Text(
                  ' Where should I stick this? ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                Text(
                  '-- $_displayNumber9 --\n',
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
        onPressed: _solveTheProblems,
        tooltip: 'Create the Code',
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}
