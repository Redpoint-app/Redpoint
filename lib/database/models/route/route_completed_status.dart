import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_completed_status.g.dart';

@DataClassName('RouteCompletedStatusData')
class RouteCompletedStatus extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
}

@DriftAccessor(tables: [RouteCompletedStatus])
class RouteCompletedStatusDao extends DatabaseAccessor<AppDatabase> with _$RouteCompletedStatusDaoMixin {
  RouteCompletedStatusDao(AppDatabase db) : super(db);

  Future<List<RouteCompletedStatusData>> get all => select(routeCompletedStatus).get();

  Future<int> add(RouteCompletedStatusCompanion entry) {
    return into(routeCompletedStatus).insert(entry);
  }
}
