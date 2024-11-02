import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/core/helper/formatters.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/custom_profile_text_field.dart';

class TextFieldsSection extends StatelessWidget {
  const TextFieldsSection({super.key, required this.userNameController, required this.emailController, required this.phoneController, required this.passwordController, required this.userModel});
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileTextField(
          hintText: AppStrings.userName,
          controller: userNameController,
          onSaved: (userName) {
            userModel.userName = userName!;
          },
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          hintText: AppStrings.emailHintText,
          inputFormatters: [Formatters.emailRegExp],
          controller: emailController,
          onSaved: (email) {
            userModel.email = email!;
          },
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          hintText: AppStrings.phoneHintText,
          inputFormatters: [Formatters.phoneNumbersRegExp],
          controller: phoneController,
          onSaved: (phone) {
            userModel.phone = phone!;
          },
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          obscureText: true,
          enableValidator: false,
          hintText: AppStrings.passwordHintText,
          controller: passwordController,
        ),
      ],
    );
  }
}
