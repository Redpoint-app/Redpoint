import 'package:flutter/material.dart';
import 'package:redpoint/routes/widgets/filter/filter_button.dart';

class SortButton extends StatefulWidget {
  const SortButton({super.key, required this.label, this.first});
  final String label;
  final bool? first;

  @override
  State<StatefulWidget> createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  bool _ascending = false;

  @override
  Widget build(BuildContext context) {
    return FilterButton(
      label: widget.label,
      first: widget.first,
      icon: _ascending ? Icons.arrow_downward : Icons.arrow_upward,
      onTap: () {
        setState(() {
          _ascending = !_ascending;
        });
      },
    );
  }
}
