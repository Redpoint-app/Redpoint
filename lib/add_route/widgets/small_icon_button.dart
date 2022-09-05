import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';

class SmallIconButton extends StatefulWidget {
  const SmallIconButton(
      {super.key, required this.icon, required this.onPressed, this.color});
  final IconData icon;
  final void Function() onPressed;
  final Color? color;

  @override
  State<SmallIconButton> createState() => _SmallIconButtonState();
}

class _SmallIconButtonState extends State<SmallIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
          color: widget.color ?? Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(30.0))),
      child: Center(
          child: CustomIconButton(
        icon: widget.icon,
        size: 18.0,
        onTap: widget.onPressed,
      )),
    );
  }
}
