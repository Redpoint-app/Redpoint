import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

import 'grade_system.dart';

part 'grade.g.dart';

class Grade extends Table {
  IntColumn get systemId => integer().references(GradeSystem, #id)();
  TextColumn get grade => text()();

  @override
  Set<Column> get primaryKey => {systemId, grade};
}

@DriftAccessor(tables: [Grade])
class GradeDao extends DatabaseAccessor<AppDatabase> with _$GradeDaoMixin {
  GradeDao(AppDatabase db) : super(db);

  initializeData() {
    _init().forEach((element) async {
      await add(element);
    });
  }

  Future<List<GradeData>> get all => select(grade).get();

  Future<int> add(GradeCompanion entry) {
    return into(grade).insert(entry);
  }
}

List<GradeCompanion> _init() {
  String gradeString;
  List<GradeCompanion> grades = [];
  for (var gradeSystemEnum in GradeSystemEnum.values) {
    for (gradeString in gradeSystemEnum.grades) {
      grades.add(GradeCompanion(
        systemId: Value(gradeSystemEnum.index),
        grade: Value(gradeString),
      ));
    }
  }
  return grades;
}
