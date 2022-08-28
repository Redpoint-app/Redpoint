/// A button in the bottom navbar. This widget makes reuse and styling easy.

import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.size,
    required this.onTap,
    this.color,
    this.inkColor,
    this.inkRadius,
  });
  final IconData icon;
  final double size;
  final void Function() onTap;
  final Color? color;
  final Color? inkColor;
  final double? inkRadius;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    final Color inkColor = widget.inkColor ?? Theme.of(context).highlightColor;

    return Ink(
        child: InkResponse(
      onTap: () {},
      highlightColor: inkColor,
      splashColor: inkColor,
      splashFactory: InkRipple.splashFactory,
      radius: widget.inkRadius ?? (widget.size / 1.4),
      child: Icon(
        widget.icon,
        color: widget.color ?? Theme.of(context).iconTheme.color,
        size: widget.size,
      ),
    ));
  }
}
