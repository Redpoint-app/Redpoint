import 'package:dart_date/dart_date.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/climb_type/climb_type.dart';
import 'package:redpoint/database/models/grade/grade_system.dart';
import 'package:redpoint/database/models/route/route_completed_status.dart';
import 'package:redpoint/database/models/route/route_difficulty.dart';
import 'package:redpoint/database/models/route/route_status.dart';

void main() {
  late AppDatabase database;

  // Route
  String routeTitle = "Test Route 1";
  DateTime dateTimeNow = DateTime.now();
  String grade = "5.8";
  String routeThoughts = "Fun Route!";

  RouteCompanion route = RouteCompanion(
      title: Value(routeTitle),
      date: Value(dateTimeNow),
      climbTypeId: Value(ClimbTypeEnum.topRope.index),
      gradeSystemId: Value(GradeSystemEnum.yds.index),
      grade: Value(grade),
      status: Value(RouteStatusEnum.completed.index),
      completedStatus: Value(RouteCompletedStatusEnum.onsight.index),
      difficulty: Value(RouteDifficultyEnum.intermediate.index),
      thoughts: Value(routeThoughts)
  );

  setUp(() async {
    database = AppDatabase.test(NativeDatabase.memory(logStatements: true));
  });

  tearDown(() async {
    await database.close();
  });

  test('Routes CRUD', () async {
    final insertedRoute = await database.routeDao.insertReturning(route); // CREATE

    RouteData? retrievedRoute = await database.routeDao.getById(insertedRoute.id); // READ
    expect(retrievedRoute?.title, route.title.value);
    expect(retrievedRoute?.date.isSameDay(route.date.value), true);
    expect(retrievedRoute?.climbTypeId, route.climbTypeId.value);
    expect(retrievedRoute?.gradeSystemId, route.gradeSystemId.value);
    expect(retrievedRoute?.grade, route.grade.value);
    expect(retrievedRoute?.status, route.status.value);
    expect(retrievedRoute?.completedStatus, route.completedStatus.value);
    expect(retrievedRoute?.difficulty, route.difficulty.value);
    expect(retrievedRoute?.thoughts, route.thoughts.value);

    await database.routeDao.updateById(insertedRoute.id, const RouteCompanion(title: Value("Test Route 2"))); // UPDATE
    retrievedRoute = await database.routeDao.getById(insertedRoute.id);
    expect(retrievedRoute?.title, "Test Route 2");

    await database.routeDao.deleteById(insertedRoute.id); // DELETE
    retrievedRoute = await database.routeDao.getById(insertedRoute.id);
    expect(retrievedRoute, null);

  });

  test('Tag CRUD', () async {
    TagCompanion tag = const TagCompanion(label: Value("Crimpy"));  // CREATE
    final insertedTag =  await database.tagDao.insertReturning(tag);

    TagData? retrievedTag = await database.tagDao.getById(insertedTag.id); // READ
    expect(retrievedTag?.label, "Crimpy");

    await database.tagDao.updateById(insertedTag.id, const TagCompanion(label: Value("Juggy"))); // UPDATE
    retrievedTag = await database.tagDao.getById(insertedTag.id);
    expect(retrievedTag?.label, "Juggy");

    await database.tagDao.deleteById(insertedTag.id); // DELETE
    retrievedTag = await database.tagDao.getById(insertedTag.id);
    expect(retrievedTag, null);
  });
}
