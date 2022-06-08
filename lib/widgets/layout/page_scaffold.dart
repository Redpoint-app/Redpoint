/// A basic page template that includes the bottom navbar. Avoids code reuse.

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/nav/add_button.dart';

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
        body: Stack(
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, .5),
                    Color.fromRGBO(0, 0, 0, 0)
                  ],
                ),
              ),
            ),
            SafeArea(
              bottom: false,
              child: SingleChildScrollView(child: widget.body),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const AddButton(),
        bottomNavigationBar: BottomNavbar(pageTitle: widget.title));
  }
}
