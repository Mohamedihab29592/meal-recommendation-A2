
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final int index;
  final int selectedIndex;
  final VoidCallback onTap;

  const MenuItem({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return Padding(
      padding: const EdgeInsets.only(right: 100, top: 30),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF001A3F) : Colors.transparent,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                color: isSelected ? Colors.white : const Color(0xff001A3F),
                height: 50,
                width: 50,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isSelected ? Colors.white : const Color(0xff001A3F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}