import 'package:flutter/material.dart';
import 'package:redpoint/widgets/projects_filter/filter_button.dart';

class SortButton extends StatefulWidget {
  const SortButton({super.key, required this.label, this.first});
  final String label;
  final bool? first;

  @override
  State<StatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: widget.label,
      first: widget.first,
      icon: Icons.arrow_upward,
    );
  }
}
