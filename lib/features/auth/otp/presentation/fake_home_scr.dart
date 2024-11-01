import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        backgroundColor: Colors.teal,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "User ID: ",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "Verification ID:  ",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "Access ",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
