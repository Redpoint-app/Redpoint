import 'dart:collection';

import 'package:redpoint/model/completed_status.dart';
import 'package:redpoint/model/difficulty.dart';
import 'package:redpoint/model/route_type.dart';
import 'package:redpoint/model/status.dart';
import 'package:redpoint/model/tag.dart';
import 'package:redpoint/model/v_scale.dart';

class Route {
  Route(this.title, this.date, this.type, this.grade, this.status, this.completedStatus, this.difficulty, this.tags, this.thoughts);

  String title;
  DateTime date;
  RouteType type;
  // TODO: Update grade to be generic
  VScale grade;
  Status status;
  CompletedStatus? completedStatus;
  Difficulty difficulty;
  ListQueue<Tag> tags;
  String thoughts;
}