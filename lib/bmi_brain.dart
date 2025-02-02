import 'dart:math';

class BmiBrain {
  double height;
  double weight;

  BmiBrain({
    required this.height,
    required this.weight,
  });

  //calcularBMI

  double calculateBMI() {
    double bmi = weight / pow((height / 100), 2);
    return bmi;
  }

  //
  String getResult() {
    double bmi = calculateBMI();
    String result = "";

    if (bmi < 18.5) {
      result = "Bajo peso";
    } else if (bmi < 25) {
      result = "Peso normal";
    } else {
      result = "Sobrepeso";
    }
    return result;
  }
}
