import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';
import 'package:redpoint/database/models/grade/grade_system.dart';

import 'climb_type.dart';

part 'climb_type_to_grade_system.g.dart';

class ClimbTypeToGradeSystem extends Table {
  IntColumn get climbTypeId => integer().references(ClimbType, #id)();
  IntColumn get gradeSystemId => integer().references(GradeSystem, #id)();

  @override
  Set<Column> get primaryKey => {climbTypeId, gradeSystemId};
}

@DriftAccessor(tables: [ClimbTypeToGradeSystem])
class ClimbTypeToGradeSystemDao extends DatabaseAccessor<AppDatabase> with _$ClimbTypeToGradeSystemDaoMixin {
  ClimbTypeToGradeSystemDao(AppDatabase db) : super(db);

  initializeData() { _init().forEach((element) async { await add(element); }); }

  Future<List<ClimbTypeToGradeSystemData>> get all => select(climbTypeToGradeSystem).get();

  add(ClimbTypeToGradeSystemCompanion entry) {
    return into(climbTypeToGradeSystem).insert(entry);
  }
}

List<ClimbTypeToGradeSystemCompanion> _init() {
  GradeSystemEnum gradeSystem;
  List<ClimbTypeToGradeSystemCompanion> climbTypeToGradeSystems = [];
  for (var climbTypeEnum in ClimbTypeEnum.values) {
    for (gradeSystem in climbTypeEnum.validGradeSystems) {
      climbTypeToGradeSystems.add(ClimbTypeToGradeSystemCompanion(climbTypeId: Value(climbTypeEnum.index), gradeSystemId: Value(gradeSystem.index)));
    }
  }
  return climbTypeToGradeSystems;
}


