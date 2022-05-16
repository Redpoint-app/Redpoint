
/// The add button in the bottom navbar.

import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: "Add Route", child: const Icon(Icons.add), onPressed: () {});
  }
}
