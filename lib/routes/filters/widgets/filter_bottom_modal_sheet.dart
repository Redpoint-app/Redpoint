import 'package:flutter/material.dart';
import 'package:redpoint/routes/widgets/filter/filter_button.dart';
import 'package:redpoint/shared/widgets/custom_icon_button.dart';
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
      padding: const EdgeInsets.only(top: PaddingDimensions.lg),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: PaddingDimensions.verticalSpacing,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: IconDimensions.md + PaddingDimensions.lg,
                ),
                const Text(
                  "Filters",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: PaddingDimensions.lg),
                  child: CustomIconButton(
                    icon: Icons.close,
                    size: IconDimensions.md,
                    inkRadius: InkDimensions.mediumInk,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: const [
              Text('Type'),
              Text('Grade'),
              Text('Date range'),
              Text('Completed status'),
              Text('Difficulty'),
              Text('tags'),
            ],
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
