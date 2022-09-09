/// A button in the bottom navbar. This widget makes reuse and styling easy.
import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

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
    final theme = Theme.of(context);
    final Color inkColor = widget.inkColor ?? theme.highlightColor;

    return Ink(
      child: InkResponse(
        onTap: widget.onTap,
        highlightColor: inkColor,
        splashColor: inkColor,
        splashFactory: InkRipple.splashFactory,
        radius: widget.inkRadius ??
            (widget.size / IconDimensions.radiusToSizeRatio),
        child: Icon(
          widget.icon,
          color: widget.color ?? theme.iconTheme.color,
          size: widget.size,
        ),
      ),
    );
  }
}
