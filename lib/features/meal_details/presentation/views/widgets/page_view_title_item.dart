import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class PageViewTitleItem extends StatelessWidget {
  const PageViewTitleItem({super.key, required this.title, required this.isSelected, this.onTap});

  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: TextStyle(color: isSelected ? AppColors.c001A3F : AppColors.c8A8A8A, fontSize: 20)),
          const SizedBox(height: 7),
          isSelected
              ? Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                    color: AppColors.c001A3F,
                    borderRadius: BorderRadius.circular(50),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
