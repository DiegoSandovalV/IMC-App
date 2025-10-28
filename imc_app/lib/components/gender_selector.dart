import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Male
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "male";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 8,
                top: 16,
                bottom: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "male"
                      ? AppColors.backgroundSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/male.png', height: 100),
                      SizedBox(height: 10),
                      Text("MALE", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // Female
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedGender = "female";
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 16,
                top: 16,
                bottom: 16,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == "female"
                      ? AppColors.backgroundSelected
                      : AppColors.backgroundComponent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Image.asset('assets/images/female.png', height: 100),
                      SizedBox(height: 10),
                      Text("FEMALE", style: TextStyles.bodyText),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
