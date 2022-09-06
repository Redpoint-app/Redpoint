import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:redpoint/database/models/climb_type/climb_type.dart';
import 'package:redpoint/routes/widgets/filter/removeable_filter_label.dart';
import 'package:redpoint/routes/widgets/filter/sort_button.dart';
import 'package:redpoint/shared/providers/filter_change_notifier.dart';

import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  const FilterBar({super.key});

  @override
  State<StatefulWidget> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  ClimbTypeEnum? _selectedType;

  @override
  Widget build(Object context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 5),
          child: SortButton(
            label: "Latest",
          ),
        ),
        Consumer<FilterChangeNotifier>(
            builder: (context, filterChangeNotifier, child) {
          return filterChangeNotifier.numFilters == 0
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: filterChangeNotifier.filters
                        .map((filter) => RemoveableFilterLabel(
                            label: filter.label,
                            onTap: () {
                              filterChangeNotifier
                                  .removeByType(filter.runtimeType);
                            }))
                        .toList(),
                  ),
                );
        }),
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 30),
            child: Row(
              children: ClimbTypeEnum.values.map((type) {
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
    );
  }
}
