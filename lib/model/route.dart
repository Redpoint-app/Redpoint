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
}
