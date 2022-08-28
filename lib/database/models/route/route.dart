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
  TextColumn get gradeSystemId => text()();
  TextColumn get grade => text()();
  IntColumn get status => integer().references(RouteStatus, #id)();
  IntColumn get completedStatus => integer().nullable().references(RouteCompletedStatus, #id)();
  IntColumn get difficulty => integer().references(RouteDifficulty, #id)();
  TextColumn get thoughts => text().nullable()();

  @override
  List<String> get customConstraints => [
    'FOREIGN KEY (climb_type_id, grade_system_id) REFERENCES climb_type_to_grade_system (climb_type_id, grade_system_id)',
    'FOREIGN KEY (grade_system_id, grade) REFERENCES grade (system_id, grade)'
  ];
}

@DriftAccessor(tables: [Route])
class RouteDao extends DatabaseAccessor<AppDatabase> with _$RouteDaoMixin {
  RouteDao(AppDatabase db) : super(db);

  Future<List<RouteData>> get all => select(route).get();
  Stream<List<RouteData>> get watchAll => select(route).watch();

  Future<int> add(RouteCompanion entry) {
    return into(route).insert(entry);
  }

  Future<RouteData?> getById(int id) {
    return (select(route)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }
}


