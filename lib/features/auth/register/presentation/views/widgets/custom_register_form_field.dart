import 'package:flutter/material.dart';

class CustomRegisterFormField extends StatelessWidget {
  const CustomRegisterFormField({
    super.key,
    required this.preIcon,
    required this.hintText,
    this.sufIcon,
    this.onPressedSufIcon,
    required this.controller,
    this.validator,
    this.secureText = false,
  });
  final IconData preIcon;
  final String hintText;
  final IconData? sufIcon;
  final void Function()? onPressedSufIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool secureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: secureText,
      validator: validator,
      controller: controller,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        hintText: hintText,
        suffixIcon: IconButton(
          onPressed: onPressedSufIcon,
          icon: Icon(
            sufIcon,
            color: Colors.white,
          ),
        ),
        prefixIcon: Icon(
          preIcon,
          color: Colors.white,
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        errorBorder: buildBorder(),
        focusedErrorBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
