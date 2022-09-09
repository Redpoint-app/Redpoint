/// The navigation bar at the bottom of the screen
import 'package:flutter/material.dart';
import 'package:redpoint/shared/navigation/navigation.dart';
import 'package:redpoint/shared/widgets/nav/fab_placeholder.dart';

import 'nav_button.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
    required this.pageTitle,
    required this.callback,
  });
  final String pageTitle;
  final void Function(int) callback;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    const double notchMargin = 8.0;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: notchMargin, // Margin between FAB and navbar
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
              page: homePageIndex,
            ),
            NavButton(
              label: "Routes",
              active: widget.pageTitle == "Routes",
              buttonIcon: Icons.list,
              callback: widget.callback,
              page: routesPageIndex,
            ),
            const FABPlaceholder(),
            NavButton(
              label: "Social",
              active: widget.pageTitle == "Social",
              buttonIcon: Icons.show_chart,
              callback: widget.callback,
              page: socialPageIndex,
            ),
            NavButton(
              label: "Profile",
              active: widget.pageTitle == "Profile",
              buttonIcon: Icons.person,
              callback: widget.callback,
              page: profilePageIndex,
            ),
          ],
        ),
      ),
    );
  }
}
