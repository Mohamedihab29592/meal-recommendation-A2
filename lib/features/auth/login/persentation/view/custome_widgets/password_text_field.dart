import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  final String hintText;
  final Function(String?)? onSaved;
  final String iconPath; // Path for the prefix icon

  const CustomPasswordField({
    super.key,
    required this.hintText,
    this.onSaved,
    required this.iconPath,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true; // Default to hiding the password

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 55,
      child: TextFormField(
        obscureText: _obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        style: const TextStyle(color: Colors.white),
        onSaved: widget.onSaved,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: Colors.transparent,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0), // Added padding for icon alignment
            child: Image.asset(widget.iconPath), // Prefix icon
          ),
          suffixIcon: GestureDetector(
            onTap: _togglePasswordVisibility,
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
