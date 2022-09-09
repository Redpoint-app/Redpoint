import 'package:flutter/material.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class FilterBottomModalSheet extends StatefulWidget {
  const FilterBottomModalSheet({super.key});

  @override
  State<StatefulWidget> createState() => _FilterBottomModalSheetState();
}

class _FilterBottomModalSheetState extends State<FilterBottomModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: PaddingDimensions.md),
      child: Column(
        children: const [
          Text(
            "Filters",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
