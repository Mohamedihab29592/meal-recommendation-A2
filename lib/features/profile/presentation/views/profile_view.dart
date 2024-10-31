import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/custom_button.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/TextFieldsSection.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/profile_view_header.dart';

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
                    TextFieldsSection(
                      userModel: UserModel(email: "", phone: "", profileURL: "", uId: "", userName: ""),
                      password: "",
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
