import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String? iconPath; // Added iconPath for the prefixIcon
  final Color textColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final TextEditingController? controller;
  final Color hintColor;
  final double borderRadius;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.textInputType,
    this.obscureText = false,
    this.onSaved,
    this.iconPath, // Required field for the icon path
    this.textColor = Colors.white,
    this.enabledBorderColor = Colors.white,
    this.focusedBorderColor = Colors.white,
    this.controller,
    this.hintColor = Colors.white,
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      // height: 55,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        onTapOutside: (PointerDownEvent pointer) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: iconPath != null
              ? Padding(
                  padding: const EdgeInsets.all(12.0), // Added padding to align the icon
                  child: Image.asset(iconPath!), // Displaying the image as the prefixIcon
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: enabledBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(color: focusedBorderColor),
          ),
        ),
      ),
    );
  }
}
