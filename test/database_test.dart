import 'package:dart_date/dart_date.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

import 'package:redpoint/database/database.dart';

void main() {
  late AppDatabase database;

  // Grade
  String gradeSystemId = "VSCALE";
  String gradeSystemLabel = "V-Scale";
  String gradeLabel = "V5";
  GradeSystemCompanion gradeSystem = GradeSystemCompanion(id: Value(gradeSystemId), label: Value(gradeSystemLabel));
  GradeCompanion grade = GradeCompanion(systemId: Value(gradeSystemId), grade: Value(gradeLabel));

  // Climb Type
  int climbTypeId = 1;
  String climbTypeLabel = "Boulder";
  ClimbTypeCompanion climbType = ClimbTypeCompanion(id: Value(climbTypeId), label: Value(climbTypeLabel));
  ClimbTypeToGradeSystemCompanion climbTypeToGradeSystem = ClimbTypeToGradeSystemCompanion(climbTypeId: Value(climbTypeId), gradeSystemId: Value(gradeSystemId));

  // Route
  String routeTitle = "Test Route 1";
  DateTime dateTimeNow = DateTime.now();
  int statusId = 1;
  String status1Label = "Completed";
  int completedStatusId = 1;
  String completedStatus1Label = "Onsight";
  int difficultyId = 1;
  String difficulty1Label = "Easy";
  String routeThoughts = "Fun Route!";

  RouteStatusCompanion routeStatus = RouteStatusCompanion(id: Value(statusId), label: Value(status1Label));
  RouteCompletedStatusCompanion routeCompletedStatus = RouteCompletedStatusCompanion(id: Value(completedStatusId), label: Value(completedStatus1Label));
  RouteDifficultyCompanion routeDifficulty = RouteDifficultyCompanion(id: Value(difficultyId), label: Value(difficulty1Label));
  RouteCompanion route = RouteCompanion(
      title: Value(routeTitle),
      date: Value(dateTimeNow),
      climbTypeId: Value(climbTypeId),
      gradeSystemId: Value(gradeSystemId),
      grade: Value(gradeLabel),
      status: Value(statusId),
      completedStatus: Value(completedStatusId),
      difficulty: Value(difficultyId),
      thoughts: Value(routeThoughts)
  );

  _initializeData() async {
    await database.gradeSystemDao.add(gradeSystem);
    await database.gradeDao.add(grade);

    await database.climbTypeDao.add(climbType);
    await database.climbTypeToGradeSystemDao.add(climbTypeToGradeSystem);

    await database.routeStatusDao.add(routeStatus);
    await database.routeCompletedStatusDao.add(routeCompletedStatus);
    await database.routeDifficultyDao.add(routeDifficulty);
  }

  setUp(() async {
    database = AppDatabase.test(NativeDatabase.memory(logStatements: true));
    await _initializeData();
  });

  tearDown(() async {
    await database.close();
  });

  test('Routes can be created', () async {
    final id = await database.routeDao.add(route);
    RouteData? retrievedRoute = await database.routeDao.getById(id);
    expect(retrievedRoute?.title, route.title.value);
    expect(retrievedRoute?.date.isSameDay(route.date.value), true);
    expect(retrievedRoute?.climbTypeId, route.climbTypeId.value);
    expect(retrievedRoute?.gradeSystemId, route.gradeSystemId.value);
    expect(retrievedRoute?.grade, route.grade.value);
    expect(retrievedRoute?.status, route.status.value);
    expect(retrievedRoute?.completedStatus, route.completedStatus.value);
    expect(retrievedRoute?.difficulty, route.difficulty.value);
    expect(retrievedRoute?.thoughts, route.thoughts.value);
  });
}
