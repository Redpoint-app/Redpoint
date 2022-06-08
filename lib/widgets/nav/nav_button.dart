/// A button in the bottom navbar. This widget makes reuse and styling easy.

import 'package:flutter/material.dart';

class NavButton extends StatefulWidget {
  const NavButton({super.key, required this.buttonIcon, required this.page, required this.active});
  final IconData buttonIcon;
  final Widget page;
  final bool active;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          // navigate to given page
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    widget.page,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ));
        },
        icon: Icon(
          widget.buttonIcon,
          color: widget.active ? Theme.of(context).primaryColor : Theme.of(context).iconTheme.color,
        ));
  }
}
