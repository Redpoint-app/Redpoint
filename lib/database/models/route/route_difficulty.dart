import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_difficulty.g.dart';

@DataClassName('RouteDifficultyData')
class RouteDifficulty extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
}

@DriftAccessor(tables: [RouteDifficulty])
class RouteDifficultyDao extends DatabaseAccessor<AppDatabase> with _$RouteDifficultyDaoMixin {
  RouteDifficultyDao(AppDatabase db) : super(db);

  Future<List<RouteDifficultyData>> get all => select(routeDifficulty).get();

  Future<int> add(RouteDifficultyCompanion entry) {
    return into(routeDifficulty).insert(entry);
  }
}
