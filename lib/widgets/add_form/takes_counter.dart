import 'package:flutter/material.dart';
import 'package:redpoint/widgets/add_form/small_icon_button.dart';

class TakesCounter extends StatefulWidget {
  const TakesCounter({super.key});

  @override
  State<TakesCounter> createState() => _TakesCounterState();
}

class _TakesCounterState extends State<TakesCounter> {
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 18, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SmallIconButton(
                  color: Theme.of(context).disabledColor,
                  icon: Icons.remove,
                  onPressed: () {
                    setState(() {
                      if (count >= 2) {
                        count--;
                      }
                    });
                  },
                )),
            Text("$count ${count == 1 ? 'take' : 'takes'}"),
            Padding(
                padding: const EdgeInsets.only(left: 8),
                child: SmallIconButton(
                  color: Theme.of(context).disabledColor,
                  icon: Icons.add,
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                  },
                )),
          ],
        ));
  }
}
