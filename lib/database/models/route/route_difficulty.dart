import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'route_difficulty.g.dart';

@DataClassName('RouteDifficultyData')
class RouteDifficulty extends Table {
  IntColumn get id => integer()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [RouteDifficulty])
class RouteDifficultyDao extends DatabaseAccessor<AppDatabase> with _$RouteDifficultyDaoMixin {
  RouteDifficultyDao(AppDatabase db) : super(db);

  initializeData() { _init().forEach((element) async { await add(element); }); }

  Future<List<RouteDifficultyData>> get all => select(routeDifficulty).get();

  Future<int> add(RouteDifficultyCompanion entry) {
    return into(routeDifficulty).insert(entry);
  }
}

enum RouteDifficultyEnum {
  extremelyEasy(1, "Extremely Easy"),
  easy(2, "Easy"),
  intermediate(3, "Intermediate"),
  challenging(4, "Challenging"),
  extremelyChallenging(5, "Extremely Challenging");

  const RouteDifficultyEnum(this.id, this.label);
  final int id;
  final String label;
}

List<RouteDifficultyCompanion> _init() {
  return [
    for (var routeDifficultyEnum in RouteDifficultyEnum.values) RouteDifficultyCompanion(id: Value(routeDifficultyEnum.id), label: Value(routeDifficultyEnum.label))
  ];
}

