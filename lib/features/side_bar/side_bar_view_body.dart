import 'package:flutter/material.dart';
import 'package:meal_recommendations_a2/core/helper/build_menu_item.dart';
import 'package:meal_recommendations_a2/core/helper/last_name_sign.dart';
import 'package:meal_recommendations_a2/core/utiles/assets.dart';
import 'package:meal_recommendations_a2/core/utiles/strings.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int selectedIndex = -1;
  String lastName = "Loading..."; // Initial placeholder text
  final UserService userService = UserService(); // Create an instance of UserService

  @override
  void initState() {
    super.initState();
    fetchLastName();
  }

  Future<void> fetchLastName() async {
    String fetchedName = await userService.fetchLastName();
    setState(() {
      lastName = fetchedName;
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
            imagePath: Assets.home,
            title: AppStrings.home,
            index: 0,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            },
          ),
          MenuItem(
            imagePath: Assets.maskGroup,
            title: AppStrings.profileHintText,
            index: 1,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            },
          ),
          MenuItem(
            imagePath: Assets.favorite,
            title: AppStrings.favorite,
            index: 2,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            },
          ),
          MenuItem(
            imagePath: Assets.settings,
            title: AppStrings.settings,
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
            imagePath: Assets.logout,
            title: AppStrings.logout,
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