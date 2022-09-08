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

  initializeData() {
    _init().forEach((element) async {
      await insert(element);
    });
  }

  Future<List<TagData>> get all => select(tag).get();

  Future<int> insert(TagCompanion entry) {
    return into(tag).insert(entry);
  }

  Future<TagData> insertReturning(TagCompanion entry) {
    return into(tag).insertReturning(entry);
  }

  Future<TagData?> getById(int id) {
    return (select(tag)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<TagData?> watchById(int id) {
    return (select(tag)..where((tbl) => tbl.id.equals(id))).watchSingleOrNull();
  }

  Future<int> updateById(int id, TagCompanion entry) {
    return (update(tag)..where((tbl) => tbl.id.equals(id))).write(entry);
  }

  Future<int> deleteById(int id) {
    return (delete(tag)..where((tbl) => tbl.id.equals(id))).go();
  }
}

enum TagEnum {
  dynamic("Dynamic"),
  static("Static"),
  slopey("Slopey"),
  crimpy("Crimpy"),
  juggy("Juggy"),
  crack("Crack"),
  slab("Slab"),
  comp("Comp"),
  overhang("Overhang"),
  chimney("Chimney");

  const TagEnum(this.label);
  final String label;
}

List<TagCompanion> _init() {
  return [
    for (var tagEnum in TagEnum.values)
      TagCompanion(id: Value(tagEnum.index), label: Value(tagEnum.label)),
  ];
}
