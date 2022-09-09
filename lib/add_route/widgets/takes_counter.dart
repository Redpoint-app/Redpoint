import 'package:flutter/material.dart';
import 'package:redpoint/add_route/widgets/small_icon_button.dart';
import 'package:redpoint/shared/widgets/dimensions.dart';

class TakesCounter extends StatefulWidget {
  const TakesCounter({super.key});

  @override
  State<TakesCounter> createState() => _TakesCounterState();
}

class _TakesCounterState extends State<TakesCounter> {
  int count = 1;
  final minCount = 1;

  void _incrementCount() {
    setState(() {
      count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (count >= minCount + 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final disabledColor = theme.disabledColor;

    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingDimensions.lg,
        bottom: PaddingDimensions.sm,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SmallIconButton(
              color: disabledColor,
              icon: Icons.remove,
              onPressed: _decrementCount,
            ),
          ),
          Text("$count ${count == 1 ? 'take' : 'takes'}"),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SmallIconButton(
              color: disabledColor,
              icon: Icons.add,
              onPressed: _incrementCount,
            ),
          ),
        ],
      ),
    );
  }
}
