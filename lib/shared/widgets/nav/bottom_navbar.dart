/// The navigation bar at the bottom of the screen
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/layout/page_template.dart';
import 'package:redpoint/shared/widgets/nav/fab_placeholder.dart';

import 'nav_button.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({
    super.key,
    required this.pageTitle,
    required this.pages,
    required this.callback,
  });
  final String pageTitle;
  final List<PageTemplate> pages;
  final void Function(int) callback;

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    const double notchMargin = 8.0;
    int halfLength = widget.pages.length ~/ 2;

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: notchMargin, // Margin between FAB and navbar
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15, top: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.pages.foldIndexed<List<Widget>>(
            [],
            (index, elements, page) {
              if (index == halfLength) {
                elements.add(const FABPlaceholder());
              }

              return [
                ...elements,
                NavButton(
                  buttonIcon: page.icon,
                  page: index,
                  active: widget.pageTitle == page.title,
                  label: page.title,
                  callback: widget.callback,
                ),
              ];
            },
          ),
        ),
      ),
    );
  }
}
