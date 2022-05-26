enum Progress {
  wantToTry("Want to try"),
  inProgress("In progress"),
  completed("Completed");

  const Progress(this.label);
  final String label;
}