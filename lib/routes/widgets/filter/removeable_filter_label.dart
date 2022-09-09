import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class RemoveableFilterLabel extends StatefulWidget {
  const RemoveableFilterLabel({
    super.key,
    required this.label,
    required this.onTap,
  });
  final String label;
  final void Function() onTap;

  @override
  State<StatefulWidget> createState() => _RemoveableFilterLabelState();
}

class _RemoveableFilterLabelState extends State<RemoveableFilterLabel> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.onPrimary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: PhysicalModel(
        elevation: CardDimensions.elevation,
        color: Colors.black,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: CustomIconButton(
                    icon: Icons.cancel_rounded,
                    size: IconDimensions.sm,
                    color: onPrimary,
                    inkColor: onPrimary,
                    onTap: widget.onTap,
                  ),
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: TextDimensions.body,
                    fontWeight: FontWeight.w500,
                    color: onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
