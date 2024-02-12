import 'package:bmi/widgets/bmiresult.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() {
    return _BmiScreenState();
  }
}

class _BmiScreenState extends State<BmiScreen> {
  var _maleIsSelected = false;
  var _femalIsSelected = false;

  final TextEditingController _userheight = TextEditingController();
  final TextEditingController _userweight = TextEditingController();
  final bool isMale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 21,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 32, left: 100),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _maleIsSelected
                          ? Colors.blue.withOpacity(0.4)
                          : Colors.white,
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _maleIsSelected = true;
                          _femalIsSelected = false;
                        });
                      },
                      icon: Icon(
                        Icons.man,
                        size: 80,
                        color: _maleIsSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: _femalIsSelected
                            ? Colors.pink.withOpacity(0.6)
                            : Colors.white),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _maleIsSelected = false;
                          _femalIsSelected = true;
                        });
                      },
                      icon: Icon(
                        Icons.woman,
                        size: 80,
                        color: _femalIsSelected ? Colors.pink : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Height (in cm)',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 40, left: 140),
                  ),
                  controller: _userheight,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Weight (in kgs)',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 40, left: 140),
                  ),
                  controller: _userweight,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {
                if (_userheight.text.isNotEmpty &&
                    _userweight.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiResult(
                        heightController: _userheight,
                        weightController: _userweight,
                        isMale: _maleIsSelected,
                      ),
                    ),
                  );
                }
              },
              child: const Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
