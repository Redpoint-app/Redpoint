import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  const FilterButton(
      {super.key,
      required this.label,
      required this.onTap,
      this.active,
      this.icon});
  final String label;
  final void Function() onTap;
  final bool? active;
  final IconData? icon;

  @override
  State<StatefulWidget> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    bool active = widget.active ?? false;

    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
      child: SizedBox(
        height: 40,
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
              foregroundColor: active
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).highlightColor, backgroundColor: active
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).cardColor,
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
                    color: active
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.label,
                  style: TextStyle(
                      color: active
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSurface,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
