import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meal_recommendations_a2/core/helper/build_menu_item.dart';
import 'package:meal_recommendations_a2/core/utiles/backend_endpoint.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = -1;
  String lastName = "Loading..."; // Initial placeholder text

  @override
  void initState() {
    super.initState();
    fetchLastName();
  }

  Future<void> fetchLastName() async {
    final userDoc = await FirebaseFirestore.instance.collection(BackendEndpoint.setUserData).doc('userId').get();
    setState(() {
      lastName = userDoc.data()?['lastName'] ?? 'No Name'; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xff001A3F),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 21.0),
                  child: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  lastName, // Display the fetched last name
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          MenuItem(
            imagePath: "assets/Home.png",
            title: "Home",
            index: 0,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          MenuItem(
            imagePath: "assets/Mask group.png",
            title: "Profile",
            index: 1,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          MenuItem(
            imagePath: "assets/love.png",
            title: "Favorite",
            index: 2,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          MenuItem(
            imagePath: "assets/settings.png",
            title: "Settings",
            index: 3,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(endIndent: 25, indent: 25),
          const SizedBox(height: 20.0),
          MenuItem(
            imagePath: "assets/log_out.png",
            title: "Logout",
            index: 4,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            },
          ),
        ],
      ),
    );
  }
}
