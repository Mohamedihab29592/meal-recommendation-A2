import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/custom_text_field.dart';

class TextFieldsSection extends StatefulWidget {
  const TextFieldsSection({super.key, required this.userModel, required this.password});
  final UserModel userModel;
  final String password;

  @override
  State<TextFieldsSection> createState() => _TextFieldsSectionState();
}

class _TextFieldsSectionState extends State<TextFieldsSection> {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    userNameController.text = widget.userModel.userName;
    emailController.text = widget.userModel.email;
    phoneController.text = widget.userModel.phone;
    passwordController.text = widget.password;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: AppStrings.userName,
          hintColor: AppColors.c_001A3F,
          textColor: AppColors.c_001A3F,
          focusedBorderColor: AppColors.c_001A3F,
          enabledBorderColor: Colors.grey,
          borderRadius: 8,
          controller: userNameController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: AppStrings.emailHintText,
          textColor: AppColors.c_001A3F,
          hintColor: AppColors.c_001A3F,
          focusedBorderColor: AppColors.c_001A3F,
          enabledBorderColor: Colors.grey,
          borderRadius: 8,
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: AppStrings.phoneHintText,
          textColor: AppColors.c_001A3F,
          hintColor: AppColors.c_001A3F,
          focusedBorderColor: AppColors.c_001A3F,
          enabledBorderColor: Colors.grey,
          borderRadius: 8,
          controller: phoneController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          hintText: AppStrings.passwordHintText,
          textColor: AppColors.c_001A3F,
          hintColor: AppColors.c_001A3F,
          focusedBorderColor: AppColors.c_001A3F,
          enabledBorderColor: Colors.grey,
          borderRadius: 8,
          controller: passwordController,
        ),
      ],
    );
  }
}
