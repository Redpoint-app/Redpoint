/// The navigation bar at the bottom of the screen

import 'package:flutter/material.dart';
import 'package:redpoint/pages/home_page.dart';
import 'package:redpoint/pages/profile_page.dart';
import 'package:redpoint/pages/projects_page.dart';
import 'package:redpoint/pages/social_page.dart';
import 'package:redpoint/widgets/layout/page_template.dart';
import 'package:redpoint/widgets/nav/fab_placeholder.dart';

import 'nav_button.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar(
      {super.key, required this.pageTitle, required this.callback});
  final String pageTitle;
  final void Function(int) callback;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0, // Margin between FAB and navbar
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            NavButton(
              label: "Home",
              active: widget.pageTitle == "Home",
              buttonIcon: Icons.home,
                callback: widget.callback,
              page: 0,
            ),
            NavButton(
                label: "Projects",
                active: widget.pageTitle == "Projects",
                buttonIcon: Icons.list,
                callback: widget.callback,
                page: 1),
            const FABPlaceholder(),
            NavButton(
                label: "Social",
                active: widget.pageTitle == "Social",
                buttonIcon: Icons.show_chart,
                callback: widget.callback,
                page: 2),
            NavButton(
                label: "Profile",
                active: widget.pageTitle == "Profile",
                buttonIcon: Icons.person,
                callback: widget.callback,
                page: 3),
          ],
        ),
      ),
    );
  }
}
