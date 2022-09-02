import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/grade/grade_system.dart';

part 'climb_type.g.dart';

class ClimbType extends Table {
  IntColumn get id => integer()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [ClimbType])
class ClimbTypeDao extends DatabaseAccessor<AppDatabase> with _$ClimbTypeDaoMixin {
  ClimbTypeDao(AppDatabase db) : super(db);

  initializeData() { _init().forEach((element) async { await add(element); }); }

  Future<List<ClimbTypeData>> get all => select(climbType).get();

  Future<int> add(ClimbTypeCompanion entry) {
    return into(climbType).insert(entry);
  }
}

enum ClimbTypeEnum {
  topRope(1, "Top Rope", [GradeSystemEnum.yds]),
  boulder(2, "Boulder", [GradeSystemEnum.vScale]),
  lead(3, "Lead", [GradeSystemEnum.yds]);

  const ClimbTypeEnum(this.id, this.label, this.validGradeSystems);
  final int id;
  final String label;
  final List<GradeSystemEnum> validGradeSystems;
}

List<ClimbTypeCompanion> _init() {
  return [
    for (var climbTypeEnum in ClimbTypeEnum.values) ClimbTypeCompanion(id: Value(climbTypeEnum.id), label: Value(climbTypeEnum.label))
  ];
}


