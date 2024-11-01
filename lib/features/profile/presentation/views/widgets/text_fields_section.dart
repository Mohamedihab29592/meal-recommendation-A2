import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/helper/formatters.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';
import 'package:meal_recommendations_a2/features/profile/data/models/user_model.dart';
import 'package:meal_recommendations_a2/features/profile/presentation/views/widgets/custom_profile_text_field.dart';

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
    userNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    userNameController.text = widget.userModel.userName;
    emailController.text = widget.userModel.email;
    phoneController.text = widget.userModel.phone;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProfileTextField(
          hintText: AppStrings.userName,
          controller: userNameController,
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          hintText: AppStrings.emailHintText,
          inputFormatters: [Formatters.emailRegExp],
          controller: emailController,
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          hintText: AppStrings.phoneHintText,
          inputFormatters: [Formatters.phoneNumbersRegExp],
          controller: phoneController,
        ),
        const SizedBox(height: 20),
        CustomProfileTextField(
          obscureText: true,
          hintText: AppStrings.passwordHintText,
          controller: passwordController,
        ),
      ],
    );
  }
}
