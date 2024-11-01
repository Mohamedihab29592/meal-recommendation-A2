import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:flutter/material.dart';

class ProfileViewImage extends StatelessWidget {
  const ProfileViewImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 120,
              height: 120,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: Image.network(
                url,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                      ),
                    );
                  }
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {},
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.c_001A3F,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      Assets.editIcon,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
