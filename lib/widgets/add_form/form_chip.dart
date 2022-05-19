import 'package:flutter/material.dart';

class FormChip extends StatefulWidget {
  const FormChip(
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
  _FormChipState createState() => _FormChipState();
}

class _FormChipState extends State<FormChip> {
  @override
  Widget build(BuildContext context) {
    bool isSelected = widget.index == widget.selectedIndex;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
          label: Text(widget.label),
          selected: isSelected,
          selectedColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).chipTheme.disabledColor,
          onSelected: (bool s) {
            int? newIndex = isSelected ? null : widget.index;

            setState(() {
              isSelected = !isSelected;
            });

            widget.callback(newIndex);
          },
          labelStyle: TextStyle(
              color: isSelected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface)),
    );
  }
}
