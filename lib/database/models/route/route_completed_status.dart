import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_completed_status.g.dart';

@DataClassName('RouteCompletedStatusData')
class RouteCompletedStatus extends Table {
  IntColumn get id => integer()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [RouteCompletedStatus])
class RouteCompletedStatusDao extends DatabaseAccessor<AppDatabase>
    with _$RouteCompletedStatusDaoMixin {
  RouteCompletedStatusDao(AppDatabase db) : super(db);

  initializeData() {
    _init().forEach((element) async {
      await add(element);
    });
  }

  Future<List<RouteCompletedStatusData>> get all =>
      select(routeCompletedStatus).get();

  Future<int> add(RouteCompletedStatusCompanion entry) {
    return into(routeCompletedStatus).insert(entry);
  }
}

enum RouteCompletedStatusEnum {
  onsight("Onsight"),
  flash("Flash"),
  redpoint("Redpoint");

  const RouteCompletedStatusEnum(this.label);
  final String label;
}

List<RouteCompletedStatusCompanion> _init() {
  return [
    for (var routeCompletedStatusEnum in RouteCompletedStatusEnum.values)
      RouteCompletedStatusCompanion(
          id: Value(routeCompletedStatusEnum.index),
          label: Value(routeCompletedStatusEnum.label))
  ];
}
