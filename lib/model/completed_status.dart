enum CompletedStatus {
  onsight("Onsight"),
  flash("Flash"),
  redpoint("Redpoint"),
  topped("Topped");

  const CompletedStatus(this.label);
  final String label;
}