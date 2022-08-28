import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_status.g.dart';

@DataClassName('RouteStatusData')
class RouteStatus extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
}

@DriftAccessor(tables: [RouteStatus])
class RouteStatusDao extends DatabaseAccessor<AppDatabase> with _$RouteStatusDaoMixin {
  RouteStatusDao(AppDatabase db) : super(db);

  Future<List<RouteStatusData>> get all => select(routeStatus).get();

  Future<int> add(RouteStatusCompanion entry) {
    return into(routeStatus).insert(entry);
  }
}
