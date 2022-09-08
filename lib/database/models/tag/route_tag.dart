import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/route/route.dart';

import 'tag.dart';

part 'route_tag.g.dart';

class RouteTag extends Table {
  IntColumn get routeId => integer().references(Route, #id)();
  IntColumn get tagId => integer().references(Tag, #id)();

  @override
  Set<Column> get primaryKey => {routeId, tagId};
}

@DriftAccessor(tables: [RouteTag])
class RouteTagDao extends DatabaseAccessor<AppDatabase>
    with _$RouteTagDaoMixin {
  RouteTagDao(AppDatabase db) : super(db);

  Future<List<RouteTagData>> get all => select(routeTag).get();

  Future<int> insert(RouteTagCompanion entry) {
    return into(routeTag).insert(entry);
  }

  Future<List<int>> getTagIdsByRouteId(int routeId) {
    final query = selectOnly(routeTag)
      ..where(routeTag.routeId.equals(routeId))
      ..addColumns([routeTag.tagId]);
    return query.map((row) => row.read(routeTag.tagId)!).get();
  }
}
