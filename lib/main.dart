import 'package:advent_2023/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'Advent of Code 2023'),
    );
  }
}

// Day 1 -> Receives a giant list of character strings.
//   -> Import each string,
//   -> Find the first digit of each
//   -> Find the last digit of each, which might be the exact number as the first if there is only 1. Handle if there are none.
//   -> Set first digit in place 1 and second digit in place 2 of a 2 digit number and save the 2 digit number without changing them.
//   -> Once all the 2 digit numbers are assembled, add them all together to get a final total value, that is the answer for Star 1

