
import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/features/side_bar/side_bar_view_body.dart';

class SideBarView extends StatelessWidget {
    const SideBarView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
        ),
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Sidebar(),
        ),
      ),
    );
  }
}
