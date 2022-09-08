const months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String pastDateMessage(DateTime date) {
  DateTime now = DateTime.now();
  Duration diff = now.difference(date).abs();

  if (diff.inDays < 1) {
    return "Today";
  } else if (diff.inDays == 1) {
    return "Yesterday";
  } else if (diff.inDays < 7) {
    return "A few days ago";
  } else if (diff.inDays < 14) {
    return "Last week";
  } else if (diff.inDays < 30) {
    return "A few weeks ago";
  } else {
    // Days > 30
    int yearDiff = (date.year - now.year).abs();

    if (yearDiff <= 1) {
      int monthDiff = yearDiff == 1
          ? (now.month + (12 - date.month))
          : (now.month - date.month).abs();

      if (monthDiff == 0) {
        return "A few weeks ago";
      } else if (monthDiff == 1) {
        return "Last month";
      } else if (monthDiff < 12) {
        return "$monthDiff months ago";
      } else {
        return "Last year";
      }
    } else {
      return "$yearDiff years ago";
    }
  }
}
