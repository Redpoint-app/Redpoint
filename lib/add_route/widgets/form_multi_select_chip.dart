import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class FormMultiSelectChip<T> extends StatefulWidget {
  const FormMultiSelectChip({
    super.key,
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
  final void Function(ListQueue<T>) callback;

  @override
  State<FormMultiSelectChip> createState() => _FormMultiSelectChipState<T>();
}

class _FormMultiSelectChipState<T> extends State<FormMultiSelectChip> {
  void _handleChoiceChipSelect(bool selected) {
    if (!selected) {
      widget.callback(widget.values.foldIndexed<ListQueue<T>>(
        ListQueue<T>(),
        (index, valuesAccumulator, currentValue) {
          if (currentValue == widget.value) {
            return valuesAccumulator;
          } else {
            valuesAccumulator.add(currentValue);
            return valuesAccumulator;
          }
        },
      ));
    } else {
      var newValues = widget.values.foldIndexed<ListQueue<T>>(
        ListQueue<T>(),
        (index, valuesAccumulator, currentValue) {
          if (widget.values.length == widget.maxLength && index == 0) {
            return valuesAccumulator;
          } else {
            valuesAccumulator.add(currentValue);
            return valuesAccumulator;
          }
        },
      );

      newValues.add(widget.value);
      widget.callback(newValues);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.label),
      selected: widget.values.contains(widget.value),
      onSelected: _handleChoiceChipSelect,
    );
  }
}
