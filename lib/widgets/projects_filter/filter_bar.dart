import 'package:flutter/material.dart';
import 'package:redpoint/widgets/projects_filter/sort_button.dart';

import '../../model/route_type.dart';
import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<StatefulWidget> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  @override
  Widget build(Object context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: RouteType.values.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.only(right: 8),
              child: SortButton(
                label: "Latest",
                first: true,
              ),
            );
          } else {
            RouteType type = RouteType.values[index - 1];
            return FilterButton(
                label: type.label, last: index == RouteType.values.length);
          }
        },
      ),
    );
  }
}
