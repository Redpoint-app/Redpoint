import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({super.key, required this.label, this.first});
  final String label;
  final bool? first;

  @override
  State<StatefulWidget> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: (widget.first ?? false) ? 30.0 : 4.0),
        child: SizedBox(
            height: 40,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).cardColor,
                    elevation: .5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: Text(widget.label,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontSize: 14)))));
  }
}
