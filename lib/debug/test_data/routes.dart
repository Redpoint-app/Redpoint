import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/climb_type/climb_type.dart';
import 'package:redpoint/database/models/grade/grade_system.dart';
import 'package:redpoint/database/models/route/route_difficulty.dart';
import 'package:redpoint/database/models/route/route_status.dart';

final List<RouteCompanion> testRoutes = [
  RouteCompanion(
    id: const Value(1),
    title: const Value("Big Orange"),
    date: Value(DateTime.parse("2019-06-26")),
    climbTypeId: Value(ClimbTypeEnum.boulder.index),
    gradeSystemId: Value(GradeSystemEnum.vScale.index),
    grade: const Value("V5"),
    status: Value(RouteStatusEnum.inProgress.index),
    difficulty: Value(RouteDifficultyEnum.easy.index),
    thoughts: const Value("Fun route, will get it soon."),
  ),
  RouteCompanion(
    id: const Value(2),
    title: const Value("Ka-blue-ey"),
    date: Value(DateTime.parse("2022-06-07")),
    climbTypeId: Value(ClimbTypeEnum.topRope.index),
    gradeSystemId: Value(GradeSystemEnum.yds.index),
    grade: const Value("5.11"),
    status: Value(RouteStatusEnum.inProgress.index),
    difficulty: Value(RouteDifficultyEnum.easy.index),
    thoughts: const Value("Example thoughts. Hello this is a test."),
  ),
  RouteCompanion(
    id: const Value(3),
    title: const Value("Alex Handhold and the Chrisp Sharma"),
    date: Value(DateTime.parse("2022-05-29")),
    climbTypeId: Value(ClimbTypeEnum.lead.index),
    gradeSystemId: Value(GradeSystemEnum.yds.index),
    grade: const Value("5.12"),
    status: Value(RouteStatusEnum.inProgress.index),
    difficulty: Value(RouteDifficultyEnum.intermediate.index),
    thoughts: const Value("Example thoughts. Hello this is a test."),
  ),
  RouteCompanion(
    id: const Value(4),
    title: const Value("This is a super long title for this climbing route"),
    date: Value(DateTime.parse("2022-01-29")),
    climbTypeId: Value(ClimbTypeEnum.boulder.index),
    gradeSystemId: Value(GradeSystemEnum.vScale.index),
    grade: const Value("V8"),
    status: Value(RouteStatusEnum.inProgress.index),
    difficulty: Value(RouteDifficultyEnum.easy.index),
    thoughts: const Value("Example thoughts. Hello this is a test."),
  ),
];
