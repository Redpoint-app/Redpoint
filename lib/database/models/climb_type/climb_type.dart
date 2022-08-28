import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'climb_type.g.dart';

class ClimbType extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text()();
}

@DriftAccessor(tables: [ClimbType])
class ClimbTypeDao extends DatabaseAccessor<AppDatabase> with _$ClimbTypeDaoMixin {
  ClimbTypeDao(AppDatabase db) : super(db);

  Future<List<ClimbTypeData>> get all => select(climbType).get();

  Future<int> add(ClimbTypeCompanion entry) {
    return into(climbType).insert(entry);
  }
}


