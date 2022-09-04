import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/projects/filters/filter.dart';

class FilterChangeNotifier extends ChangeNotifier {
  final List<Filter> _filters = List.empty(growable: true);

  UnmodifiableListView<Filter> get filters => UnmodifiableListView(_filters);

  void add<T>(Filter filter) {
    if (_filters.every((currentFilter) => currentFilter is! T)) {
      _filters.add(filter);
      notifyListeners();
    }
  }

  void remove<T>() {
    for (var filter in _filters) {
      if (filter is T) {
        _filters.remove(filter);
      }
    }

    notifyListeners();
  }

  void clear() {
    _filters.clear();
    notifyListeners();
  }
}
