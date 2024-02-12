import 'package:bmi/widgets/bmiresult.dart';
import 'package:bmi/widgets/bmiscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {
        '/bmi': (context) => const BmiResult(),
      },
      home: const BmiScreen(),
    ),
  );
}
