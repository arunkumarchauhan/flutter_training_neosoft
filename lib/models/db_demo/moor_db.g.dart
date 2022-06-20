// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MoorNoteData extends DataClass implements Insertable<MoorNoteData> {
  final int id;
  final String description;
  MoorNoteData({required this.id, required this.description});
  factory MoorNoteData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MoorNoteData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['description'] = Variable<String>(description);
    return map;
  }

  MoorNoteCompanion toCompanion(bool nullToAbsent) {
    return MoorNoteCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory MoorNoteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MoorNoteData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  MoorNoteData copyWith({int? id, String? description}) => MoorNoteData(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  @override
  String toString() {
    return (StringBuffer('MoorNoteData(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MoorNoteData &&
          other.id == this.id &&
          other.description == this.description);
}

class MoorNoteCompanion extends UpdateCompanion<MoorNoteData> {
  final Value<int> id;
  final Value<String> description;
  const MoorNoteCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  MoorNoteCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<MoorNoteData> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
    });
  }

  MoorNoteCompanion copyWith({Value<int>? id, Value<String>? description}) {
    return MoorNoteCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoorNoteCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $MoorNoteTable extends MoorNote
    with TableInfo<$MoorNoteTable, MoorNoteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MoorNoteTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? 'moor_note';
  @override
  String get actualTableName => 'moor_note';
  @override
  VerificationContext validateIntegrity(Insertable<MoorNoteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MoorNoteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MoorNoteData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoorNoteTable createAlias(String alias) {
    return $MoorNoteTable(attachedDatabase, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoorNoteTable moorNote = $MoorNoteTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [moorNote];
}
