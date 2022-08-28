import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'grade_system.g.dart';

class GradeSystem extends Table {
  TextColumn get id => text()();
  TextColumn get label => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftAccessor(tables: [GradeSystem])
class GradeSystemDao extends DatabaseAccessor<AppDatabase> with _$GradeSystemDaoMixin {
  GradeSystemDao(AppDatabase db) : super(db);

  Future<List<GradeSystemData>> get all => select(gradeSystem).get();

  Future<int> add(GradeSystemCompanion entry) {
    return into(gradeSystem).insert(entry);
  }
}


