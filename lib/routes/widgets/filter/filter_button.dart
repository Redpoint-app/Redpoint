import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
    required this.label,
    required this.onTap,
    this.active,
    this.icon,
  });
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
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimary;
    final onSurface = theme.colorScheme.onSurface;
    bool active = widget.active ?? false;

    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2, bottom: 4),
      child: SizedBox(
        height: ContainerDimensions.heightSmall,
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            foregroundColor: active ? onPrimary : theme.highlightColor,
            backgroundColor: active ? theme.primaryColor : theme.cardColor,
            elevation: CardDimensions.elevation,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          child: Row(
            children: [
              if (widget.icon != null)
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Icon(
                    widget.icon,
                    size: IconDimensions.xs,
                    color: active ? onPrimary : onSurface,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  widget.label,
                  style: TextStyle(
                    color: active ? onPrimary : onSurface,
                    fontSize: TextDimensions.body,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
