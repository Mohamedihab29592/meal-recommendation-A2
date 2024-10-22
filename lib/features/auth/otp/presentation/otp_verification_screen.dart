import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/utiles/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.c_001A3F,
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/flat-lay-composition-mexican-food-with-copyspace 1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top icon
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white.withOpacity(0.2),
              child: const Icon(
                Icons.restaurant_menu,
                size: 40,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // Verification text
            const Text(
              'verification',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Instructions
            const Text(
              'Enter 4 digits verification code. We just sent your Email.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),

            // Input fields for verification code
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CodeInputField(),
                CodeInputField(),
                CodeInputField(),
                CodeInputField(),
              ],
            ),
            const SizedBox(height: 40),

            // Continue button
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: Text(
                'continue',
                style: TextStyle(
                  color: Colors.blue.shade900, // Text color
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeInputField extends StatelessWidget {
  const CodeInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }
}
