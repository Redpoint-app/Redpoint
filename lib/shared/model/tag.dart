class Tag {
  Tag(this._label);

  final String _label;

  String get label {
    return _label;
  }

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (other is Tag) {
      Tag o = other;
      return o._label == _label;
    } else {
      return false;
    }
  }
}
