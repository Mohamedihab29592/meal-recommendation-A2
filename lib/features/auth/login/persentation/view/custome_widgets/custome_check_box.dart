import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });

  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: GestureDetector(
        onTap: () {
          onChecked(!isChecked);
        },
        child: AnimatedContainer(
          width: 26,
          height: 26,
          duration: const Duration(milliseconds: 100),
          decoration: ShapeDecoration(
            color: isChecked ? AppColors.c001A3F : Colors.transparent, // Transparent when unchecked
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.30,
                color: isChecked ? Colors.white : const Color(0xFFDCDEDE),
              ),
            ),
          ),
          child: isChecked
              ? Padding(
                  padding: const EdgeInsets.all(1),
                  child: Icon(Icons.check),
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
