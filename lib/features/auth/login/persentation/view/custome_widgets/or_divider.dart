import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 12,
            indent: 40,
            color: Color(0xFFDCDEDE),
          ),
        ),
        SizedBox(
          width: 0,
        ),
        Text(
          'or login with',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 4,
        ),
        Expanded(
          child: Divider(
            endIndent: 35,
            color: Color(0xFFDCDEDE),
          ),
        ),
      ],
    );
  }
}
