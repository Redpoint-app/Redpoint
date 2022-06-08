import 'package:flutter/material.dart';

class SmallIconButton extends StatefulWidget {
  const SmallIconButton({super.key, required this.icon, required this.onPressed, this.color});
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
            child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  widget.onPressed();
                },
                icon: Icon(widget.icon,
                size: 18.0
                ))));
  }
}
