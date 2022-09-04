import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:redpoint/shared/model/route_type.dart';
import 'package:redpoint/routes/widgets/filter/sort_button.dart';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 5),
              child: SortButton(
                label: "Latest",
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 5, right: 30),
                child: Row(
                  children: RouteType.values.map((type) {
                    bool active = type == _selectedType;

                    return FilterButton(
                      label: type.label,
                      onTap: () {
                        setState(() {
                          _selectedType = active ? null : type;
                        });
                      },
                      active: active,
                    );
                  }).toList(),
                ))
          ]),
        ));
  }
}
