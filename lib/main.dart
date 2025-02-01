import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double valueHeight = 160;
  double valueWeight = 50;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 62, 100, 132),
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
            fontFamily: 'Poppins-Regular',
          ),
        ),
        titleTextStyle: TextStyle(color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/image_bmi.png',
              height: 150,
            ),
            Text(
              "Heigth",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins-Regular',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  valueHeight.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "cm",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ],
            ),
            Slider(
              value: valueHeight,
              min: 100,
              max: 200,
              activeColor: Colors.pink,
              divisions: 100,
              label: valueHeight.toStringAsFixed(0),
              onChanged: (double mandarina) {
                valueHeight = mandarina;
                setState(() {});
              },
            ),
            Text(
              "Weigth",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins-Regular',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  valueWeight.toStringAsFixed(2),
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  "kg",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins-Regular',
                  ),
                ),
              ],
            ),
            Slider(
              value: valueWeight,
              min: 30,
              max: 150,
              activeColor: Colors.indigo,
              divisions: 12000,
              label: valueWeight.toStringAsFixed(2),
              onChanged: (double mandarina) {
                valueWeight = mandarina;
                setState(() {});
              },
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  bmi = valueWeight / pow((valueHeight / 100), 2);
                  setState(() {});
                },
                child: const Text(
                  "Calculate",
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  children: [
                    Text(
                      "Result",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
