import 'package:flutter/material.dart';
import 'package:imc_app/components/gender_selector.dart';
import 'package:imc_app/components/height_selector.dart';
import 'package:imc_app/components/number_selector.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';
import 'package:imc_app/screens/imc_result_screen.dart';

class ImcHomeScreen extends StatefulWidget {
  const ImcHomeScreen({super.key});

  @override
  State<ImcHomeScreen> createState() => _ImcHomeScreenState();
}

class _ImcHomeScreenState extends State<ImcHomeScreen> {
  int selectedAge = 20;
  int selectedWeight = 75;
  int selectedHeight = 170;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GenderSelector(),
        HeightSelector(
          value: selectedHeight,
          onChanged: (newHeight) {
            setState(() {
              selectedHeight = newHeight;
            });
          },
        ),

        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: NumberSelector(
                  title: "Age",
                  value: selectedAge,
                  onIncrement: () {
                    setState(() {
                      selectedAge++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedAge--;
                    });
                  },
                ),
              ),
              Expanded(
                child: NumberSelector(
                  title: "Weight",
                  value: selectedWeight,
                  onIncrement: () {
                    setState(() {
                      selectedWeight++;
                    });
                  },
                  onDecrement: () {
                    setState(() {
                      selectedWeight--;
                    });
                  },
                ),
              ),
            ],
          ),
        ),

        Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImcResultScreen(
                      age: selectedAge,
                      weight: selectedWeight,
                      height: selectedHeight,
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              child: Text("CALCULATE IMC", style: TextStyles.bodyText),
            ),
          ),
        ),
      ],
    );
  }
}
