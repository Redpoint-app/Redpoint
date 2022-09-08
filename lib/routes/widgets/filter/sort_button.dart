import 'package:flutter/material.dart';
import 'package:redpoint/routes/widgets/filter/filter_button.dart';

class SortButton extends StatefulWidget {
  const SortButton({super.key, required this.label});
  final String label;

  @override
  State<StatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  bool _ascending = false;

  void _toggleAscending() {
    setState(() {
      _ascending = !_ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: widget.label,
      icon: _ascending ? Icons.arrow_downward : Icons.arrow_upward,
      onTap: _toggleAscending,
    );
  }
}
