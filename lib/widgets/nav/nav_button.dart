
/// A button in the bottom navbar. This widget makes reuse and styling easy.

import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key, required this.buttonIcon});
  final IconData buttonIcon;

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // navigate to given page
        },
        icon: Icon(widget.buttonIcon));
  }
}
