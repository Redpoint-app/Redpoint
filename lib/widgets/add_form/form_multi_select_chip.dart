
import 'package:flutter/material.dart';
import 'package:redpoint/widgets/custom_chip.dart';

class FormMultiSelectChip extends StatefulWidget {
  const FormMultiSelectChip({super.key, required this.label});

  final String label;

  @override
  _FormMultiSelectChipState createState() => _FormMultiSelectChipState();
}

class _FormMultiSelectChipState extends State<FormMultiSelectChip> {
  @override
  Widget build(BuildContext context) {
    return CustomChip(label: widget.label, selected: true);
  }
}