/// A chip that communicates with other chips to only allow 1 to be selected at a time. The chip has
/// a label, an index (of the chip), a selected index (the index of the currently selected chip, null
/// if none), and a callback to the parent that sets the selected index to the value that is provided
/// as a parameter.
///
/// This widget is used in the status section of the Add route page.

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/custom_chip.dart';

import '../../model/progress.dart';

class FormSelectChip extends StatefulWidget {
  const FormSelectChip(
      {super.key,
      required this.label,
      required this.value,
      required this.selectedValue,
      required this.callback});

  final String label;
  final Progress value;
  final Progress? selectedValue;
  final void Function(Progress? selectedValue) callback;

  @override
  _FormSelectChipState createState() => _FormSelectChipState();
}

class _FormSelectChipState extends State<FormSelectChip> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.value == widget.selectedValue;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CustomChip(
          label: widget.label,
          selected: isSelected,
          onSelected: (bool selected) {
            Progress? newValue = isSelected ? null : widget.value;

            widget.callback(newValue);
          },
        ));
  }
}
