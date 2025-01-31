import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_bmi/bmi_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BmiBrain mandarinaBrain = BmiBrain(height: 155.0, weight: 48);

  double valueHeight = 160.0;
  double valueWeight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 57, 99),
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
              "Height",
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            Slider(
              min: 100.0,
              max: 200.0,
              value: valueHeight,
              activeColor: Colors.purple,
              // label: valueSlider.toInt().toString(),
              divisions: 100,
              onChanged: (double value) {
                valueHeight = value;
                // mandarinaBrain.height = valueHeight;
                setState(() {});
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  valueHeight.toStringAsFixed(0),
                  style:
                      TextStyle(fontSize: 28.0, fontFamily: 'Poppins-Regular'),
                ),
                SizedBox(
                  width: 4,
                ),
                Text("cm"),
              ],
            ),
            Text(
              "Weigth",
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                fontSize: 16,
              ),
            ),
            Slider(
              min: 30.0,
              max: 150.0,
              value: valueWeight,
              activeColor: Colors.indigo,
              // label: valueSlider.toInt().toString(),
              // divisions: 100,
              onChanged: (double value) {
                valueWeight = value;
                // mandarinaBrain.weight = valueWeight;
                setState(() {});
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  valueWeight.toStringAsFixed(2),
                  style:
                      TextStyle(fontSize: 28.0, fontFamily: 'Poppins-Regular'),
                ),
                SizedBox(
                  width: 4,
                ),
                Text("kg"),
              ],
            ),
            // Container(
            //   margin: EdgeInsets.all(20),
            //   width: double.infinity,
            //   height: 50,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // _calculateBMI();
            //     },
            //     child: Text(
            //       "Calculate",
            //     ),
            //   ),
            // ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "Resultado: ",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins-Regular',
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      mandarinaBrain.getResult(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Poppins-Regular',
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      mandarinaBrain.calculateBMI().toStringAsFixed(1),
                      // bmi.toStringAsFixed(1),
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
            SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
