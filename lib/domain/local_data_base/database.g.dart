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

class $WHLocationTable extends WHLocation
    with TableInfo<$WHLocationTable, WHLocationTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WHLocationTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedDateAndTimeMeta =
      const VerificationMeta('updatedDateAndTime');
  @override
  late final GeneratedColumn<DateTime> updatedDateAndTime =
      GeneratedColumn<DateTime>('updated_date_and_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _guIdMeta = const VerificationMeta('guId');
  @override
  late final GeneratedColumn<String> guId = GeneratedColumn<String>(
      'gu_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
      'location_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _palletNumberMeta =
      const VerificationMeta('palletNumber');
  @override
  late final GeneratedColumn<String> palletNumber = GeneratedColumn<String>(
      'pallet_number', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _auditDetailIdMeta =
      const VerificationMeta('auditDetailId');
  @override
  late final GeneratedColumn<String> auditDetailId = GeneratedColumn<String>(
      'audit_detail_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        updatedDateAndTime,
        guId,
        locationName,
        palletNumber,
        description,
        auditDetailId,
        isActive
      ];
  @override
  String get aliasedName => _alias ?? 'w_h_location';
  @override
  String get actualTableName => 'w_h_location';
  @override
  VerificationContext validateIntegrity(Insertable<WHLocationTable> instance,
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
    if (data.containsKey('gu_id')) {
      context.handle(
          _guIdMeta, guId.isAcceptableOrUnknown(data['gu_id']!, _guIdMeta));
    } else if (isInserting) {
      context.missing(_guIdMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('pallet_number')) {
      context.handle(
          _palletNumberMeta,
          palletNumber.isAcceptableOrUnknown(
              data['pallet_number']!, _palletNumberMeta));
    } else if (isInserting) {
      context.missing(_palletNumberMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('audit_detail_id')) {
      context.handle(
          _auditDetailIdMeta,
          auditDetailId.isAcceptableOrUnknown(
              data['audit_detail_id']!, _auditDetailIdMeta));
    } else if (isInserting) {
      context.missing(_auditDetailIdMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {locationName, palletNumber, auditDetailId};
  @override
  WHLocationTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WHLocationTable(
      updatedDateAndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}updated_date_and_time'])!,
      guId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}gu_id'])!,
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name'])!,
      palletNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pallet_number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      auditDetailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_detail_id'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
    );
  }

  @override
  $WHLocationTable createAlias(String alias) {
    return $WHLocationTable(attachedDatabase, alias);
  }
}

class WHLocationTable extends DataClass implements Insertable<WHLocationTable> {
  final DateTime updatedDateAndTime;
  final String guId;
  final String locationName;
  final String palletNumber;
  final String description;
  final String auditDetailId;
  final bool isActive;
  const WHLocationTable(
      {required this.updatedDateAndTime,
      required this.guId,
      required this.locationName,
      required this.palletNumber,
      required this.description,
      required this.auditDetailId,
      required this.isActive});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_date_and_time'] = Variable<DateTime>(updatedDateAndTime);
    map['gu_id'] = Variable<String>(guId);
    map['location_name'] = Variable<String>(locationName);
    map['pallet_number'] = Variable<String>(palletNumber);
    map['description'] = Variable<String>(description);
    map['audit_detail_id'] = Variable<String>(auditDetailId);
    map['is_active'] = Variable<bool>(isActive);
    return map;
  }

  WHLocationCompanion toCompanion(bool nullToAbsent) {
    return WHLocationCompanion(
      updatedDateAndTime: Value(updatedDateAndTime),
      guId: Value(guId),
      locationName: Value(locationName),
      palletNumber: Value(palletNumber),
      description: Value(description),
      auditDetailId: Value(auditDetailId),
      isActive: Value(isActive),
    );
  }

  factory WHLocationTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WHLocationTable(
      updatedDateAndTime:
          serializer.fromJson<DateTime>(json['updatedDateAndTime']),
      guId: serializer.fromJson<String>(json['guId']),
      locationName: serializer.fromJson<String>(json['locationName']),
      palletNumber: serializer.fromJson<String>(json['palletNumber']),
      description: serializer.fromJson<String>(json['description']),
      auditDetailId: serializer.fromJson<String>(json['auditDetailId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedDateAndTime': serializer.toJson<DateTime>(updatedDateAndTime),
      'guId': serializer.toJson<String>(guId),
      'locationName': serializer.toJson<String>(locationName),
      'palletNumber': serializer.toJson<String>(palletNumber),
      'description': serializer.toJson<String>(description),
      'auditDetailId': serializer.toJson<String>(auditDetailId),
      'isActive': serializer.toJson<bool>(isActive),
    };
  }

  WHLocationTable copyWith(
          {DateTime? updatedDateAndTime,
          String? guId,
          String? locationName,
          String? palletNumber,
          String? description,
          String? auditDetailId,
          bool? isActive}) =>
      WHLocationTable(
        updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
        guId: guId ?? this.guId,
        locationName: locationName ?? this.locationName,
        palletNumber: palletNumber ?? this.palletNumber,
        description: description ?? this.description,
        auditDetailId: auditDetailId ?? this.auditDetailId,
        isActive: isActive ?? this.isActive,
      );
  @override
  String toString() {
    return (StringBuffer('WHLocationTable(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('guId: $guId, ')
          ..write('locationName: $locationName, ')
          ..write('palletNumber: $palletNumber, ')
          ..write('description: $description, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('isActive: $isActive')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(updatedDateAndTime, guId, locationName,
      palletNumber, description, auditDetailId, isActive);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WHLocationTable &&
          other.updatedDateAndTime == this.updatedDateAndTime &&
          other.guId == this.guId &&
          other.locationName == this.locationName &&
          other.palletNumber == this.palletNumber &&
          other.description == this.description &&
          other.auditDetailId == this.auditDetailId &&
          other.isActive == this.isActive);
}

class WHLocationCompanion extends UpdateCompanion<WHLocationTable> {
  final Value<DateTime> updatedDateAndTime;
  final Value<String> guId;
  final Value<String> locationName;
  final Value<String> palletNumber;
  final Value<String> description;
  final Value<String> auditDetailId;
  final Value<bool> isActive;
  final Value<int> rowid;
  const WHLocationCompanion({
    this.updatedDateAndTime = const Value.absent(),
    this.guId = const Value.absent(),
    this.locationName = const Value.absent(),
    this.palletNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.auditDetailId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WHLocationCompanion.insert({
    required DateTime updatedDateAndTime,
    required String guId,
    required String locationName,
    required String palletNumber,
    required String description,
    required String auditDetailId,
    required bool isActive,
    this.rowid = const Value.absent(),
  })  : updatedDateAndTime = Value(updatedDateAndTime),
        guId = Value(guId),
        locationName = Value(locationName),
        palletNumber = Value(palletNumber),
        description = Value(description),
        auditDetailId = Value(auditDetailId),
        isActive = Value(isActive);
  static Insertable<WHLocationTable> custom({
    Expression<DateTime>? updatedDateAndTime,
    Expression<String>? guId,
    Expression<String>? locationName,
    Expression<String>? palletNumber,
    Expression<String>? description,
    Expression<String>? auditDetailId,
    Expression<bool>? isActive,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedDateAndTime != null)
        'updated_date_and_time': updatedDateAndTime,
      if (guId != null) 'gu_id': guId,
      if (locationName != null) 'location_name': locationName,
      if (palletNumber != null) 'pallet_number': palletNumber,
      if (description != null) 'description': description,
      if (auditDetailId != null) 'audit_detail_id': auditDetailId,
      if (isActive != null) 'is_active': isActive,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WHLocationCompanion copyWith(
      {Value<DateTime>? updatedDateAndTime,
      Value<String>? guId,
      Value<String>? locationName,
      Value<String>? palletNumber,
      Value<String>? description,
      Value<String>? auditDetailId,
      Value<bool>? isActive,
      Value<int>? rowid}) {
    return WHLocationCompanion(
      updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
      guId: guId ?? this.guId,
      locationName: locationName ?? this.locationName,
      palletNumber: palletNumber ?? this.palletNumber,
      description: description ?? this.description,
      auditDetailId: auditDetailId ?? this.auditDetailId,
      isActive: isActive ?? this.isActive,
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
    if (guId.present) {
      map['gu_id'] = Variable<String>(guId.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (palletNumber.present) {
      map['pallet_number'] = Variable<String>(palletNumber.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (auditDetailId.present) {
      map['audit_detail_id'] = Variable<String>(auditDetailId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WHLocationCompanion(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('guId: $guId, ')
          ..write('locationName: $locationName, ')
          ..write('palletNumber: $palletNumber, ')
          ..write('description: $description, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('isActive: $isActive, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ApiDataTable apiData = $ApiDataTable(this);
  late final $WHLocationTable wHLocation = $WHLocationTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [apiData, wHLocation];
}
