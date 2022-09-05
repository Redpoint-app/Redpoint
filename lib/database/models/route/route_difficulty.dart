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
  extremelyEasy("Extremely Easy"),
  easy("Easy"),
  intermediate("Intermediate"),
  challenging("Challenging"),
  extremelyChallenging("Extremely Challenging");

  const RouteDifficultyEnum(this.label);
  final String label;
}

List<RouteDifficultyCompanion> _init() {
  return [
    for (var routeDifficultyEnum in RouteDifficultyEnum.values) RouteDifficultyCompanion(id: Value(routeDifficultyEnum.index), label: Value(routeDifficultyEnum.label))
  ];
}

