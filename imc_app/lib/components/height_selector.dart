import 'package:flutter/material.dart';
import 'package:imc_app/core/app_colors.dart';
import 'package:imc_app/core/text_styles.dart';

class HeightSelector extends StatefulWidget {
  final int value;
  final Function(int) onChanged;

  const HeightSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<HeightSelector> createState() => _HeightSelectorState();
}

class _HeightSelectorState extends State<HeightSelector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundComponent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text("HEIGHT", style: TextStyles.bodyText),
          Text("${widget.value.toString()} cm", style: TextStyles.bodyText),
          Slider(
            value: widget.value.toDouble(),
            onChanged: (newValue) {
              widget.onChanged(newValue.toInt());
            },
            min: 100,
            max: 200,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
