import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_status.g.dart';

@DataClassName('RouteStatusData')
class RouteStatus extends Table {
  IntColumn get id => integer()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [RouteStatus])
class RouteStatusDao extends DatabaseAccessor<AppDatabase> with _$RouteStatusDaoMixin {
  RouteStatusDao(AppDatabase db) : super(db);

  initializeData() { _init().forEach((element) async { await add(element); }); }

  Future<List<RouteStatusData>> get all => select(routeStatus).get();

  Future<int> add(RouteStatusCompanion entry) {
    return into(routeStatus).insert(entry);
  }
}

enum RouteStatusEnum {
  wantToTry("Want to try"),
  inProgress("In progress"),
  completed("Completed");

  const RouteStatusEnum(this.label);
  final String label;
}

List<RouteStatusCompanion> _init() {
  return [
    for (var routeStatusEnum in RouteStatusEnum.values) RouteStatusCompanion(id: Value(routeStatusEnum.index), label: Value(routeStatusEnum.label))
  ];
}

