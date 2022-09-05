/// A blank icon button that doesn't do anything. Strictly for the purpose of evenly
/// spacing elements in the bottom app bar. Takes the place of the FAB, since the FAB
/// isn't considered when spacing elements.

import 'package:flutter/material.dart';

class FABPlaceholder extends StatelessWidget {
  const FABPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const IconButton(onPressed: null, icon: Icon(null));
  }
}
