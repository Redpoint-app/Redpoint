
/// The navigation bar at the bottom of the screen

import 'package:flutter/material.dart';
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
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const NavButton(buttonIcon: Icons.home),
            const NavButton(buttonIcon: Icons.list),
            FABPlaceholder(),
            const NavButton(buttonIcon: Icons.show_chart),
            const NavButton(buttonIcon: Icons.person),
          ],
        ));
  }
}
