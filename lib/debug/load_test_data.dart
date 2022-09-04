import 'package:redpoint/database/database.dart';
import 'package:redpoint/debug/test_data/routes.dart';
import 'package:redpoint/debug/test_data/tags.dart';

Future<void> loadTestData(AppDatabase driftDb) async {
  for (var tag in testTags) {
    await driftDb.tagDao.insert(tag);
  }
  var allTagIds = testTags.map((e) => e.id);
  for (var route in testRoutes) {
    await driftDb.routeDao.insert(route);
    for (var tagId in allTagIds) {
      await driftDb.routeTagDao
          .insert(RouteTagCompanion(routeId: route.id, tagId: tagId));
    }
  }
}
