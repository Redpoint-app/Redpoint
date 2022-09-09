import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/tag/tag.dart';
import 'package:redpoint/debug/test_data/routes.dart';

Future<void> loadTestData(AppDatabase driftDb) async {
  const numSelected = 5;

  for (var route in testRoutes) {
    await driftDb.routeDao.insert(route);
    for (var tag in TagEnum.values.getRange(0, numSelected)) {
      await driftDb.routeTagDao.insert(
        RouteTagCompanion(routeId: route.id, tagId: Value(tag.index)),
      );
    }
  }
}
