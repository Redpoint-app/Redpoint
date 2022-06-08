/// The navigation bar at the bottom of the screen

import 'package:flutter/material.dart';
import 'package:redpoint/pages/home_page.dart';
import 'package:redpoint/pages/profile_page.dart';
import 'package:redpoint/pages/projects_page.dart';
import 'package:redpoint/pages/social_page.dart';
import 'package:redpoint/widgets/nav/fab_placeholder.dart';

import 'nav_button.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
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
          children: <Widget>[
            NavButton(
                active: widget.pageTitle == "Home",
                buttonIcon: Icons.home,
                page: const HomePage()),
            NavButton(
                active: widget.pageTitle == "Projects",
                buttonIcon: Icons.list,
                page: const ProjectsPage()),
            const FABPlaceholder(),
            NavButton(
                active: widget.pageTitle == "Social",
                buttonIcon: Icons.show_chart,
                page: const SocialPage()),
            NavButton(
                active: widget.pageTitle == "Profile",
                buttonIcon: Icons.person,
                page: const ProfilePage()),
          ],
        ),
      ),
    );
  }
}
