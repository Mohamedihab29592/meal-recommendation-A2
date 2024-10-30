import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:flutter/material.dart';

class ProfileViewImage extends StatelessWidget {
  const ProfileViewImage({super.key});

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
                "https://scontent.fcai19-2.fna.fbcdn.net/v/t39.30808-6/385770710_873776704103765_3789357224619367570_n.png?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=hHMF1JWpnHIQ7kNvgFlZqhN&_nc_zt=23&_nc_ht=scontent.fcai19-2.fna&_nc_gid=AT04oL36hfdOUhkGMTR8E7j&oh=00_AYC98YdFtjA4Lk8VwUu5fsZ-6blO4F_qlJr3Kldsy2PaWw&oe=672817A7",
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
          ],
        ),
      ],
    );
  }
}
