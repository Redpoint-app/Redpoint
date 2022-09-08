import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'grade_system.g.dart';

class GradeSystem extends Table {
  IntColumn get id => integer()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [GradeSystem])
class GradeSystemDao extends DatabaseAccessor<AppDatabase>
    with _$GradeSystemDaoMixin {
  GradeSystemDao(AppDatabase db) : super(db);

  initializeData() {
    _init().forEach((element) async {
      await add(element);
    });
  }

  Future<List<GradeSystemData>> get all => select(gradeSystem).get();

  Future<int> add(GradeSystemCompanion entry) {
    return into(gradeSystem).insert(entry);
  }
}

enum GradeSystemEnum {
  vScale("V-Scale", [
    "V0",
    "V1",
    "V2",
    "V3",
    "V4",
    "V5",
    "V6",
    "V7",
    "V8",
    "V9",
    "V10",
    "V11",
    "V12",
    "V13",
    "V14",
    "V15",
    "V16",
    "V17",
  ]),
  yds("Yosemite Decimal System", [
    "5.5",
    "5.6",
    "5.7",
    "5.8",
    "5.9",
    "5.10",
    "5.11",
    "5.12",
    "5.13",
    "5.14",
    "5.15",
    "5.16",
  ]);

  const GradeSystemEnum(this.label, this.grades);
  final String label;
  final List<String> grades;
}

List<GradeSystemCompanion> _init() {
  return [
    for (var gradeSystemEnum in GradeSystemEnum.values)
      GradeSystemCompanion(
        id: Value(gradeSystemEnum.index),
        label: Value(gradeSystemEnum.label),
      ),
  ];
}
