// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ClimbTypeData extends DataClass implements Insertable<ClimbTypeData> {
  final int id;
  final String label;
  const ClimbTypeData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  ClimbTypeCompanion toCompanion(bool nullToAbsent) {
    return ClimbTypeCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory ClimbTypeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClimbTypeData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  ClimbTypeData copyWith({int? id, String? label}) => ClimbTypeData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('ClimbTypeData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClimbTypeData &&
          other.id == this.id &&
          other.label == this.label);
}

class ClimbTypeCompanion extends UpdateCompanion<ClimbTypeData> {
  final Value<int> id;
  final Value<String> label;
  const ClimbTypeCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  ClimbTypeCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<ClimbTypeData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  ClimbTypeCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return ClimbTypeCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClimbTypeCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $ClimbTypeTable extends ClimbType
    with TableInfo<$ClimbTypeTable, ClimbTypeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClimbTypeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'climb_type';
  @override
  String get actualTableName => 'climb_type';
  @override
  VerificationContext validateIntegrity(Insertable<ClimbTypeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ClimbTypeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClimbTypeData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $ClimbTypeTable createAlias(String alias) {
    return $ClimbTypeTable(attachedDatabase, alias);
  }
}

class GradeSystemData extends DataClass implements Insertable<GradeSystemData> {
  final int id;
  final String label;
  const GradeSystemData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  GradeSystemCompanion toCompanion(bool nullToAbsent) {
    return GradeSystemCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory GradeSystemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradeSystemData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  GradeSystemData copyWith({int? id, String? label}) => GradeSystemData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('GradeSystemData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradeSystemData &&
          other.id == this.id &&
          other.label == this.label);
}

class GradeSystemCompanion extends UpdateCompanion<GradeSystemData> {
  final Value<int> id;
  final Value<String> label;
  const GradeSystemCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  GradeSystemCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<GradeSystemData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  GradeSystemCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return GradeSystemCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradeSystemCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $GradeSystemTable extends GradeSystem
    with TableInfo<$GradeSystemTable, GradeSystemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradeSystemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'grade_system';
  @override
  String get actualTableName => 'grade_system';
  @override
  VerificationContext validateIntegrity(Insertable<GradeSystemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GradeSystemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradeSystemData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $GradeSystemTable createAlias(String alias) {
    return $GradeSystemTable(attachedDatabase, alias);
  }
}

class ClimbTypeToGradeSystemData extends DataClass
    implements Insertable<ClimbTypeToGradeSystemData> {
  final int climbTypeId;
  final int gradeSystemId;
  const ClimbTypeToGradeSystemData(
      {required this.climbTypeId, required this.gradeSystemId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['climb_type_id'] = Variable<int>(climbTypeId);
    map['grade_system_id'] = Variable<int>(gradeSystemId);
    return map;
  }

  ClimbTypeToGradeSystemCompanion toCompanion(bool nullToAbsent) {
    return ClimbTypeToGradeSystemCompanion(
      climbTypeId: Value(climbTypeId),
      gradeSystemId: Value(gradeSystemId),
    );
  }

  factory ClimbTypeToGradeSystemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClimbTypeToGradeSystemData(
      climbTypeId: serializer.fromJson<int>(json['climbTypeId']),
      gradeSystemId: serializer.fromJson<int>(json['gradeSystemId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'climbTypeId': serializer.toJson<int>(climbTypeId),
      'gradeSystemId': serializer.toJson<int>(gradeSystemId),
    };
  }

  ClimbTypeToGradeSystemData copyWith({int? climbTypeId, int? gradeSystemId}) =>
      ClimbTypeToGradeSystemData(
        climbTypeId: climbTypeId ?? this.climbTypeId,
        gradeSystemId: gradeSystemId ?? this.gradeSystemId,
      );
  @override
  String toString() {
    return (StringBuffer('ClimbTypeToGradeSystemData(')
          ..write('climbTypeId: $climbTypeId, ')
          ..write('gradeSystemId: $gradeSystemId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(climbTypeId, gradeSystemId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClimbTypeToGradeSystemData &&
          other.climbTypeId == this.climbTypeId &&
          other.gradeSystemId == this.gradeSystemId);
}

class ClimbTypeToGradeSystemCompanion
    extends UpdateCompanion<ClimbTypeToGradeSystemData> {
  final Value<int> climbTypeId;
  final Value<int> gradeSystemId;
  const ClimbTypeToGradeSystemCompanion({
    this.climbTypeId = const Value.absent(),
    this.gradeSystemId = const Value.absent(),
  });
  ClimbTypeToGradeSystemCompanion.insert({
    required int climbTypeId,
    required int gradeSystemId,
  })  : climbTypeId = Value(climbTypeId),
        gradeSystemId = Value(gradeSystemId);
  static Insertable<ClimbTypeToGradeSystemData> custom({
    Expression<int>? climbTypeId,
    Expression<int>? gradeSystemId,
  }) {
    return RawValuesInsertable({
      if (climbTypeId != null) 'climb_type_id': climbTypeId,
      if (gradeSystemId != null) 'grade_system_id': gradeSystemId,
    });
  }

  ClimbTypeToGradeSystemCompanion copyWith(
      {Value<int>? climbTypeId, Value<int>? gradeSystemId}) {
    return ClimbTypeToGradeSystemCompanion(
      climbTypeId: climbTypeId ?? this.climbTypeId,
      gradeSystemId: gradeSystemId ?? this.gradeSystemId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (climbTypeId.present) {
      map['climb_type_id'] = Variable<int>(climbTypeId.value);
    }
    if (gradeSystemId.present) {
      map['grade_system_id'] = Variable<int>(gradeSystemId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClimbTypeToGradeSystemCompanion(')
          ..write('climbTypeId: $climbTypeId, ')
          ..write('gradeSystemId: $gradeSystemId')
          ..write(')'))
        .toString();
  }
}

class $ClimbTypeToGradeSystemTable extends ClimbTypeToGradeSystem
    with TableInfo<$ClimbTypeToGradeSystemTable, ClimbTypeToGradeSystemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClimbTypeToGradeSystemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _climbTypeIdMeta =
      const VerificationMeta('climbTypeId');
  @override
  late final GeneratedColumn<int> climbTypeId = GeneratedColumn<int>(
      'climb_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES climb_type (id)');
  final VerificationMeta _gradeSystemIdMeta =
      const VerificationMeta('gradeSystemId');
  @override
  late final GeneratedColumn<int> gradeSystemId = GeneratedColumn<int>(
      'grade_system_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES grade_system (id)');
  @override
  List<GeneratedColumn> get $columns => [climbTypeId, gradeSystemId];
  @override
  String get aliasedName => _alias ?? 'climb_type_to_grade_system';
  @override
  String get actualTableName => 'climb_type_to_grade_system';
  @override
  VerificationContext validateIntegrity(
      Insertable<ClimbTypeToGradeSystemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('climb_type_id')) {
      context.handle(
          _climbTypeIdMeta,
          climbTypeId.isAcceptableOrUnknown(
              data['climb_type_id']!, _climbTypeIdMeta));
    } else if (isInserting) {
      context.missing(_climbTypeIdMeta);
    }
    if (data.containsKey('grade_system_id')) {
      context.handle(
          _gradeSystemIdMeta,
          gradeSystemId.isAcceptableOrUnknown(
              data['grade_system_id']!, _gradeSystemIdMeta));
    } else if (isInserting) {
      context.missing(_gradeSystemIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {climbTypeId, gradeSystemId};
  @override
  ClimbTypeToGradeSystemData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClimbTypeToGradeSystemData(
      climbTypeId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}climb_type_id'])!,
      gradeSystemId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}grade_system_id'])!,
    );
  }

  @override
  $ClimbTypeToGradeSystemTable createAlias(String alias) {
    return $ClimbTypeToGradeSystemTable(attachedDatabase, alias);
  }
}

class GradeData extends DataClass implements Insertable<GradeData> {
  final int systemId;
  final String grade;
  const GradeData({required this.systemId, required this.grade});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['system_id'] = Variable<int>(systemId);
    map['grade'] = Variable<String>(grade);
    return map;
  }

  GradeCompanion toCompanion(bool nullToAbsent) {
    return GradeCompanion(
      systemId: Value(systemId),
      grade: Value(grade),
    );
  }

  factory GradeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GradeData(
      systemId: serializer.fromJson<int>(json['systemId']),
      grade: serializer.fromJson<String>(json['grade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'systemId': serializer.toJson<int>(systemId),
      'grade': serializer.toJson<String>(grade),
    };
  }

  GradeData copyWith({int? systemId, String? grade}) => GradeData(
        systemId: systemId ?? this.systemId,
        grade: grade ?? this.grade,
      );
  @override
  String toString() {
    return (StringBuffer('GradeData(')
          ..write('systemId: $systemId, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(systemId, grade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GradeData &&
          other.systemId == this.systemId &&
          other.grade == this.grade);
}

class GradeCompanion extends UpdateCompanion<GradeData> {
  final Value<int> systemId;
  final Value<String> grade;
  const GradeCompanion({
    this.systemId = const Value.absent(),
    this.grade = const Value.absent(),
  });
  GradeCompanion.insert({
    required int systemId,
    required String grade,
  })  : systemId = Value(systemId),
        grade = Value(grade);
  static Insertable<GradeData> custom({
    Expression<int>? systemId,
    Expression<String>? grade,
  }) {
    return RawValuesInsertable({
      if (systemId != null) 'system_id': systemId,
      if (grade != null) 'grade': grade,
    });
  }

  GradeCompanion copyWith({Value<int>? systemId, Value<String>? grade}) {
    return GradeCompanion(
      systemId: systemId ?? this.systemId,
      grade: grade ?? this.grade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (systemId.present) {
      map['system_id'] = Variable<int>(systemId.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GradeCompanion(')
          ..write('systemId: $systemId, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }
}

class $GradeTable extends Grade with TableInfo<$GradeTable, GradeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GradeTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _systemIdMeta = const VerificationMeta('systemId');
  @override
  late final GeneratedColumn<int> systemId = GeneratedColumn<int>(
      'system_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES grade_system (id)');
  final VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
      'grade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [systemId, grade];
  @override
  String get aliasedName => _alias ?? 'grade';
  @override
  String get actualTableName => 'grade';
  @override
  VerificationContext validateIntegrity(Insertable<GradeData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('system_id')) {
      context.handle(_systemIdMeta,
          systemId.isAcceptableOrUnknown(data['system_id']!, _systemIdMeta));
    } else if (isInserting) {
      context.missing(_systemIdMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {systemId, grade};
  @override
  GradeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GradeData(
      systemId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}system_id'])!,
      grade: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}grade'])!,
    );
  }

  @override
  $GradeTable createAlias(String alias) {
    return $GradeTable(attachedDatabase, alias);
  }
}

class RouteStatusData extends DataClass implements Insertable<RouteStatusData> {
  final int id;
  final String label;
  const RouteStatusData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  RouteStatusCompanion toCompanion(bool nullToAbsent) {
    return RouteStatusCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory RouteStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteStatusData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  RouteStatusData copyWith({int? id, String? label}) => RouteStatusData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('RouteStatusData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteStatusData &&
          other.id == this.id &&
          other.label == this.label);
}

class RouteStatusCompanion extends UpdateCompanion<RouteStatusData> {
  final Value<int> id;
  final Value<String> label;
  const RouteStatusCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  RouteStatusCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<RouteStatusData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  RouteStatusCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return RouteStatusCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteStatusCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $RouteStatusTable extends RouteStatus
    with TableInfo<$RouteStatusTable, RouteStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteStatusTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'route_status';
  @override
  String get actualTableName => 'route_status';
  @override
  VerificationContext validateIntegrity(Insertable<RouteStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteStatusData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $RouteStatusTable createAlias(String alias) {
    return $RouteStatusTable(attachedDatabase, alias);
  }
}

class RouteCompletedStatusData extends DataClass
    implements Insertable<RouteCompletedStatusData> {
  final int id;
  final String label;
  const RouteCompletedStatusData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  RouteCompletedStatusCompanion toCompanion(bool nullToAbsent) {
    return RouteCompletedStatusCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory RouteCompletedStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteCompletedStatusData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  RouteCompletedStatusData copyWith({int? id, String? label}) =>
      RouteCompletedStatusData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('RouteCompletedStatusData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteCompletedStatusData &&
          other.id == this.id &&
          other.label == this.label);
}

class RouteCompletedStatusCompanion
    extends UpdateCompanion<RouteCompletedStatusData> {
  final Value<int> id;
  final Value<String> label;
  const RouteCompletedStatusCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  RouteCompletedStatusCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<RouteCompletedStatusData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  RouteCompletedStatusCompanion copyWith(
      {Value<int>? id, Value<String>? label}) {
    return RouteCompletedStatusCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteCompletedStatusCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $RouteCompletedStatusTable extends RouteCompletedStatus
    with TableInfo<$RouteCompletedStatusTable, RouteCompletedStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteCompletedStatusTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'route_completed_status';
  @override
  String get actualTableName => 'route_completed_status';
  @override
  VerificationContext validateIntegrity(
      Insertable<RouteCompletedStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteCompletedStatusData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteCompletedStatusData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $RouteCompletedStatusTable createAlias(String alias) {
    return $RouteCompletedStatusTable(attachedDatabase, alias);
  }
}

class RouteDifficultyData extends DataClass
    implements Insertable<RouteDifficultyData> {
  final int id;
  final String label;
  const RouteDifficultyData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  RouteDifficultyCompanion toCompanion(bool nullToAbsent) {
    return RouteDifficultyCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory RouteDifficultyData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteDifficultyData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  RouteDifficultyData copyWith({int? id, String? label}) => RouteDifficultyData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('RouteDifficultyData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteDifficultyData &&
          other.id == this.id &&
          other.label == this.label);
}

class RouteDifficultyCompanion extends UpdateCompanion<RouteDifficultyData> {
  final Value<int> id;
  final Value<String> label;
  const RouteDifficultyCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  RouteDifficultyCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<RouteDifficultyData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  RouteDifficultyCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return RouteDifficultyCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteDifficultyCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $RouteDifficultyTable extends RouteDifficulty
    with TableInfo<$RouteDifficultyTable, RouteDifficultyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteDifficultyTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'route_difficulty';
  @override
  String get actualTableName => 'route_difficulty';
  @override
  VerificationContext validateIntegrity(
      Insertable<RouteDifficultyData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteDifficultyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteDifficultyData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $RouteDifficultyTable createAlias(String alias) {
    return $RouteDifficultyTable(attachedDatabase, alias);
  }
}

class RouteData extends DataClass implements Insertable<RouteData> {
  final int id;
  final String title;
  final DateTime date;
  final int climbTypeId;
  final int gradeSystemId;
  final String grade;
  final int status;
  final int? completedStatus;
  final int difficulty;
  final String? thoughts;
  const RouteData(
      {required this.id,
      required this.title,
      required this.date,
      required this.climbTypeId,
      required this.gradeSystemId,
      required this.grade,
      required this.status,
      this.completedStatus,
      required this.difficulty,
      this.thoughts});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['climb_type_id'] = Variable<int>(climbTypeId);
    map['grade_system_id'] = Variable<int>(gradeSystemId);
    map['grade'] = Variable<String>(grade);
    map['status'] = Variable<int>(status);
    if (!nullToAbsent || completedStatus != null) {
      map['completed_status'] = Variable<int>(completedStatus);
    }
    map['difficulty'] = Variable<int>(difficulty);
    if (!nullToAbsent || thoughts != null) {
      map['thoughts'] = Variable<String>(thoughts);
    }
    return map;
  }

  RouteCompanion toCompanion(bool nullToAbsent) {
    return RouteCompanion(
      id: Value(id),
      title: Value(title),
      date: Value(date),
      climbTypeId: Value(climbTypeId),
      gradeSystemId: Value(gradeSystemId),
      grade: Value(grade),
      status: Value(status),
      completedStatus: completedStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(completedStatus),
      difficulty: Value(difficulty),
      thoughts: thoughts == null && nullToAbsent
          ? const Value.absent()
          : Value(thoughts),
    );
  }

  factory RouteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteData(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      climbTypeId: serializer.fromJson<int>(json['climbTypeId']),
      gradeSystemId: serializer.fromJson<int>(json['gradeSystemId']),
      grade: serializer.fromJson<String>(json['grade']),
      status: serializer.fromJson<int>(json['status']),
      completedStatus: serializer.fromJson<int?>(json['completedStatus']),
      difficulty: serializer.fromJson<int>(json['difficulty']),
      thoughts: serializer.fromJson<String?>(json['thoughts']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'climbTypeId': serializer.toJson<int>(climbTypeId),
      'gradeSystemId': serializer.toJson<int>(gradeSystemId),
      'grade': serializer.toJson<String>(grade),
      'status': serializer.toJson<int>(status),
      'completedStatus': serializer.toJson<int?>(completedStatus),
      'difficulty': serializer.toJson<int>(difficulty),
      'thoughts': serializer.toJson<String?>(thoughts),
    };
  }

  RouteData copyWith(
          {int? id,
          String? title,
          DateTime? date,
          int? climbTypeId,
          int? gradeSystemId,
          String? grade,
          int? status,
          Value<int?> completedStatus = const Value.absent(),
          int? difficulty,
          Value<String?> thoughts = const Value.absent()}) =>
      RouteData(
        id: id ?? this.id,
        title: title ?? this.title,
        date: date ?? this.date,
        climbTypeId: climbTypeId ?? this.climbTypeId,
        gradeSystemId: gradeSystemId ?? this.gradeSystemId,
        grade: grade ?? this.grade,
        status: status ?? this.status,
        completedStatus: completedStatus.present
            ? completedStatus.value
            : this.completedStatus,
        difficulty: difficulty ?? this.difficulty,
        thoughts: thoughts.present ? thoughts.value : this.thoughts,
      );
  @override
  String toString() {
    return (StringBuffer('RouteData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('climbTypeId: $climbTypeId, ')
          ..write('gradeSystemId: $gradeSystemId, ')
          ..write('grade: $grade, ')
          ..write('status: $status, ')
          ..write('completedStatus: $completedStatus, ')
          ..write('difficulty: $difficulty, ')
          ..write('thoughts: $thoughts')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, date, climbTypeId, gradeSystemId,
      grade, status, completedStatus, difficulty, thoughts);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteData &&
          other.id == this.id &&
          other.title == this.title &&
          other.date == this.date &&
          other.climbTypeId == this.climbTypeId &&
          other.gradeSystemId == this.gradeSystemId &&
          other.grade == this.grade &&
          other.status == this.status &&
          other.completedStatus == this.completedStatus &&
          other.difficulty == this.difficulty &&
          other.thoughts == this.thoughts);
}

class RouteCompanion extends UpdateCompanion<RouteData> {
  final Value<int> id;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<int> climbTypeId;
  final Value<int> gradeSystemId;
  final Value<String> grade;
  final Value<int> status;
  final Value<int?> completedStatus;
  final Value<int> difficulty;
  final Value<String?> thoughts;
  const RouteCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.climbTypeId = const Value.absent(),
    this.gradeSystemId = const Value.absent(),
    this.grade = const Value.absent(),
    this.status = const Value.absent(),
    this.completedStatus = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.thoughts = const Value.absent(),
  });
  RouteCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required DateTime date,
    required int climbTypeId,
    required int gradeSystemId,
    required String grade,
    required int status,
    this.completedStatus = const Value.absent(),
    required int difficulty,
    this.thoughts = const Value.absent(),
  })  : title = Value(title),
        date = Value(date),
        climbTypeId = Value(climbTypeId),
        gradeSystemId = Value(gradeSystemId),
        grade = Value(grade),
        status = Value(status),
        difficulty = Value(difficulty);
  static Insertable<RouteData> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<int>? climbTypeId,
    Expression<int>? gradeSystemId,
    Expression<String>? grade,
    Expression<int>? status,
    Expression<int>? completedStatus,
    Expression<int>? difficulty,
    Expression<String>? thoughts,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (climbTypeId != null) 'climb_type_id': climbTypeId,
      if (gradeSystemId != null) 'grade_system_id': gradeSystemId,
      if (grade != null) 'grade': grade,
      if (status != null) 'status': status,
      if (completedStatus != null) 'completed_status': completedStatus,
      if (difficulty != null) 'difficulty': difficulty,
      if (thoughts != null) 'thoughts': thoughts,
    });
  }

  RouteCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<DateTime>? date,
      Value<int>? climbTypeId,
      Value<int>? gradeSystemId,
      Value<String>? grade,
      Value<int>? status,
      Value<int?>? completedStatus,
      Value<int>? difficulty,
      Value<String?>? thoughts}) {
    return RouteCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      date: date ?? this.date,
      climbTypeId: climbTypeId ?? this.climbTypeId,
      gradeSystemId: gradeSystemId ?? this.gradeSystemId,
      grade: grade ?? this.grade,
      status: status ?? this.status,
      completedStatus: completedStatus ?? this.completedStatus,
      difficulty: difficulty ?? this.difficulty,
      thoughts: thoughts ?? this.thoughts,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (climbTypeId.present) {
      map['climb_type_id'] = Variable<int>(climbTypeId.value);
    }
    if (gradeSystemId.present) {
      map['grade_system_id'] = Variable<int>(gradeSystemId.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(status.value);
    }
    if (completedStatus.present) {
      map['completed_status'] = Variable<int>(completedStatus.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<int>(difficulty.value);
    }
    if (thoughts.present) {
      map['thoughts'] = Variable<String>(thoughts.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('climbTypeId: $climbTypeId, ')
          ..write('gradeSystemId: $gradeSystemId, ')
          ..write('grade: $grade, ')
          ..write('status: $status, ')
          ..write('completedStatus: $completedStatus, ')
          ..write('difficulty: $difficulty, ')
          ..write('thoughts: $thoughts')
          ..write(')'))
        .toString();
  }
}

class $RouteTable extends Route with TableInfo<$RouteTable, RouteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _climbTypeIdMeta =
      const VerificationMeta('climbTypeId');
  @override
  late final GeneratedColumn<int> climbTypeId = GeneratedColumn<int>(
      'climb_type_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _gradeSystemIdMeta =
      const VerificationMeta('gradeSystemId');
  @override
  late final GeneratedColumn<int> gradeSystemId = GeneratedColumn<int>(
      'grade_system_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  final VerificationMeta _gradeMeta = const VerificationMeta('grade');
  @override
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
      'grade', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<int> status = GeneratedColumn<int>(
      'status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES route_status (id)');
  final VerificationMeta _completedStatusMeta =
      const VerificationMeta('completedStatus');
  @override
  late final GeneratedColumn<int> completedStatus = GeneratedColumn<int>(
      'completed_status', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'REFERENCES route_completed_status (id)');
  final VerificationMeta _difficultyMeta = const VerificationMeta('difficulty');
  @override
  late final GeneratedColumn<int> difficulty = GeneratedColumn<int>(
      'difficulty', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES route_difficulty (id)');
  final VerificationMeta _thoughtsMeta = const VerificationMeta('thoughts');
  @override
  late final GeneratedColumn<String> thoughts = GeneratedColumn<String>(
      'thoughts', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        date,
        climbTypeId,
        gradeSystemId,
        grade,
        status,
        completedStatus,
        difficulty,
        thoughts
      ];
  @override
  String get aliasedName => _alias ?? 'route';
  @override
  String get actualTableName => 'route';
  @override
  VerificationContext validateIntegrity(Insertable<RouteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('climb_type_id')) {
      context.handle(
          _climbTypeIdMeta,
          climbTypeId.isAcceptableOrUnknown(
              data['climb_type_id']!, _climbTypeIdMeta));
    } else if (isInserting) {
      context.missing(_climbTypeIdMeta);
    }
    if (data.containsKey('grade_system_id')) {
      context.handle(
          _gradeSystemIdMeta,
          gradeSystemId.isAcceptableOrUnknown(
              data['grade_system_id']!, _gradeSystemIdMeta));
    } else if (isInserting) {
      context.missing(_gradeSystemIdMeta);
    }
    if (data.containsKey('grade')) {
      context.handle(
          _gradeMeta, grade.isAcceptableOrUnknown(data['grade']!, _gradeMeta));
    } else if (isInserting) {
      context.missing(_gradeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('completed_status')) {
      context.handle(
          _completedStatusMeta,
          completedStatus.isAcceptableOrUnknown(
              data['completed_status']!, _completedStatusMeta));
    }
    if (data.containsKey('difficulty')) {
      context.handle(
          _difficultyMeta,
          difficulty.isAcceptableOrUnknown(
              data['difficulty']!, _difficultyMeta));
    } else if (isInserting) {
      context.missing(_difficultyMeta);
    }
    if (data.containsKey('thoughts')) {
      context.handle(_thoughtsMeta,
          thoughts.isAcceptableOrUnknown(data['thoughts']!, _thoughtsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RouteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      date: attachedDatabase.options.types
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      climbTypeId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}climb_type_id'])!,
      gradeSystemId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}grade_system_id'])!,
      grade: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}grade'])!,
      status: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}status'])!,
      completedStatus: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}completed_status']),
      difficulty: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}difficulty'])!,
      thoughts: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}thoughts']),
    );
  }

  @override
  $RouteTable createAlias(String alias) {
    return $RouteTable(attachedDatabase, alias);
  }
}

class TagData extends DataClass implements Insertable<TagData> {
  final int id;
  final String label;
  const TagData({required this.id, required this.label});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    return map;
  }

  TagCompanion toCompanion(bool nullToAbsent) {
    return TagCompanion(
      id: Value(id),
      label: Value(label),
    );
  }

  factory TagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TagData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
    };
  }

  TagData copyWith({int? id, String? label}) => TagData(
        id: id ?? this.id,
        label: label ?? this.label,
      );
  @override
  String toString() {
    return (StringBuffer('TagData(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TagData && other.id == this.id && other.label == this.label);
}

class TagCompanion extends UpdateCompanion<TagData> {
  final Value<int> id;
  final Value<String> label;
  const TagCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
  });
  TagCompanion.insert({
    this.id = const Value.absent(),
    required String label,
  }) : label = Value(label);
  static Insertable<TagData> custom({
    Expression<int>? id,
    Expression<String>? label,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
    });
  }

  TagCompanion copyWith({Value<int>? id, Value<String>? label}) {
    return TagCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TagCompanion(')
          ..write('id: $id, ')
          ..write('label: $label')
          ..write(')'))
        .toString();
  }
}

class $TagTable extends Tag with TableInfo<$TagTable, TagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TagTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  @override
  List<GeneratedColumn> get $columns => [id, label];
  @override
  String get aliasedName => _alias ?? 'tag';
  @override
  String get actualTableName => 'tag';
  @override
  VerificationContext validateIntegrity(Insertable<TagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TagData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      label: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
    );
  }

  @override
  $TagTable createAlias(String alias) {
    return $TagTable(attachedDatabase, alias);
  }
}

class RouteTagData extends DataClass implements Insertable<RouteTagData> {
  final int routeId;
  final int tagId;
  const RouteTagData({required this.routeId, required this.tagId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['route_id'] = Variable<int>(routeId);
    map['tag_id'] = Variable<int>(tagId);
    return map;
  }

  RouteTagCompanion toCompanion(bool nullToAbsent) {
    return RouteTagCompanion(
      routeId: Value(routeId),
      tagId: Value(tagId),
    );
  }

  factory RouteTagData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RouteTagData(
      routeId: serializer.fromJson<int>(json['routeId']),
      tagId: serializer.fromJson<int>(json['tagId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'routeId': serializer.toJson<int>(routeId),
      'tagId': serializer.toJson<int>(tagId),
    };
  }

  RouteTagData copyWith({int? routeId, int? tagId}) => RouteTagData(
        routeId: routeId ?? this.routeId,
        tagId: tagId ?? this.tagId,
      );
  @override
  String toString() {
    return (StringBuffer('RouteTagData(')
          ..write('routeId: $routeId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(routeId, tagId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RouteTagData &&
          other.routeId == this.routeId &&
          other.tagId == this.tagId);
}

class RouteTagCompanion extends UpdateCompanion<RouteTagData> {
  final Value<int> routeId;
  final Value<int> tagId;
  const RouteTagCompanion({
    this.routeId = const Value.absent(),
    this.tagId = const Value.absent(),
  });
  RouteTagCompanion.insert({
    required int routeId,
    required int tagId,
  })  : routeId = Value(routeId),
        tagId = Value(tagId);
  static Insertable<RouteTagData> custom({
    Expression<int>? routeId,
    Expression<int>? tagId,
  }) {
    return RawValuesInsertable({
      if (routeId != null) 'route_id': routeId,
      if (tagId != null) 'tag_id': tagId,
    });
  }

  RouteTagCompanion copyWith({Value<int>? routeId, Value<int>? tagId}) {
    return RouteTagCompanion(
      routeId: routeId ?? this.routeId,
      tagId: tagId ?? this.tagId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (routeId.present) {
      map['route_id'] = Variable<int>(routeId.value);
    }
    if (tagId.present) {
      map['tag_id'] = Variable<int>(tagId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RouteTagCompanion(')
          ..write('routeId: $routeId, ')
          ..write('tagId: $tagId')
          ..write(')'))
        .toString();
  }
}

class $RouteTagTable extends RouteTag
    with TableInfo<$RouteTagTable, RouteTagData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RouteTagTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _routeIdMeta = const VerificationMeta('routeId');
  @override
  late final GeneratedColumn<int> routeId = GeneratedColumn<int>(
      'route_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES route (id)');
  final VerificationMeta _tagIdMeta = const VerificationMeta('tagId');
  @override
  late final GeneratedColumn<int> tagId = GeneratedColumn<int>(
      'tag_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: 'REFERENCES tag (id)');
  @override
  List<GeneratedColumn> get $columns => [routeId, tagId];
  @override
  String get aliasedName => _alias ?? 'route_tag';
  @override
  String get actualTableName => 'route_tag';
  @override
  VerificationContext validateIntegrity(Insertable<RouteTagData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('route_id')) {
      context.handle(_routeIdMeta,
          routeId.isAcceptableOrUnknown(data['route_id']!, _routeIdMeta));
    } else if (isInserting) {
      context.missing(_routeIdMeta);
    }
    if (data.containsKey('tag_id')) {
      context.handle(
          _tagIdMeta, tagId.isAcceptableOrUnknown(data['tag_id']!, _tagIdMeta));
    } else if (isInserting) {
      context.missing(_tagIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {routeId, tagId};
  @override
  RouteTagData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RouteTagData(
      routeId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}route_id'])!,
      tagId: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}tag_id'])!,
    );
  }

  @override
  $RouteTagTable createAlias(String alias) {
    return $RouteTagTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $ClimbTypeTable climbType = $ClimbTypeTable(this);
  late final $GradeSystemTable gradeSystem = $GradeSystemTable(this);
  late final $ClimbTypeToGradeSystemTable climbTypeToGradeSystem =
      $ClimbTypeToGradeSystemTable(this);
  late final $GradeTable grade = $GradeTable(this);
  late final $RouteStatusTable routeStatus = $RouteStatusTable(this);
  late final $RouteCompletedStatusTable routeCompletedStatus =
      $RouteCompletedStatusTable(this);
  late final $RouteDifficultyTable routeDifficulty =
      $RouteDifficultyTable(this);
  late final $RouteTable route = $RouteTable(this);
  late final $TagTable tag = $TagTable(this);
  late final $RouteTagTable routeTag = $RouteTagTable(this);
  late final ClimbTypeDao climbTypeDao = ClimbTypeDao(this as AppDatabase);
  late final ClimbTypeToGradeSystemDao climbTypeToGradeSystemDao =
      ClimbTypeToGradeSystemDao(this as AppDatabase);
  late final GradeDao gradeDao = GradeDao(this as AppDatabase);
  late final GradeSystemDao gradeSystemDao =
      GradeSystemDao(this as AppDatabase);
  late final RouteDao routeDao = RouteDao(this as AppDatabase);
  late final RouteStatusDao routeStatusDao =
      RouteStatusDao(this as AppDatabase);
  late final RouteCompletedStatusDao routeCompletedStatusDao =
      RouteCompletedStatusDao(this as AppDatabase);
  late final RouteDifficultyDao routeDifficultyDao =
      RouteDifficultyDao(this as AppDatabase);
  late final RouteTagDao routeTagDao = RouteTagDao(this as AppDatabase);
  late final TagDao tagDao = TagDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        climbType,
        gradeSystem,
        climbTypeToGradeSystem,
        grade,
        routeStatus,
        routeCompletedStatus,
        routeDifficulty,
        route,
        tag,
        routeTag
      ];
}
