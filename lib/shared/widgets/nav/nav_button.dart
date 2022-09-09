/// A button in the bottom navbar. This widget makes reuse and styling easy.
import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class NavButton extends StatefulWidget {
  const NavButton({
    super.key,
    required this.buttonIcon,
    required this.page,
    required this.active,
    required this.label,
    required this.callback,
  });
  final IconData buttonIcon;
  final int page;
  final bool active;
  final String label;
  final void Function(int) callback;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;

    final Color inkColor =
        widget.active ? primaryColor.withOpacity(0.2) : theme.highlightColor;
    final Color? color = widget.active ? primaryColor : theme.iconTheme.color;

    return Ink(
      child: InkResponse(
        onTap: () => widget.callback(widget.page),
        highlightColor: inkColor,
        splashColor: inkColor,
        splashFactory: InkRipple.splashFactory,
        radius: InkDimensions.largeInk,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(
            widget.buttonIcon,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              widget.label,
              style: TextStyle(color: color, fontSize: TextDimensions.body),
            ),
          ),
        ]),
      ),
    );
  }
}
