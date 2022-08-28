/// A button in the bottom navbar. This widget makes reuse and styling easy.

import 'package:flutter/material.dart';

class LargeIconButton extends StatefulWidget {
  const LargeIconButton(
      {super.key,
      required this.icon,
      required this.onTap,
      this.color,
      this.inkColor});
  final IconData icon;
  final void Function() onTap;
  final Color? color;
  final Color? inkColor;

  @override
  State<LargeIconButton> createState() => _LargeIconButtonState();
}

class _LargeIconButtonState extends State<LargeIconButton> {
  @override
  Widget build(BuildContext context) {
    final Color inkColor = widget.inkColor ?? Theme.of(context).highlightColor;
    final Color? color = widget.color ?? Theme.of(context).iconTheme.color;

    return Ink(
        child: InkResponse(
      onTap: () {},
      highlightColor: inkColor,
      splashColor: inkColor,
      splashFactory: InkRipple.splashFactory,
      radius: 20,
      child: Icon(
        widget.icon,
        color: color,
        size: 28,
      ),
    ));
  }
}
