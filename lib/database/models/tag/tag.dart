import 'package:drift/drift.dart';
import 'package:redpoint/database/database.dart';

part 'tag.g.dart';

class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text().unique()();
}

@DriftAccessor(tables: [Tag])
class TagDao extends DatabaseAccessor<AppDatabase> with _$TagDaoMixin {
  TagDao(AppDatabase db) : super(db);

  Future<List<TagData>> get all => select(tag).get();

  Future<int> add(TagCompanion entry) {
    return into(tag).insert(entry);
  }
}


