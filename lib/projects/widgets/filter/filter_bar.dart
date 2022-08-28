import 'package:flutter/material.dart';
import 'package:redpoint/shared/model/route_type.dart';
import 'package:redpoint/projects/widgets/filter/sort_button.dart';

import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<StatefulWidget> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  RouteType? _selectedType;

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
            bool active = type == _selectedType;

            return FilterButton(
              label: type.label,
              last: index == RouteType.values.length,
              onTap: () {
                setState(() {
                  _selectedType = active ? null : type;
                });
              },
              active: active,
            );
          }
        },
      ),
    );
  }
}
