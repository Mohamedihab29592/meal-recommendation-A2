import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

import '../../../../../core/utiles/app_colors.dart';

void showLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const LoadingDialog();
    },
  );
}

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoActivityIndicator(
              radius: 15,
              color: AppColors.c_001A3F,
            ),
            const SizedBox(height: 16.0),
            Text(
              AppStrings.pleaseWait,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
