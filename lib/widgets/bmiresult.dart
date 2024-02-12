import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiResult extends StatelessWidget {
  const BmiResult(
      {this.isMale, this.heightController, this.weightController, super.key});

  final heightController;
  final weightController;
  final isMale;

  double bmi() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    if (height <= 0 || weight <= 0) {
      return 0.0;
    }

    if (isMale) {
      return weight / ((height / 100) * (height / 100));
    } else {
      return (weight * 0.9) / ((height / 100) * (height / 100));
    }
  }

  String getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal weight';
    } else if (bmi >= 24.9 && bmi < 29.9) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    double userbmi = bmi();
    String category = getBmiCategory(userbmi);
    return Scaffold(
      backgroundColor: const Color.fromARGB(50, 0, 0, 0),
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Text(
              'Your BMI is',
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 15),
                color: const Color.fromARGB(88, 255, 255, 255)),
            child: Text(
              userbmi.toStringAsFixed(2),
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            category,
            style: GoogleFonts.openSans(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
