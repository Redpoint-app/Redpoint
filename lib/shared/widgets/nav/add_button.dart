/// The add button in the bottom navbar.
import 'package:flutter/material.dart';
import 'package:redpoint/add_route/add_page.dart';
import 'package:redpoint/shared/navigation/open_page.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Add Route",
      child: const Icon(Icons.add),
      onPressed: () => Navigator.of(context).push(openPage(const AddPage())),
    );
  }
}
