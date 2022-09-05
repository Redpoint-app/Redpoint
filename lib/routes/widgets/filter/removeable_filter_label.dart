import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: PhysicalModel(
        elevation: 0.5,
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(12),
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
                      icon: Icons.cancel_outlined,
                      size: 17,
                      inkRadius: 10,
                      inkColor: Theme.of(context).colorScheme.onPrimary,
                      onTap: widget.onTap),
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
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
