/// A basic page template that includes the bottom navbar. Avoids code reuse.

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/nav/add_button.dart';
import 'package:flutter/services.dart';

import '../nav/bottom_navbar.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({super.key, required this.title, required this.body});
  final String title;
  final Widget body;

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarBrightness: Theme.of(context).brightness,
            statusBarIconBrightness:
                Theme.of(context).brightness == Brightness.dark
                    ? Brightness.light
                    : Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(child: widget.body),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AddButton(),
        bottomNavigationBar: BottomNavbar(pageTitle: widget.title));
  }
}
