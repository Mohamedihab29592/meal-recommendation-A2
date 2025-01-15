import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String?)? onSaved;
  final String iconPath; // Added iconPath for the prefixIcon

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.obscureText,
    this.onSaved,
    required this.iconPath, // Required field for the icon path
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 55,
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0), // Added padding to align the icon
            child: Image.asset(iconPath), // Displaying the image as the prefixIcon
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
