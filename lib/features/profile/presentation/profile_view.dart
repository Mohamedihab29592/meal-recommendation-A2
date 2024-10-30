import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_button.dart';
import 'package:meal_recommendations_a2/features/auth/login/persentation/view/custome_widgets/custome_text_field.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/widgets/profile_image.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/widgets/profile_view_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  final AutovalidateMode autovalidateMode = AutovalidateMode.always;
  // const GlobalKey<FormState>formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              autovalidateMode: autovalidateMode,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const ProfileViewHeader(),
                    const SizedBox(height: 10),
                    const ProfileViewImage(),
                    const SizedBox(height: 10),
                    CustomTextField(
                      hintText: AppStrings.userName,
                      hintColor: AppColors.c_001A3F,
                      textColor: AppColors.c_001A3F,
                      focusedBorderColor: AppColors.c_001A3F,
                      enabledBorderColor: Colors.grey,
                      borderRadius: 8,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: AppStrings.emailHintText,
                      textColor: AppColors.c_001A3F,
                      hintColor: AppColors.c_001A3F,
                      focusedBorderColor: AppColors.c_001A3F,
                      enabledBorderColor: Colors.grey,
                      borderRadius: 8,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: AppStrings.phoneHintText,
                      textColor: AppColors.c_001A3F,
                      hintColor: AppColors.c_001A3F,
                      focusedBorderColor: AppColors.c_001A3F,
                      enabledBorderColor: Colors.grey,
                      borderRadius: 8,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: AppStrings.passwordHintText,
                      textColor: AppColors.c_001A3F,
                      hintColor: AppColors.c_001A3F,
                      focusedBorderColor: AppColors.c_001A3F,
                      enabledBorderColor: Colors.grey,
                      borderRadius: 8,
                    ),
                    const Expanded(child: SizedBox(height: 10)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: CustomButton(
                        text: AppStrings.saveButton,
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.c_001A3F,
                        radius: 14,
                        onPressed: () {},
                      ),
                    ),
                    const Expanded(child: SizedBox(height: 10)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
