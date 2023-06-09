import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, VoidCallback taphandler) {
      return ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: taphandler,
      );
    }

    return Drawer(
        child: Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).primaryColor,
          child: const Text(
            "Cooking",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 30, color: Colors.white),
          ),
        ),
        buildListTile("Meals", Icons.restaurant, () {
          Navigator.of(context).pushReplacementNamed('/');
        }),
        buildListTile("Settings", Icons.settings, () {
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        })
      ],
    ));
  }
}
