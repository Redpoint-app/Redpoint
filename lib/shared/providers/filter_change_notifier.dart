import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:redpoint/routes/filters/filter.dart';

class FilterChangeNotifier extends ChangeNotifier {
  final List<Filter> _filters = List.empty(growable: true);

  UnmodifiableListView<Filter> get filters => UnmodifiableListView(_filters);
  int get numFilters => _filters.length;

  void add<T>(Filter filter) {
    if (_filters.every((currentFilter) => currentFilter is! T)) {
      _filters.add(filter);
      notifyListeners();
    }
  }

  void removeByType(Type t) {
    int? index;

    for (var filterIndex = 0; filterIndex < numFilters; filterIndex++) {
      if (_filters[filterIndex].runtimeType == t) {
        index = filterIndex;
      }
    }

    if (index != null) {
      _filters.removeAt(index);
    }

    notifyListeners();
  }

  void removeByLabel(String label) {
    int? index;

    for (var filterIndex = 0; filterIndex < numFilters; filterIndex++) {
      if (_filters[filterIndex].label == label) {
        index = filterIndex;
      }
    }

    if (index != null) {
      _filters.removeAt(index);
    }

    notifyListeners();
  }

  void clear() {
    _filters.clear();
    notifyListeners();
  }
}
