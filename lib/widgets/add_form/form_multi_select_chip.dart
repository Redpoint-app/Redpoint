import 'dart:collection';

import 'package:flutter/material.dart';

class FormMultiSelectChip<T> extends StatefulWidget {
  const FormMultiSelectChip(
      {super.key,
      required this.label,
      required this.value,
      required this.values,
      required this.maxLength,
      required this.callback,
      });

  final String label;
  final T value;
  final ListQueue<T> values;
  final int maxLength;
  final void Function() callback;

  @override
  State<FormMultiSelectChip> createState() => _FormMultiSelectChipState<T>();
}

class _FormMultiSelectChipState<T> extends State<FormMultiSelectChip> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: widget.values.contains(widget.value),
      onSelected: (bool selected) {
        if (!selected) {
          widget.values.remove(widget.value);
        } else {
          if (widget.values.length == widget.maxLength) {
            widget.values.removeFirst();
          }

          widget.values.add(widget.value);
        }

        widget.callback();
      },
    );
  }
}
