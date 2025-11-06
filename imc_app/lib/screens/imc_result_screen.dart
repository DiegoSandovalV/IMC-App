import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class ImcResultScreen extends StatelessWidget {
  final int age;
  final int weight; // en kg
  final int height; // en cm

  const ImcResultScreen({
    super.key,
    required this.age,
    required this.weight,
    required this.height,
  });

  double _calculateImc() {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String _getImcCategory(double imc) {
    if (imc < 18.5) return "Underweight";
    if (imc < 24.9) return "Normal weight";
    if (imc < 29.9) return "Overweight";
    return "Obesity";
  }

  Color _getImcColor(double imc) {
    if (imc < 18.5) return Colors.blueAccent;
    if (imc < 24.9) return Colors.green;
    if (imc < 29.9) return Colors.orangeAccent;
    return Colors.redAccent;
  }

  @override
  Widget build(BuildContext context) {
    final imc = _calculateImc();
    final category = _getImcCategory(imc);
    final color = _getImcColor(imc);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBarResult(),
      body: bodyResult(context, imc, category, color),
    );
  }

  Padding bodyResult(
    BuildContext context,
    double imc,
    String category,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Your Result", style: TextStyles.resultText),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.backgroundComponent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      color: color,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    imc.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Age: $age years\nWeight: $weight kg\nHeight: $height cm",
                    style: TextStyles.bodyText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "RECALCULATE",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarResult() {
    return AppBar(
      title: const Text("IMC Result"),
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    );
  }
}
