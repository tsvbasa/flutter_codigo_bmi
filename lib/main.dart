import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_codigo_bmi/bmi_brain.dart';

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
  BmiBrain mandarinaBrain = BmiBrain(height: 182, weight: 76);

  double valueHeight = 182;
  double valueWeight = 76;

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
                // mandarinaBrain.height = valueHeight;
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
                // mandarinaBrain.weight = valueWeight;
                setState(() {});
              },
            ),
            Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  mandarinaBrain.height = valueHeight;
                  mandarinaBrain.weight = valueWeight;
                  setState(() {});
                },
                child: const Text(
                  "Calculate",
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: Card(
                elevation: 12,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      "Result:",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      mandarinaBrain.getResult(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Regular',
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      mandarinaBrain.calculateBMI().toStringAsFixed(1),
                      // bmi.toStringAsFixed(1),
                      style: const TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
