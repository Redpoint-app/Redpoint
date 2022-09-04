import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:redpoint/debug/load_test_data.dart';

import 'models/climb_type/climb_type.dart';
import 'models/climb_type/climb_type_to_grade_system.dart';
import 'models/grade/grade.dart';
import 'models/grade/grade_system.dart';
import 'models/route/route.dart';
import 'models/route/route_status.dart';
import 'models/route/route_completed_status.dart';
import 'models/route/route_difficulty.dart';
import 'models/tag/route_tag.dart';
import 'models/tag/tag.dart';


// Generated by drift_dev when running `flutter pub run build_runner build`
part 'database.g.dart';

const List<Type> tables = [
  ClimbType,
  ClimbTypeToGradeSystem,
  Grade,
  GradeSystem,
  Route,
  RouteStatus,
  RouteCompletedStatus,
  RouteDifficulty,
  RouteTag,
  Tag
];

const List<Type> daos = [
  ClimbTypeDao,
  ClimbTypeToGradeSystemDao,
  GradeDao,
  GradeSystemDao,
  RouteDao,
  RouteStatusDao,
  RouteCompletedStatusDao,
  RouteDifficultyDao,
  RouteTagDao,
  TagDao
];

@DriftDatabase(tables: tables, daos: daos)
class AppDatabase extends _$AppDatabase {
  // we tell the database where to store the data with this constructor
  AppDatabase() : super(_openConnection());
  AppDatabase.test(QueryExecutor executor) : super(executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      beforeOpen: (OpeningDetails details) async {
        await customStatement('PRAGMA foreign_keys = ON'); // enable foreign keys on sqlite
      },
      onCreate: (Migrator m) async {
        await m.createAll(); // Create all tables

        // Initialize Data
        gradeSystemDao.initializeData();
        gradeDao.initializeData();
        climbTypeDao.initializeData();
        climbTypeToGradeSystemDao.initializeData();
        routeCompletedStatusDao.initializeData();
        routeDifficultyDao.initializeData();
        routeStatusDao.initializeData();

        if (kDebugMode) {
          loadTestData(this);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
