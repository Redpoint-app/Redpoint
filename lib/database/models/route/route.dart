import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/route/route_completed_status.dart';
import 'package:redpoint/database/models/route/route_difficulty.dart';
import 'package:redpoint/database/models/route/route_status.dart';

part 'route.g.dart';

class Route extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get climbTypeId => integer()();
  IntColumn get gradeSystemId => integer()();
  TextColumn get grade => text()();
  IntColumn get status => integer().references(RouteStatus, #id)();
  IntColumn get completedStatus =>
      integer().nullable().references(RouteCompletedStatus, #id)();
  IntColumn get difficulty => integer().references(RouteDifficulty, #id)();
  TextColumn get thoughts => text().nullable()();

  @override
  List<String> get customConstraints => [
        'FOREIGN KEY (climb_type_id, grade_system_id) REFERENCES climb_type_to_grade_system (climb_type_id, grade_system_id)',
        'FOREIGN KEY (grade_system_id, grade) REFERENCES grade (system_id, grade)',
      ];
}

@DriftAccessor(tables: [Route])
class RouteDao extends DatabaseAccessor<AppDatabase> with _$RouteDaoMixin {
  RouteDao(AppDatabase db) : super(db);

  Future<List<RouteData>> get all => select(route).get();
  Stream<List<RouteData>> get watchAll => select(route).watch();

  Future<int> insert(RouteCompanion entry) {
    return into(route).insert(entry);
  }

  Future<RouteData> insertReturning(RouteCompanion entry) {
    return into(route).insertReturning(entry);
  }

  Future<RouteData?> getById(int id) {
    return (select(route)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<RouteData?> watchById(int id) {
    return (select(route)..where((tbl) => tbl.id.equals(id)))
        .watchSingleOrNull();
  }

  Future<int> updateById(int id, RouteCompanion entry) {
    return (update(route)..where((tbl) => tbl.id.equals(id))).write(entry);
  }

  Future<int> deleteById(int id) {
    return (delete(route)..where((tbl) => tbl.id.equals(id))).go();
  }

  Stream<List<RouteData>> getLatestProjects(int limit) {
    return (select(route)
          ..where((t) => t.status.equals(RouteStatusEnum.inProgress.index))
          ..limit(limit)
          ..orderBy([(t) => OrderingTerm(expression: t.date)]))
        .watch();
  }

  Stream<List<RouteData>> getRecentClimbs(int limit) {
    return (select(route)
          ..limit(limit)
          ..orderBy([
            (t) => OrderingTerm(expression: t.date, mode: OrderingMode.desc),
          ]))
        .watch();
  }
}
