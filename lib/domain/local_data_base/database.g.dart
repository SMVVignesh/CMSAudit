// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ApiDataTable extends ApiData
    with TableInfo<$ApiDataTable, ApiDataTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ApiDataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedDateAndTimeMeta =
      const VerificationMeta('updatedDateAndTime');
  @override
  late final GeneratedColumn<DateTime> updatedDateAndTime =
      GeneratedColumn<DateTime>('updated_date_and_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tagMeta = const VerificationMeta('tag');
  @override
  late final GeneratedColumn<String> tag = GeneratedColumn<String>(
      'tag', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [updatedDateAndTime, data, tag];
  @override
  String get aliasedName => _alias ?? 'api_data';
  @override
  String get actualTableName => 'api_data';
  @override
  VerificationContext validateIntegrity(Insertable<ApiDataTable> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('updated_date_and_time')) {
      context.handle(
          _updatedDateAndTimeMeta,
          updatedDateAndTime.isAcceptableOrUnknown(
              data['updated_date_and_time']!, _updatedDateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_updatedDateAndTimeMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('tag')) {
      context.handle(
          _tagMeta, tag.isAcceptableOrUnknown(data['tag']!, _tagMeta));
    } else if (isInserting) {
      context.missing(_tagMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tag};
  @override
  ApiDataTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ApiDataTable(
      updatedDateAndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}updated_date_and_time'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      tag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tag'])!,
    );
  }

  @override
  $ApiDataTable createAlias(String alias) {
    return $ApiDataTable(attachedDatabase, alias);
  }
}

class ApiDataTable extends DataClass implements Insertable<ApiDataTable> {
  final DateTime updatedDateAndTime;
  final String data;
  final String tag;
  const ApiDataTable(
      {required this.updatedDateAndTime,
      required this.data,
      required this.tag});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_date_and_time'] = Variable<DateTime>(updatedDateAndTime);
    map['data'] = Variable<String>(data);
    map['tag'] = Variable<String>(tag);
    return map;
  }

  ApiDataCompanion toCompanion(bool nullToAbsent) {
    return ApiDataCompanion(
      updatedDateAndTime: Value(updatedDateAndTime),
      data: Value(data),
      tag: Value(tag),
    );
  }

  factory ApiDataTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ApiDataTable(
      updatedDateAndTime:
          serializer.fromJson<DateTime>(json['updatedDateAndTime']),
      data: serializer.fromJson<String>(json['data']),
      tag: serializer.fromJson<String>(json['tag']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedDateAndTime': serializer.toJson<DateTime>(updatedDateAndTime),
      'data': serializer.toJson<String>(data),
      'tag': serializer.toJson<String>(tag),
    };
  }

  ApiDataTable copyWith(
          {DateTime? updatedDateAndTime, String? data, String? tag}) =>
      ApiDataTable(
        updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
        data: data ?? this.data,
        tag: tag ?? this.tag,
      );
  @override
  String toString() {
    return (StringBuffer('ApiDataTable(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('data: $data, ')
          ..write('tag: $tag')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(updatedDateAndTime, data, tag);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ApiDataTable &&
          other.updatedDateAndTime == this.updatedDateAndTime &&
          other.data == this.data &&
          other.tag == this.tag);
}

class ApiDataCompanion extends UpdateCompanion<ApiDataTable> {
  final Value<DateTime> updatedDateAndTime;
  final Value<String> data;
  final Value<String> tag;
  final Value<int> rowid;
  const ApiDataCompanion({
    this.updatedDateAndTime = const Value.absent(),
    this.data = const Value.absent(),
    this.tag = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ApiDataCompanion.insert({
    required DateTime updatedDateAndTime,
    required String data,
    required String tag,
    this.rowid = const Value.absent(),
  })  : updatedDateAndTime = Value(updatedDateAndTime),
        data = Value(data),
        tag = Value(tag);
  static Insertable<ApiDataTable> custom({
    Expression<DateTime>? updatedDateAndTime,
    Expression<String>? data,
    Expression<String>? tag,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedDateAndTime != null)
        'updated_date_and_time': updatedDateAndTime,
      if (data != null) 'data': data,
      if (tag != null) 'tag': tag,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ApiDataCompanion copyWith(
      {Value<DateTime>? updatedDateAndTime,
      Value<String>? data,
      Value<String>? tag,
      Value<int>? rowid}) {
    return ApiDataCompanion(
      updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
      data: data ?? this.data,
      tag: tag ?? this.tag,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (updatedDateAndTime.present) {
      map['updated_date_and_time'] =
          Variable<DateTime>(updatedDateAndTime.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (tag.present) {
      map['tag'] = Variable<String>(tag.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ApiDataCompanion(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('data: $data, ')
          ..write('tag: $tag, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}



abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ApiDataTable apiData = $ApiDataTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [apiData];
}
