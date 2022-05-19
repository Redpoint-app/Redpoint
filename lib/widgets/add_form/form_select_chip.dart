/// A chip that communicates with other chips to only allow 1 to be selected at a time. The chip has
/// a label, an index (of the chip), a selected index (the index of the currently selected chip, null
/// if none), and a callback to the parent that sets the selected index to the value that is provided
/// as a parameter.
///
/// This widget is used in the status section of the Add route page.

import 'package:flutter/material.dart';
import 'package:redpoint/widgets/custom_chip.dart';

class FormSelectChip extends StatefulWidget {
  const FormSelectChip(
      {super.key,
      required this.label,
      required this.index,
      required this.selectedIndex,
      required this.callback});

  final String label;
  final int index;
  final int? selectedIndex;
  final void Function(int? index) callback;

  @override
  _FormSelectChipState createState() => _FormSelectChipState();
}

class _FormSelectChipState extends State<FormSelectChip> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.index == widget.selectedIndex;

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: CustomChip(
          label: widget.label,
          selected: isSelected,
          onSelected: (bool selected) {
            int? newIndex = isSelected ? null : widget.index;

            widget.callback(newIndex);
          },
        ));
  }
}
