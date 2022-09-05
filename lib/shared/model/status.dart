enum Status {
  wantToTry("Want to try"),
  inProgress("In progress"),
  completed("Completed");

  const Status(this.label);
  final String label;
}
