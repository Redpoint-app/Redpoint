import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

import 'grade_system.dart';

part 'grade.g.dart';

class Grade extends Table {
  TextColumn get systemId => text().references(GradeSystem, #id)();
  TextColumn get grade => text()();

  @override
  Set<Column> get primaryKey => {systemId, grade};
}

@DriftAccessor(tables: [Grade])
class GradeDao extends DatabaseAccessor<AppDatabase> with _$GradeDaoMixin {
  GradeDao(AppDatabase db) : super(db);

  Future<List<GradeData>> get all => select(grade).get();

  Future<int> add(GradeCompanion entry) {
    return into(grade).insert(entry);
  }
}


