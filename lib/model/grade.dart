class Grade {
  Grade(this._label);

  final String _label;

  String get label {
    return _label;
  }

  @override
  bool operator == (Object other) {
    if (other is Grade) {
      Grade o = other;
      return o._label == _label;
    } else {
      return false;
    }
  }
}