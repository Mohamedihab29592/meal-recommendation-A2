import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/constant.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/controllers/cubit/profile_view_cubit.dart';

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
                url.isNotEmpty ? url : defaultProfileImageURL,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1) : null,
                        color: AppColors.c001A3F,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace) {
                  return const Placeholder();
                },
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: () async {
                  await BlocProvider.of<ProfileViewCubit>(context).updateImage();
                },
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: AppColors.c001A3F,
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
