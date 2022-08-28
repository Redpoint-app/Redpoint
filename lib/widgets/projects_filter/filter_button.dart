import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(
      {super.key, required this.label, this.first, this.last, this.icon});
  final String label;
  final bool? first;
  final bool? last;
  final IconData? icon;

  @override
  State<StatefulWidget> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: (widget.first ?? false) ? 30.0 : 4.0,
          right: (widget.last ?? false) ? 30.0 : 4.0),
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Theme.of(context).cardColor,
              elevation: .5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          child: Row(
            children: [
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    widget.icon,
                    size: 16,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              Text(
                widget.label,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
