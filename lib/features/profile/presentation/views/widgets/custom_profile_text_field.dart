import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_recommendations_a2/core/utiles/app_colors.dart';

class CustomProfileTextField extends StatefulWidget {
  const CustomProfileTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.inputFormatters,
    this.onSaved,
    this.onChanged,
    this.obscureText = false,
    this.enableValidator = true,
  });

  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final bool enableValidator;

  @override
  State<CustomProfileTextField> createState() => _CustomProfileTextFieldState();
}

class _CustomProfileTextFieldState extends State<CustomProfileTextField> {
  Color color = Colors.grey;
  bool foucsed = false;
  late bool obscureText;
  late IconData eyeIcon;

  @override
  void initState() {
    obscureText = widget.obscureText;
    eyeIcon = Icons.remove_red_eye_outlined;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (focus) {
        foucsed = focus;
        if (color != Colors.red) {
          color = focus ? AppColors.c_001A3F : Colors.grey;
          setState(() {});
        }
      },
      child: TextFormField(
        validator: (value) {
          if (widget.enableValidator) {
            if (value == null || value.isEmpty) {
              color = Colors.red;
              setState(() {});
              return "Field is required";
            } else if (foucsed) {
              color = AppColors.c_001A3F;
              setState(() {});
            }
          }
          return null;
        },
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        onSaved: widget.onSaved,
        onChanged: widget.onChanged,
        controller: widget.controller,
        cursorOpacityAnimates: true,
        cursorColor: color,
        obscureText: obscureText,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          border: outlineInputBorder(1),
          enabledBorder: outlineInputBorder(1),
          focusedBorder: outlineInputBorder(2),
          errorBorder: outlineInputBorder(1),
          focusedErrorBorder: outlineInputBorder(2),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: color),
          errorStyle: TextStyle(color: color),
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    obscureText = !obscureText;
                    if (eyeIcon == Icons.remove_red_eye_outlined) {
                      eyeIcon = Icons.remove_red_eye;
                    } else {
                      eyeIcon = Icons.remove_red_eye_outlined;
                    }
                    setState(() {});
                  },
                  icon: Icon(eyeIcon),
                )
              : null,
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(double width) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(width: width, color: color),
    );
  }
}
