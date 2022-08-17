import 'dart:collection';

import 'package:redpoint/model/completed_status.dart';
import 'package:redpoint/model/difficulty.dart';
import 'package:redpoint/model/route_type.dart';
import 'package:redpoint/model/status.dart';
import 'package:redpoint/model/tag.dart';

class ClimbingRoute {
  ClimbingRoute(this.title, this.date, this.type, this.grade, this.status,
      this.completedStatus, this.difficulty, this.tags, this.thoughts);

  String title;
  DateTime date;
  RouteType type;
  String grade;
  Status status;
  CompletedStatus? completedStatus;
  Difficulty difficulty;
  ListQueue<Tag> tags;
  String thoughts;

  @override
  String toString() {
    return "ClimbingRoute{\ntitle: $title, \ndate: $date, \ntype: $type, \ngrade: $grade, \nstatus: $status, \ncompletedStatus: $completedStatus, \ndifficulty: $difficulty, \ntags: ${tags.toString()}, \nthoughts: $thoughts}";
  }

  String getDateMessage() {
    DateTime now = DateTime.now();
    Duration diff = now.difference(date).abs();

    if (diff.inMinutes < 1) {
      return "A few seconds ago";
    } else if (diff.inHours < 1) {
      return "A few minutes ago";
    } else if (diff.inDays < 1) {
      return "A few hours ago";
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
}
