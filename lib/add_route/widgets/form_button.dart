
/// A button used on the Add Route form. Has an icon and a label. Additionally, a method should be specified
/// to handle on the onPressed event.
/// 
/// This widget is used as the "Choose location" and "Choose date" buttons on the add route page.

import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  const FormButton({super.key, required this.icon, required this.label, required this.onPressed});

  final IconData icon;
  final String label;
  final void Function() onPressed;

  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton.icon(
                onPressed: () {
                  widget.onPressed();
                },
                icon: Icon(widget.icon),
                label: Text(widget.label))));
  }
}
