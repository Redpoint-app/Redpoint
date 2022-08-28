import 'package:redpoint/shared/model/v_scale.dart';
import 'package:redpoint/shared/model/yds.dart';
import 'grade.dart';

enum RouteType {
  topRope("Top Rope", YDS()),
  boulder("Boulder", VScale()),
  lead("Lead", YDS());

  const RouteType(this.label, this.grade);
  final String label;
  final Grade grade;
}
