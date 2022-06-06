/// The navigation bar at the bottom of the screen

import 'package:flutter/material.dart';
import 'package:redpoint/pages/home_page.dart';
import 'package:redpoint/pages/profile_page.dart';
import 'package:redpoint/pages/projects_page.dart';
import 'package:redpoint/pages/social_page.dart';
import 'package:redpoint/widgets/nav/fab_placeholder.dart';

import 'nav_button.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0, // Margin between FAB and navbar
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                NavButton(buttonIcon: Icons.home, page: HomePage()),
                NavButton(buttonIcon: Icons.list, page: ProjectsPage()),
                FABPlaceholder(),
                NavButton(buttonIcon: Icons.show_chart, page: SocialPage()),
                NavButton(buttonIcon: Icons.person, page: ProfilePage()),
              ],
            )));
  }
}
