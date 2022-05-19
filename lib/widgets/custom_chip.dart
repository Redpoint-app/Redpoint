import 'package:flutter/material.dart';

class CustomChip extends StatefulWidget {
  const CustomChip(
      {super.key,
      required this.label,
      required this.selected,
      this.onSelected});

  final String label;
  final bool selected;
  final void Function(bool selected)? onSelected;

  @override
  _CustomChipState createState() => _CustomChipState();
}

class _CustomChipState extends State<CustomChip> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: ChoiceChip(
          label: Text(widget.label),
          selected: widget.selected,
          selectedColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).chipTheme.disabledColor,
          onSelected: (bool s) {
            widget.onSelected!(widget.selected);
          },
          labelStyle: TextStyle(
              color: widget.selected
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurface)),
    );
  }
}
