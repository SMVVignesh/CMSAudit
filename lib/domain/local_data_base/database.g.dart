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
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
      'location_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localLocationIdMeta =
      const VerificationMeta('localLocationId');
  @override
  late final GeneratedColumn<String> localLocationId = GeneratedColumn<String>(
      'local_location_id', aliasedName, false,
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
  static const VerificationMeta _apiStatusMeta =
      const VerificationMeta('apiStatus');
  @override
  late final GeneratedColumn<String> apiStatus = GeneratedColumn<String>(
      'api_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodNameMeta =
      const VerificationMeta('methodName');
  @override
  late final GeneratedColumn<String> methodName = GeneratedColumn<String>(
      'method_name', aliasedName, false,
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
  static const VerificationMeta _isLocationUpdatedMeta =
      const VerificationMeta('isLocationUpdated');
  @override
  late final GeneratedColumn<bool> isLocationUpdated = GeneratedColumn<bool>(
      'is_location_updated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_location_updated" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        updatedDateAndTime,
        locationId,
        localLocationId,
        locationName,
        palletNumber,
        description,
        auditDetailId,
        apiStatus,
        methodName,
        isActive,
        isLocationUpdated
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
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('local_location_id')) {
      context.handle(
          _localLocationIdMeta,
          localLocationId.isAcceptableOrUnknown(
              data['local_location_id']!, _localLocationIdMeta));
    } else if (isInserting) {
      context.missing(_localLocationIdMeta);
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
    if (data.containsKey('api_status')) {
      context.handle(_apiStatusMeta,
          apiStatus.isAcceptableOrUnknown(data['api_status']!, _apiStatusMeta));
    } else if (isInserting) {
      context.missing(_apiStatusMeta);
    }
    if (data.containsKey('method_name')) {
      context.handle(
          _methodNameMeta,
          methodName.isAcceptableOrUnknown(
              data['method_name']!, _methodNameMeta));
    } else if (isInserting) {
      context.missing(_methodNameMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
    }
    if (data.containsKey('is_location_updated')) {
      context.handle(
          _isLocationUpdatedMeta,
          isLocationUpdated.isAcceptableOrUnknown(
              data['is_location_updated']!, _isLocationUpdatedMeta));
    } else if (isInserting) {
      context.missing(_isLocationUpdatedMeta);
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
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_id'])!,
      localLocationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_location_id'])!,
      locationName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_name'])!,
      palletNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pallet_number'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      auditDetailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_detail_id'])!,
      apiStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_status'])!,
      methodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_name'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isLocationUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_location_updated'])!,
    );
  }

  @override
  $WHLocationTable createAlias(String alias) {
    return $WHLocationTable(attachedDatabase, alias);
  }
}

class WHLocationTable extends DataClass implements Insertable<WHLocationTable> {
  final DateTime updatedDateAndTime;
  final String locationId;
  final String localLocationId;
  final String locationName;
  final String palletNumber;
  final String description;
  final String auditDetailId;
  final String apiStatus;
  final String methodName;
  final bool isActive;
  final bool isLocationUpdated;
  const WHLocationTable(
      {required this.updatedDateAndTime,
      required this.locationId,
      required this.localLocationId,
      required this.locationName,
      required this.palletNumber,
      required this.description,
      required this.auditDetailId,
      required this.apiStatus,
      required this.methodName,
      required this.isActive,
      required this.isLocationUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_date_and_time'] = Variable<DateTime>(updatedDateAndTime);
    map['location_id'] = Variable<String>(locationId);
    map['local_location_id'] = Variable<String>(localLocationId);
    map['location_name'] = Variable<String>(locationName);
    map['pallet_number'] = Variable<String>(palletNumber);
    map['description'] = Variable<String>(description);
    map['audit_detail_id'] = Variable<String>(auditDetailId);
    map['api_status'] = Variable<String>(apiStatus);
    map['method_name'] = Variable<String>(methodName);
    map['is_active'] = Variable<bool>(isActive);
    map['is_location_updated'] = Variable<bool>(isLocationUpdated);
    return map;
  }

  WHLocationCompanion toCompanion(bool nullToAbsent) {
    return WHLocationCompanion(
      updatedDateAndTime: Value(updatedDateAndTime),
      locationId: Value(locationId),
      localLocationId: Value(localLocationId),
      locationName: Value(locationName),
      palletNumber: Value(palletNumber),
      description: Value(description),
      auditDetailId: Value(auditDetailId),
      apiStatus: Value(apiStatus),
      methodName: Value(methodName),
      isActive: Value(isActive),
      isLocationUpdated: Value(isLocationUpdated),
    );
  }

  factory WHLocationTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WHLocationTable(
      updatedDateAndTime:
          serializer.fromJson<DateTime>(json['updatedDateAndTime']),
      locationId: serializer.fromJson<String>(json['locationId']),
      localLocationId: serializer.fromJson<String>(json['localLocationId']),
      locationName: serializer.fromJson<String>(json['locationName']),
      palletNumber: serializer.fromJson<String>(json['palletNumber']),
      description: serializer.fromJson<String>(json['description']),
      auditDetailId: serializer.fromJson<String>(json['auditDetailId']),
      apiStatus: serializer.fromJson<String>(json['apiStatus']),
      methodName: serializer.fromJson<String>(json['methodName']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isLocationUpdated: serializer.fromJson<bool>(json['isLocationUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedDateAndTime': serializer.toJson<DateTime>(updatedDateAndTime),
      'locationId': serializer.toJson<String>(locationId),
      'localLocationId': serializer.toJson<String>(localLocationId),
      'locationName': serializer.toJson<String>(locationName),
      'palletNumber': serializer.toJson<String>(palletNumber),
      'description': serializer.toJson<String>(description),
      'auditDetailId': serializer.toJson<String>(auditDetailId),
      'apiStatus': serializer.toJson<String>(apiStatus),
      'methodName': serializer.toJson<String>(methodName),
      'isActive': serializer.toJson<bool>(isActive),
      'isLocationUpdated': serializer.toJson<bool>(isLocationUpdated),
    };
  }

  WHLocationTable copyWith(
          {DateTime? updatedDateAndTime,
          String? locationId,
          String? localLocationId,
          String? locationName,
          String? palletNumber,
          String? description,
          String? auditDetailId,
          String? apiStatus,
          String? methodName,
          bool? isActive,
          bool? isLocationUpdated}) =>
      WHLocationTable(
        updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
        locationId: locationId ?? this.locationId,
        localLocationId: localLocationId ?? this.localLocationId,
        locationName: locationName ?? this.locationName,
        palletNumber: palletNumber ?? this.palletNumber,
        description: description ?? this.description,
        auditDetailId: auditDetailId ?? this.auditDetailId,
        apiStatus: apiStatus ?? this.apiStatus,
        methodName: methodName ?? this.methodName,
        isActive: isActive ?? this.isActive,
        isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('WHLocationTable(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('locationId: $locationId, ')
          ..write('localLocationId: $localLocationId, ')
          ..write('locationName: $locationName, ')
          ..write('palletNumber: $palletNumber, ')
          ..write('description: $description, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isActive: $isActive, ')
          ..write('isLocationUpdated: $isLocationUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      updatedDateAndTime,
      locationId,
      localLocationId,
      locationName,
      palletNumber,
      description,
      auditDetailId,
      apiStatus,
      methodName,
      isActive,
      isLocationUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WHLocationTable &&
          other.updatedDateAndTime == this.updatedDateAndTime &&
          other.locationId == this.locationId &&
          other.localLocationId == this.localLocationId &&
          other.locationName == this.locationName &&
          other.palletNumber == this.palletNumber &&
          other.description == this.description &&
          other.auditDetailId == this.auditDetailId &&
          other.apiStatus == this.apiStatus &&
          other.methodName == this.methodName &&
          other.isActive == this.isActive &&
          other.isLocationUpdated == this.isLocationUpdated);
}

class WHLocationCompanion extends UpdateCompanion<WHLocationTable> {
  final Value<DateTime> updatedDateAndTime;
  final Value<String> locationId;
  final Value<String> localLocationId;
  final Value<String> locationName;
  final Value<String> palletNumber;
  final Value<String> description;
  final Value<String> auditDetailId;
  final Value<String> apiStatus;
  final Value<String> methodName;
  final Value<bool> isActive;
  final Value<bool> isLocationUpdated;
  final Value<int> rowid;
  const WHLocationCompanion({
    this.updatedDateAndTime = const Value.absent(),
    this.locationId = const Value.absent(),
    this.localLocationId = const Value.absent(),
    this.locationName = const Value.absent(),
    this.palletNumber = const Value.absent(),
    this.description = const Value.absent(),
    this.auditDetailId = const Value.absent(),
    this.apiStatus = const Value.absent(),
    this.methodName = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isLocationUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WHLocationCompanion.insert({
    required DateTime updatedDateAndTime,
    required String locationId,
    required String localLocationId,
    required String locationName,
    required String palletNumber,
    required String description,
    required String auditDetailId,
    required String apiStatus,
    required String methodName,
    required bool isActive,
    required bool isLocationUpdated,
    this.rowid = const Value.absent(),
  })  : updatedDateAndTime = Value(updatedDateAndTime),
        locationId = Value(locationId),
        localLocationId = Value(localLocationId),
        locationName = Value(locationName),
        palletNumber = Value(palletNumber),
        description = Value(description),
        auditDetailId = Value(auditDetailId),
        apiStatus = Value(apiStatus),
        methodName = Value(methodName),
        isActive = Value(isActive),
        isLocationUpdated = Value(isLocationUpdated);
  static Insertable<WHLocationTable> custom({
    Expression<DateTime>? updatedDateAndTime,
    Expression<String>? locationId,
    Expression<String>? localLocationId,
    Expression<String>? locationName,
    Expression<String>? palletNumber,
    Expression<String>? description,
    Expression<String>? auditDetailId,
    Expression<String>? apiStatus,
    Expression<String>? methodName,
    Expression<bool>? isActive,
    Expression<bool>? isLocationUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedDateAndTime != null)
        'updated_date_and_time': updatedDateAndTime,
      if (locationId != null) 'location_id': locationId,
      if (localLocationId != null) 'local_location_id': localLocationId,
      if (locationName != null) 'location_name': locationName,
      if (palletNumber != null) 'pallet_number': palletNumber,
      if (description != null) 'description': description,
      if (auditDetailId != null) 'audit_detail_id': auditDetailId,
      if (apiStatus != null) 'api_status': apiStatus,
      if (methodName != null) 'method_name': methodName,
      if (isActive != null) 'is_active': isActive,
      if (isLocationUpdated != null) 'is_location_updated': isLocationUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WHLocationCompanion copyWith(
      {Value<DateTime>? updatedDateAndTime,
      Value<String>? locationId,
      Value<String>? localLocationId,
      Value<String>? locationName,
      Value<String>? palletNumber,
      Value<String>? description,
      Value<String>? auditDetailId,
      Value<String>? apiStatus,
      Value<String>? methodName,
      Value<bool>? isActive,
      Value<bool>? isLocationUpdated,
      Value<int>? rowid}) {
    return WHLocationCompanion(
      updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
      locationId: locationId ?? this.locationId,
      localLocationId: localLocationId ?? this.localLocationId,
      locationName: locationName ?? this.locationName,
      palletNumber: palletNumber ?? this.palletNumber,
      description: description ?? this.description,
      auditDetailId: auditDetailId ?? this.auditDetailId,
      apiStatus: apiStatus ?? this.apiStatus,
      methodName: methodName ?? this.methodName,
      isActive: isActive ?? this.isActive,
      isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
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
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (localLocationId.present) {
      map['local_location_id'] = Variable<String>(localLocationId.value);
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
    if (apiStatus.present) {
      map['api_status'] = Variable<String>(apiStatus.value);
    }
    if (methodName.present) {
      map['method_name'] = Variable<String>(methodName.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isLocationUpdated.present) {
      map['is_location_updated'] = Variable<bool>(isLocationUpdated.value);
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
          ..write('locationId: $locationId, ')
          ..write('localLocationId: $localLocationId, ')
          ..write('locationName: $locationName, ')
          ..write('palletNumber: $palletNumber, ')
          ..write('description: $description, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isActive: $isActive, ')
          ..write('isLocationUpdated: $isLocationUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WHInOutWardsTable extends WHInOutWards
    with TableInfo<$WHInOutWardsTable, WHInOutWardsTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WHInOutWardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedDateAndTimeMeta =
      const VerificationMeta('updatedDateAndTime');
  @override
  late final GeneratedColumn<DateTime> updatedDateAndTime =
      GeneratedColumn<DateTime>('updated_date_and_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _inOutWardIdMeta =
      const VerificationMeta('inOutWardId');
  @override
  late final GeneratedColumn<String> inOutWardId = GeneratedColumn<String>(
      'in_out_ward_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _serverInOutWardIdMeta =
      const VerificationMeta('serverInOutWardId');
  @override
  late final GeneratedColumn<String> serverInOutWardId =
      GeneratedColumn<String>('server_in_out_ward_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
      'qty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stockTypeMeta =
      const VerificationMeta('stockType');
  @override
  late final GeneratedColumn<String> stockType = GeneratedColumn<String>(
      'stock_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoNoMeta = const VerificationMeta('invoNo');
  @override
  late final GeneratedColumn<String> invoNo = GeneratedColumn<String>(
      'invo_no', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoTypeMeta =
      const VerificationMeta('invoType');
  @override
  late final GeneratedColumn<String> invoType = GeneratedColumn<String>(
      'invo_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _invoDateMeta =
      const VerificationMeta('invoDate');
  @override
  late final GeneratedColumn<String> invoDate = GeneratedColumn<String>(
      'invo_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _customerNameMeta =
      const VerificationMeta('customerName');
  @override
  late final GeneratedColumn<String> customerName = GeneratedColumn<String>(
      'customer_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _whLocationIdMeta =
      const VerificationMeta('whLocationId');
  @override
  late final GeneratedColumn<String> whLocationId = GeneratedColumn<String>(
      'wh_location_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _auditDetailIdMeta =
      const VerificationMeta('auditDetailId');
  @override
  late final GeneratedColumn<String> auditDetailId = GeneratedColumn<String>(
      'audit_detail_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _apiStatusMeta =
      const VerificationMeta('apiStatus');
  @override
  late final GeneratedColumn<String> apiStatus = GeneratedColumn<String>(
      'api_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodNameMeta =
      const VerificationMeta('methodName');
  @override
  late final GeneratedColumn<String> methodName = GeneratedColumn<String>(
      'method_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLocationUpdatedMeta =
      const VerificationMeta('isLocationUpdated');
  @override
  late final GeneratedColumn<bool> isLocationUpdated = GeneratedColumn<bool>(
      'is_location_updated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_location_updated" IN (0, 1))'));
  static const VerificationMeta _productImageMeta =
      const VerificationMeta('productImage');
  @override
  late final GeneratedColumn<String> productImage = GeneratedColumn<String>(
      'product_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isProductImageUpdatedMeta =
      const VerificationMeta('isProductImageUpdated');
  @override
  late final GeneratedColumn<bool> isProductImageUpdated =
      GeneratedColumn<bool>('is_product_image_updated', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_product_image_updated" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        updatedDateAndTime,
        inOutWardId,
        serverInOutWardId,
        qty,
        stockType,
        description,
        invoNo,
        invoType,
        invoDate,
        customerName,
        whLocationId,
        productId,
        productName,
        auditDetailId,
        apiStatus,
        methodName,
        isLocationUpdated,
        productImage,
        isProductImageUpdated
      ];
  @override
  String get aliasedName => _alias ?? 'w_h_in_out_wards';
  @override
  String get actualTableName => 'w_h_in_out_wards';
  @override
  VerificationContext validateIntegrity(Insertable<WHInOutWardsTable> instance,
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
    if (data.containsKey('in_out_ward_id')) {
      context.handle(
          _inOutWardIdMeta,
          inOutWardId.isAcceptableOrUnknown(
              data['in_out_ward_id']!, _inOutWardIdMeta));
    } else if (isInserting) {
      context.missing(_inOutWardIdMeta);
    }
    if (data.containsKey('server_in_out_ward_id')) {
      context.handle(
          _serverInOutWardIdMeta,
          serverInOutWardId.isAcceptableOrUnknown(
              data['server_in_out_ward_id']!, _serverInOutWardIdMeta));
    } else if (isInserting) {
      context.missing(_serverInOutWardIdMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('stock_type')) {
      context.handle(_stockTypeMeta,
          stockType.isAcceptableOrUnknown(data['stock_type']!, _stockTypeMeta));
    } else if (isInserting) {
      context.missing(_stockTypeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('invo_no')) {
      context.handle(_invoNoMeta,
          invoNo.isAcceptableOrUnknown(data['invo_no']!, _invoNoMeta));
    } else if (isInserting) {
      context.missing(_invoNoMeta);
    }
    if (data.containsKey('invo_type')) {
      context.handle(_invoTypeMeta,
          invoType.isAcceptableOrUnknown(data['invo_type']!, _invoTypeMeta));
    } else if (isInserting) {
      context.missing(_invoTypeMeta);
    }
    if (data.containsKey('invo_date')) {
      context.handle(_invoDateMeta,
          invoDate.isAcceptableOrUnknown(data['invo_date']!, _invoDateMeta));
    } else if (isInserting) {
      context.missing(_invoDateMeta);
    }
    if (data.containsKey('customer_name')) {
      context.handle(
          _customerNameMeta,
          customerName.isAcceptableOrUnknown(
              data['customer_name']!, _customerNameMeta));
    } else if (isInserting) {
      context.missing(_customerNameMeta);
    }
    if (data.containsKey('wh_location_id')) {
      context.handle(
          _whLocationIdMeta,
          whLocationId.isAcceptableOrUnknown(
              data['wh_location_id']!, _whLocationIdMeta));
    } else if (isInserting) {
      context.missing(_whLocationIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('audit_detail_id')) {
      context.handle(
          _auditDetailIdMeta,
          auditDetailId.isAcceptableOrUnknown(
              data['audit_detail_id']!, _auditDetailIdMeta));
    } else if (isInserting) {
      context.missing(_auditDetailIdMeta);
    }
    if (data.containsKey('api_status')) {
      context.handle(_apiStatusMeta,
          apiStatus.isAcceptableOrUnknown(data['api_status']!, _apiStatusMeta));
    } else if (isInserting) {
      context.missing(_apiStatusMeta);
    }
    if (data.containsKey('method_name')) {
      context.handle(
          _methodNameMeta,
          methodName.isAcceptableOrUnknown(
              data['method_name']!, _methodNameMeta));
    } else if (isInserting) {
      context.missing(_methodNameMeta);
    }
    if (data.containsKey('is_location_updated')) {
      context.handle(
          _isLocationUpdatedMeta,
          isLocationUpdated.isAcceptableOrUnknown(
              data['is_location_updated']!, _isLocationUpdatedMeta));
    } else if (isInserting) {
      context.missing(_isLocationUpdatedMeta);
    }
    if (data.containsKey('product_image')) {
      context.handle(
          _productImageMeta,
          productImage.isAcceptableOrUnknown(
              data['product_image']!, _productImageMeta));
    }
    if (data.containsKey('is_product_image_updated')) {
      context.handle(
          _isProductImageUpdatedMeta,
          isProductImageUpdated.isAcceptableOrUnknown(
              data['is_product_image_updated']!, _isProductImageUpdatedMeta));
    } else if (isInserting) {
      context.missing(_isProductImageUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {invoNo, inOutWardId, auditDetailId};
  @override
  WHInOutWardsTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WHInOutWardsTable(
      updatedDateAndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}updated_date_and_time'])!,
      inOutWardId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}in_out_ward_id'])!,
      serverInOutWardId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}server_in_out_ward_id'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}qty'])!,
      stockType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stock_type'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      invoNo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invo_no'])!,
      invoType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invo_type'])!,
      invoDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}invo_date'])!,
      customerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}customer_name'])!,
      whLocationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wh_location_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      auditDetailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_detail_id'])!,
      apiStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_status'])!,
      methodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_name'])!,
      isLocationUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_location_updated'])!,
      productImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_image']),
      isProductImageUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_product_image_updated'])!,
    );
  }

  @override
  $WHInOutWardsTable createAlias(String alias) {
    return $WHInOutWardsTable(attachedDatabase, alias);
  }
}

class WHInOutWardsTable extends DataClass
    implements Insertable<WHInOutWardsTable> {
  final DateTime updatedDateAndTime;
  final String inOutWardId;
  final String serverInOutWardId;
  final int qty;
  final String stockType;
  final String description;
  final String invoNo;
  final String invoType;
  final String invoDate;
  final String customerName;
  final String whLocationId;
  final String productId;
  final String productName;
  final String auditDetailId;
  final String apiStatus;
  final String methodName;
  final bool isLocationUpdated;
  final String? productImage;
  final bool isProductImageUpdated;
  const WHInOutWardsTable(
      {required this.updatedDateAndTime,
      required this.inOutWardId,
      required this.serverInOutWardId,
      required this.qty,
      required this.stockType,
      required this.description,
      required this.invoNo,
      required this.invoType,
      required this.invoDate,
      required this.customerName,
      required this.whLocationId,
      required this.productId,
      required this.productName,
      required this.auditDetailId,
      required this.apiStatus,
      required this.methodName,
      required this.isLocationUpdated,
      this.productImage,
      required this.isProductImageUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_date_and_time'] = Variable<DateTime>(updatedDateAndTime);
    map['in_out_ward_id'] = Variable<String>(inOutWardId);
    map['server_in_out_ward_id'] = Variable<String>(serverInOutWardId);
    map['qty'] = Variable<int>(qty);
    map['stock_type'] = Variable<String>(stockType);
    map['description'] = Variable<String>(description);
    map['invo_no'] = Variable<String>(invoNo);
    map['invo_type'] = Variable<String>(invoType);
    map['invo_date'] = Variable<String>(invoDate);
    map['customer_name'] = Variable<String>(customerName);
    map['wh_location_id'] = Variable<String>(whLocationId);
    map['product_id'] = Variable<String>(productId);
    map['product_name'] = Variable<String>(productName);
    map['audit_detail_id'] = Variable<String>(auditDetailId);
    map['api_status'] = Variable<String>(apiStatus);
    map['method_name'] = Variable<String>(methodName);
    map['is_location_updated'] = Variable<bool>(isLocationUpdated);
    if (!nullToAbsent || productImage != null) {
      map['product_image'] = Variable<String>(productImage);
    }
    map['is_product_image_updated'] = Variable<bool>(isProductImageUpdated);
    return map;
  }

  WHInOutWardsCompanion toCompanion(bool nullToAbsent) {
    return WHInOutWardsCompanion(
      updatedDateAndTime: Value(updatedDateAndTime),
      inOutWardId: Value(inOutWardId),
      serverInOutWardId: Value(serverInOutWardId),
      qty: Value(qty),
      stockType: Value(stockType),
      description: Value(description),
      invoNo: Value(invoNo),
      invoType: Value(invoType),
      invoDate: Value(invoDate),
      customerName: Value(customerName),
      whLocationId: Value(whLocationId),
      productId: Value(productId),
      productName: Value(productName),
      auditDetailId: Value(auditDetailId),
      apiStatus: Value(apiStatus),
      methodName: Value(methodName),
      isLocationUpdated: Value(isLocationUpdated),
      productImage: productImage == null && nullToAbsent
          ? const Value.absent()
          : Value(productImage),
      isProductImageUpdated: Value(isProductImageUpdated),
    );
  }

  factory WHInOutWardsTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WHInOutWardsTable(
      updatedDateAndTime:
          serializer.fromJson<DateTime>(json['updatedDateAndTime']),
      inOutWardId: serializer.fromJson<String>(json['inOutWardId']),
      serverInOutWardId: serializer.fromJson<String>(json['serverInOutWardId']),
      qty: serializer.fromJson<int>(json['qty']),
      stockType: serializer.fromJson<String>(json['stockType']),
      description: serializer.fromJson<String>(json['description']),
      invoNo: serializer.fromJson<String>(json['invoNo']),
      invoType: serializer.fromJson<String>(json['invoType']),
      invoDate: serializer.fromJson<String>(json['invoDate']),
      customerName: serializer.fromJson<String>(json['customerName']),
      whLocationId: serializer.fromJson<String>(json['whLocationId']),
      productId: serializer.fromJson<String>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      auditDetailId: serializer.fromJson<String>(json['auditDetailId']),
      apiStatus: serializer.fromJson<String>(json['apiStatus']),
      methodName: serializer.fromJson<String>(json['methodName']),
      isLocationUpdated: serializer.fromJson<bool>(json['isLocationUpdated']),
      productImage: serializer.fromJson<String?>(json['productImage']),
      isProductImageUpdated:
          serializer.fromJson<bool>(json['isProductImageUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedDateAndTime': serializer.toJson<DateTime>(updatedDateAndTime),
      'inOutWardId': serializer.toJson<String>(inOutWardId),
      'serverInOutWardId': serializer.toJson<String>(serverInOutWardId),
      'qty': serializer.toJson<int>(qty),
      'stockType': serializer.toJson<String>(stockType),
      'description': serializer.toJson<String>(description),
      'invoNo': serializer.toJson<String>(invoNo),
      'invoType': serializer.toJson<String>(invoType),
      'invoDate': serializer.toJson<String>(invoDate),
      'customerName': serializer.toJson<String>(customerName),
      'whLocationId': serializer.toJson<String>(whLocationId),
      'productId': serializer.toJson<String>(productId),
      'productName': serializer.toJson<String>(productName),
      'auditDetailId': serializer.toJson<String>(auditDetailId),
      'apiStatus': serializer.toJson<String>(apiStatus),
      'methodName': serializer.toJson<String>(methodName),
      'isLocationUpdated': serializer.toJson<bool>(isLocationUpdated),
      'productImage': serializer.toJson<String?>(productImage),
      'isProductImageUpdated': serializer.toJson<bool>(isProductImageUpdated),
    };
  }

  WHInOutWardsTable copyWith(
          {DateTime? updatedDateAndTime,
          String? inOutWardId,
          String? serverInOutWardId,
          int? qty,
          String? stockType,
          String? description,
          String? invoNo,
          String? invoType,
          String? invoDate,
          String? customerName,
          String? whLocationId,
          String? productId,
          String? productName,
          String? auditDetailId,
          String? apiStatus,
          String? methodName,
          bool? isLocationUpdated,
          Value<String?> productImage = const Value.absent(),
          bool? isProductImageUpdated}) =>
      WHInOutWardsTable(
        updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
        inOutWardId: inOutWardId ?? this.inOutWardId,
        serverInOutWardId: serverInOutWardId ?? this.serverInOutWardId,
        qty: qty ?? this.qty,
        stockType: stockType ?? this.stockType,
        description: description ?? this.description,
        invoNo: invoNo ?? this.invoNo,
        invoType: invoType ?? this.invoType,
        invoDate: invoDate ?? this.invoDate,
        customerName: customerName ?? this.customerName,
        whLocationId: whLocationId ?? this.whLocationId,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        auditDetailId: auditDetailId ?? this.auditDetailId,
        apiStatus: apiStatus ?? this.apiStatus,
        methodName: methodName ?? this.methodName,
        isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
        productImage:
            productImage.present ? productImage.value : this.productImage,
        isProductImageUpdated:
            isProductImageUpdated ?? this.isProductImageUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('WHInOutWardsTable(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('inOutWardId: $inOutWardId, ')
          ..write('serverInOutWardId: $serverInOutWardId, ')
          ..write('qty: $qty, ')
          ..write('stockType: $stockType, ')
          ..write('description: $description, ')
          ..write('invoNo: $invoNo, ')
          ..write('invoType: $invoType, ')
          ..write('invoDate: $invoDate, ')
          ..write('customerName: $customerName, ')
          ..write('whLocationId: $whLocationId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isLocationUpdated: $isLocationUpdated, ')
          ..write('productImage: $productImage, ')
          ..write('isProductImageUpdated: $isProductImageUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      updatedDateAndTime,
      inOutWardId,
      serverInOutWardId,
      qty,
      stockType,
      description,
      invoNo,
      invoType,
      invoDate,
      customerName,
      whLocationId,
      productId,
      productName,
      auditDetailId,
      apiStatus,
      methodName,
      isLocationUpdated,
      productImage,
      isProductImageUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WHInOutWardsTable &&
          other.updatedDateAndTime == this.updatedDateAndTime &&
          other.inOutWardId == this.inOutWardId &&
          other.serverInOutWardId == this.serverInOutWardId &&
          other.qty == this.qty &&
          other.stockType == this.stockType &&
          other.description == this.description &&
          other.invoNo == this.invoNo &&
          other.invoType == this.invoType &&
          other.invoDate == this.invoDate &&
          other.customerName == this.customerName &&
          other.whLocationId == this.whLocationId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.auditDetailId == this.auditDetailId &&
          other.apiStatus == this.apiStatus &&
          other.methodName == this.methodName &&
          other.isLocationUpdated == this.isLocationUpdated &&
          other.productImage == this.productImage &&
          other.isProductImageUpdated == this.isProductImageUpdated);
}

class WHInOutWardsCompanion extends UpdateCompanion<WHInOutWardsTable> {
  final Value<DateTime> updatedDateAndTime;
  final Value<String> inOutWardId;
  final Value<String> serverInOutWardId;
  final Value<int> qty;
  final Value<String> stockType;
  final Value<String> description;
  final Value<String> invoNo;
  final Value<String> invoType;
  final Value<String> invoDate;
  final Value<String> customerName;
  final Value<String> whLocationId;
  final Value<String> productId;
  final Value<String> productName;
  final Value<String> auditDetailId;
  final Value<String> apiStatus;
  final Value<String> methodName;
  final Value<bool> isLocationUpdated;
  final Value<String?> productImage;
  final Value<bool> isProductImageUpdated;
  final Value<int> rowid;
  const WHInOutWardsCompanion({
    this.updatedDateAndTime = const Value.absent(),
    this.inOutWardId = const Value.absent(),
    this.serverInOutWardId = const Value.absent(),
    this.qty = const Value.absent(),
    this.stockType = const Value.absent(),
    this.description = const Value.absent(),
    this.invoNo = const Value.absent(),
    this.invoType = const Value.absent(),
    this.invoDate = const Value.absent(),
    this.customerName = const Value.absent(),
    this.whLocationId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.auditDetailId = const Value.absent(),
    this.apiStatus = const Value.absent(),
    this.methodName = const Value.absent(),
    this.isLocationUpdated = const Value.absent(),
    this.productImage = const Value.absent(),
    this.isProductImageUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WHInOutWardsCompanion.insert({
    required DateTime updatedDateAndTime,
    required String inOutWardId,
    required String serverInOutWardId,
    required int qty,
    required String stockType,
    required String description,
    required String invoNo,
    required String invoType,
    required String invoDate,
    required String customerName,
    required String whLocationId,
    required String productId,
    required String productName,
    required String auditDetailId,
    required String apiStatus,
    required String methodName,
    required bool isLocationUpdated,
    this.productImage = const Value.absent(),
    required bool isProductImageUpdated,
    this.rowid = const Value.absent(),
  })  : updatedDateAndTime = Value(updatedDateAndTime),
        inOutWardId = Value(inOutWardId),
        serverInOutWardId = Value(serverInOutWardId),
        qty = Value(qty),
        stockType = Value(stockType),
        description = Value(description),
        invoNo = Value(invoNo),
        invoType = Value(invoType),
        invoDate = Value(invoDate),
        customerName = Value(customerName),
        whLocationId = Value(whLocationId),
        productId = Value(productId),
        productName = Value(productName),
        auditDetailId = Value(auditDetailId),
        apiStatus = Value(apiStatus),
        methodName = Value(methodName),
        isLocationUpdated = Value(isLocationUpdated),
        isProductImageUpdated = Value(isProductImageUpdated);
  static Insertable<WHInOutWardsTable> custom({
    Expression<DateTime>? updatedDateAndTime,
    Expression<String>? inOutWardId,
    Expression<String>? serverInOutWardId,
    Expression<int>? qty,
    Expression<String>? stockType,
    Expression<String>? description,
    Expression<String>? invoNo,
    Expression<String>? invoType,
    Expression<String>? invoDate,
    Expression<String>? customerName,
    Expression<String>? whLocationId,
    Expression<String>? productId,
    Expression<String>? productName,
    Expression<String>? auditDetailId,
    Expression<String>? apiStatus,
    Expression<String>? methodName,
    Expression<bool>? isLocationUpdated,
    Expression<String>? productImage,
    Expression<bool>? isProductImageUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedDateAndTime != null)
        'updated_date_and_time': updatedDateAndTime,
      if (inOutWardId != null) 'in_out_ward_id': inOutWardId,
      if (serverInOutWardId != null) 'server_in_out_ward_id': serverInOutWardId,
      if (qty != null) 'qty': qty,
      if (stockType != null) 'stock_type': stockType,
      if (description != null) 'description': description,
      if (invoNo != null) 'invo_no': invoNo,
      if (invoType != null) 'invo_type': invoType,
      if (invoDate != null) 'invo_date': invoDate,
      if (customerName != null) 'customer_name': customerName,
      if (whLocationId != null) 'wh_location_id': whLocationId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (auditDetailId != null) 'audit_detail_id': auditDetailId,
      if (apiStatus != null) 'api_status': apiStatus,
      if (methodName != null) 'method_name': methodName,
      if (isLocationUpdated != null) 'is_location_updated': isLocationUpdated,
      if (productImage != null) 'product_image': productImage,
      if (isProductImageUpdated != null)
        'is_product_image_updated': isProductImageUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WHInOutWardsCompanion copyWith(
      {Value<DateTime>? updatedDateAndTime,
      Value<String>? inOutWardId,
      Value<String>? serverInOutWardId,
      Value<int>? qty,
      Value<String>? stockType,
      Value<String>? description,
      Value<String>? invoNo,
      Value<String>? invoType,
      Value<String>? invoDate,
      Value<String>? customerName,
      Value<String>? whLocationId,
      Value<String>? productId,
      Value<String>? productName,
      Value<String>? auditDetailId,
      Value<String>? apiStatus,
      Value<String>? methodName,
      Value<bool>? isLocationUpdated,
      Value<String?>? productImage,
      Value<bool>? isProductImageUpdated,
      Value<int>? rowid}) {
    return WHInOutWardsCompanion(
      updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
      inOutWardId: inOutWardId ?? this.inOutWardId,
      serverInOutWardId: serverInOutWardId ?? this.serverInOutWardId,
      qty: qty ?? this.qty,
      stockType: stockType ?? this.stockType,
      description: description ?? this.description,
      invoNo: invoNo ?? this.invoNo,
      invoType: invoType ?? this.invoType,
      invoDate: invoDate ?? this.invoDate,
      customerName: customerName ?? this.customerName,
      whLocationId: whLocationId ?? this.whLocationId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      auditDetailId: auditDetailId ?? this.auditDetailId,
      apiStatus: apiStatus ?? this.apiStatus,
      methodName: methodName ?? this.methodName,
      isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
      productImage: productImage ?? this.productImage,
      isProductImageUpdated:
          isProductImageUpdated ?? this.isProductImageUpdated,
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
    if (inOutWardId.present) {
      map['in_out_ward_id'] = Variable<String>(inOutWardId.value);
    }
    if (serverInOutWardId.present) {
      map['server_in_out_ward_id'] = Variable<String>(serverInOutWardId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (stockType.present) {
      map['stock_type'] = Variable<String>(stockType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (invoNo.present) {
      map['invo_no'] = Variable<String>(invoNo.value);
    }
    if (invoType.present) {
      map['invo_type'] = Variable<String>(invoType.value);
    }
    if (invoDate.present) {
      map['invo_date'] = Variable<String>(invoDate.value);
    }
    if (customerName.present) {
      map['customer_name'] = Variable<String>(customerName.value);
    }
    if (whLocationId.present) {
      map['wh_location_id'] = Variable<String>(whLocationId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (auditDetailId.present) {
      map['audit_detail_id'] = Variable<String>(auditDetailId.value);
    }
    if (apiStatus.present) {
      map['api_status'] = Variable<String>(apiStatus.value);
    }
    if (methodName.present) {
      map['method_name'] = Variable<String>(methodName.value);
    }
    if (isLocationUpdated.present) {
      map['is_location_updated'] = Variable<bool>(isLocationUpdated.value);
    }
    if (productImage.present) {
      map['product_image'] = Variable<String>(productImage.value);
    }
    if (isProductImageUpdated.present) {
      map['is_product_image_updated'] =
          Variable<bool>(isProductImageUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WHInOutWardsCompanion(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('inOutWardId: $inOutWardId, ')
          ..write('serverInOutWardId: $serverInOutWardId, ')
          ..write('qty: $qty, ')
          ..write('stockType: $stockType, ')
          ..write('description: $description, ')
          ..write('invoNo: $invoNo, ')
          ..write('invoType: $invoType, ')
          ..write('invoDate: $invoDate, ')
          ..write('customerName: $customerName, ')
          ..write('whLocationId: $whLocationId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isLocationUpdated: $isLocationUpdated, ')
          ..write('productImage: $productImage, ')
          ..write('isProductImageUpdated: $isProductImageUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WHAuditingTable extends WHAuditing
    with TableInfo<$WHAuditingTable, WHAuditingTable> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WHAuditingTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _updatedDateAndTimeMeta =
      const VerificationMeta('updatedDateAndTime');
  @override
  late final GeneratedColumn<DateTime> updatedDateAndTime =
      GeneratedColumn<DateTime>('updated_date_and_time', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _auditingIdMeta =
      const VerificationMeta('auditingId');
  @override
  late final GeneratedColumn<String> auditingId = GeneratedColumn<String>(
      'auditing_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _serverAuditingIdMeta =
      const VerificationMeta('serverAuditingId');
  @override
  late final GeneratedColumn<String> serverAuditingId = GeneratedColumn<String>(
      'server_auditing_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _qtyMeta = const VerificationMeta('qty');
  @override
  late final GeneratedColumn<int> qty = GeneratedColumn<int>(
      'qty', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _bestBeforeMeta =
      const VerificationMeta('bestBefore');
  @override
  late final GeneratedColumn<int> bestBefore = GeneratedColumn<int>(
      'best_before', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _stockTypeMeta =
      const VerificationMeta('stockType');
  @override
  late final GeneratedColumn<String> stockType = GeneratedColumn<String>(
      'stock_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productQualityMeta =
      const VerificationMeta('productQuality');
  @override
  late final GeneratedColumn<String> productQuality = GeneratedColumn<String>(
      'product_quality', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _whLocationIdMeta =
      const VerificationMeta('whLocationId');
  @override
  late final GeneratedColumn<String> whLocationId = GeneratedColumn<String>(
      'wh_location_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _auditDetailIdMeta =
      const VerificationMeta('auditDetailId');
  @override
  late final GeneratedColumn<String> auditDetailId = GeneratedColumn<String>(
      'audit_detail_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mfDateMeta = const VerificationMeta('mfDate');
  @override
  late final GeneratedColumn<String> mfDate = GeneratedColumn<String>(
      'mf_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productImageUriMeta =
      const VerificationMeta('productImageUri');
  @override
  late final GeneratedColumn<String> productImageUri = GeneratedColumn<String>(
      'product_image_uri', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isProductImageUriUpdatedMeta =
      const VerificationMeta('isProductImageUriUpdated');
  @override
  late final GeneratedColumn<bool> isProductImageUriUpdated =
      GeneratedColumn<bool>(
          'is_product_image_uri_updated', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: true,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("is_product_image_uri_updated" IN (0, 1))'));
  static const VerificationMeta _apiStatusMeta =
      const VerificationMeta('apiStatus');
  @override
  late final GeneratedColumn<String> apiStatus = GeneratedColumn<String>(
      'api_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _methodNameMeta =
      const VerificationMeta('methodName');
  @override
  late final GeneratedColumn<String> methodName = GeneratedColumn<String>(
      'method_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isLocationUpdatedMeta =
      const VerificationMeta('isLocationUpdated');
  @override
  late final GeneratedColumn<bool> isLocationUpdated = GeneratedColumn<bool>(
      'is_location_updated', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_location_updated" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns => [
        updatedDateAndTime,
        auditingId,
        serverAuditingId,
        qty,
        bestBefore,
        stockType,
        productQuality,
        productId,
        productName,
        whLocationId,
        auditDetailId,
        description,
        mfDate,
        productImageUri,
        isProductImageUriUpdated,
        apiStatus,
        methodName,
        isLocationUpdated
      ];
  @override
  String get aliasedName => _alias ?? 'w_h_auditing';
  @override
  String get actualTableName => 'w_h_auditing';
  @override
  VerificationContext validateIntegrity(Insertable<WHAuditingTable> instance,
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
    if (data.containsKey('auditing_id')) {
      context.handle(
          _auditingIdMeta,
          auditingId.isAcceptableOrUnknown(
              data['auditing_id']!, _auditingIdMeta));
    } else if (isInserting) {
      context.missing(_auditingIdMeta);
    }
    if (data.containsKey('server_auditing_id')) {
      context.handle(
          _serverAuditingIdMeta,
          serverAuditingId.isAcceptableOrUnknown(
              data['server_auditing_id']!, _serverAuditingIdMeta));
    } else if (isInserting) {
      context.missing(_serverAuditingIdMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('best_before')) {
      context.handle(
          _bestBeforeMeta,
          bestBefore.isAcceptableOrUnknown(
              data['best_before']!, _bestBeforeMeta));
    } else if (isInserting) {
      context.missing(_bestBeforeMeta);
    }
    if (data.containsKey('stock_type')) {
      context.handle(_stockTypeMeta,
          stockType.isAcceptableOrUnknown(data['stock_type']!, _stockTypeMeta));
    } else if (isInserting) {
      context.missing(_stockTypeMeta);
    }
    if (data.containsKey('product_quality')) {
      context.handle(
          _productQualityMeta,
          productQuality.isAcceptableOrUnknown(
              data['product_quality']!, _productQualityMeta));
    } else if (isInserting) {
      context.missing(_productQualityMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('wh_location_id')) {
      context.handle(
          _whLocationIdMeta,
          whLocationId.isAcceptableOrUnknown(
              data['wh_location_id']!, _whLocationIdMeta));
    } else if (isInserting) {
      context.missing(_whLocationIdMeta);
    }
    if (data.containsKey('audit_detail_id')) {
      context.handle(
          _auditDetailIdMeta,
          auditDetailId.isAcceptableOrUnknown(
              data['audit_detail_id']!, _auditDetailIdMeta));
    } else if (isInserting) {
      context.missing(_auditDetailIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('mf_date')) {
      context.handle(_mfDateMeta,
          mfDate.isAcceptableOrUnknown(data['mf_date']!, _mfDateMeta));
    } else if (isInserting) {
      context.missing(_mfDateMeta);
    }
    if (data.containsKey('product_image_uri')) {
      context.handle(
          _productImageUriMeta,
          productImageUri.isAcceptableOrUnknown(
              data['product_image_uri']!, _productImageUriMeta));
    } else if (isInserting) {
      context.missing(_productImageUriMeta);
    }
    if (data.containsKey('is_product_image_uri_updated')) {
      context.handle(
          _isProductImageUriUpdatedMeta,
          isProductImageUriUpdated.isAcceptableOrUnknown(
              data['is_product_image_uri_updated']!,
              _isProductImageUriUpdatedMeta));
    } else if (isInserting) {
      context.missing(_isProductImageUriUpdatedMeta);
    }
    if (data.containsKey('api_status')) {
      context.handle(_apiStatusMeta,
          apiStatus.isAcceptableOrUnknown(data['api_status']!, _apiStatusMeta));
    } else if (isInserting) {
      context.missing(_apiStatusMeta);
    }
    if (data.containsKey('method_name')) {
      context.handle(
          _methodNameMeta,
          methodName.isAcceptableOrUnknown(
              data['method_name']!, _methodNameMeta));
    } else if (isInserting) {
      context.missing(_methodNameMeta);
    }
    if (data.containsKey('is_location_updated')) {
      context.handle(
          _isLocationUpdatedMeta,
          isLocationUpdated.isAcceptableOrUnknown(
              data['is_location_updated']!, _isLocationUpdatedMeta));
    } else if (isInserting) {
      context.missing(_isLocationUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {auditingId, auditDetailId};
  @override
  WHAuditingTable map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WHAuditingTable(
      updatedDateAndTime: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}updated_date_and_time'])!,
      auditingId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}auditing_id'])!,
      serverAuditingId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}server_auditing_id'])!,
      qty: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}qty'])!,
      bestBefore: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}best_before'])!,
      stockType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}stock_type'])!,
      productQuality: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_quality'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      whLocationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wh_location_id'])!,
      auditDetailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audit_detail_id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      mfDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mf_date'])!,
      productImageUri: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}product_image_uri'])!,
      isProductImageUriUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}is_product_image_uri_updated'])!,
      apiStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}api_status'])!,
      methodName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}method_name'])!,
      isLocationUpdated: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}is_location_updated'])!,
    );
  }

  @override
  $WHAuditingTable createAlias(String alias) {
    return $WHAuditingTable(attachedDatabase, alias);
  }
}

class WHAuditingTable extends DataClass implements Insertable<WHAuditingTable> {
  final DateTime updatedDateAndTime;
  final String auditingId;
  final String serverAuditingId;
  final int qty;
  final int bestBefore;
  final String stockType;
  final String productQuality;
  final String productId;
  final String productName;
  final String whLocationId;
  final String auditDetailId;
  final String description;
  final String mfDate;
  final String productImageUri;
  final bool isProductImageUriUpdated;
  final String apiStatus;
  final String methodName;
  final bool isLocationUpdated;
  const WHAuditingTable(
      {required this.updatedDateAndTime,
      required this.auditingId,
      required this.serverAuditingId,
      required this.qty,
      required this.bestBefore,
      required this.stockType,
      required this.productQuality,
      required this.productId,
      required this.productName,
      required this.whLocationId,
      required this.auditDetailId,
      required this.description,
      required this.mfDate,
      required this.productImageUri,
      required this.isProductImageUriUpdated,
      required this.apiStatus,
      required this.methodName,
      required this.isLocationUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['updated_date_and_time'] = Variable<DateTime>(updatedDateAndTime);
    map['auditing_id'] = Variable<String>(auditingId);
    map['server_auditing_id'] = Variable<String>(serverAuditingId);
    map['qty'] = Variable<int>(qty);
    map['best_before'] = Variable<int>(bestBefore);
    map['stock_type'] = Variable<String>(stockType);
    map['product_quality'] = Variable<String>(productQuality);
    map['product_id'] = Variable<String>(productId);
    map['product_name'] = Variable<String>(productName);
    map['wh_location_id'] = Variable<String>(whLocationId);
    map['audit_detail_id'] = Variable<String>(auditDetailId);
    map['description'] = Variable<String>(description);
    map['mf_date'] = Variable<String>(mfDate);
    map['product_image_uri'] = Variable<String>(productImageUri);
    map['is_product_image_uri_updated'] =
        Variable<bool>(isProductImageUriUpdated);
    map['api_status'] = Variable<String>(apiStatus);
    map['method_name'] = Variable<String>(methodName);
    map['is_location_updated'] = Variable<bool>(isLocationUpdated);
    return map;
  }

  WHAuditingCompanion toCompanion(bool nullToAbsent) {
    return WHAuditingCompanion(
      updatedDateAndTime: Value(updatedDateAndTime),
      auditingId: Value(auditingId),
      serverAuditingId: Value(serverAuditingId),
      qty: Value(qty),
      bestBefore: Value(bestBefore),
      stockType: Value(stockType),
      productQuality: Value(productQuality),
      productId: Value(productId),
      productName: Value(productName),
      whLocationId: Value(whLocationId),
      auditDetailId: Value(auditDetailId),
      description: Value(description),
      mfDate: Value(mfDate),
      productImageUri: Value(productImageUri),
      isProductImageUriUpdated: Value(isProductImageUriUpdated),
      apiStatus: Value(apiStatus),
      methodName: Value(methodName),
      isLocationUpdated: Value(isLocationUpdated),
    );
  }

  factory WHAuditingTable.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WHAuditingTable(
      updatedDateAndTime:
          serializer.fromJson<DateTime>(json['updatedDateAndTime']),
      auditingId: serializer.fromJson<String>(json['auditingId']),
      serverAuditingId: serializer.fromJson<String>(json['serverAuditingId']),
      qty: serializer.fromJson<int>(json['qty']),
      bestBefore: serializer.fromJson<int>(json['bestBefore']),
      stockType: serializer.fromJson<String>(json['stockType']),
      productQuality: serializer.fromJson<String>(json['productQuality']),
      productId: serializer.fromJson<String>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      whLocationId: serializer.fromJson<String>(json['whLocationId']),
      auditDetailId: serializer.fromJson<String>(json['auditDetailId']),
      description: serializer.fromJson<String>(json['description']),
      mfDate: serializer.fromJson<String>(json['mfDate']),
      productImageUri: serializer.fromJson<String>(json['productImageUri']),
      isProductImageUriUpdated:
          serializer.fromJson<bool>(json['isProductImageUriUpdated']),
      apiStatus: serializer.fromJson<String>(json['apiStatus']),
      methodName: serializer.fromJson<String>(json['methodName']),
      isLocationUpdated: serializer.fromJson<bool>(json['isLocationUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'updatedDateAndTime': serializer.toJson<DateTime>(updatedDateAndTime),
      'auditingId': serializer.toJson<String>(auditingId),
      'serverAuditingId': serializer.toJson<String>(serverAuditingId),
      'qty': serializer.toJson<int>(qty),
      'bestBefore': serializer.toJson<int>(bestBefore),
      'stockType': serializer.toJson<String>(stockType),
      'productQuality': serializer.toJson<String>(productQuality),
      'productId': serializer.toJson<String>(productId),
      'productName': serializer.toJson<String>(productName),
      'whLocationId': serializer.toJson<String>(whLocationId),
      'auditDetailId': serializer.toJson<String>(auditDetailId),
      'description': serializer.toJson<String>(description),
      'mfDate': serializer.toJson<String>(mfDate),
      'productImageUri': serializer.toJson<String>(productImageUri),
      'isProductImageUriUpdated':
          serializer.toJson<bool>(isProductImageUriUpdated),
      'apiStatus': serializer.toJson<String>(apiStatus),
      'methodName': serializer.toJson<String>(methodName),
      'isLocationUpdated': serializer.toJson<bool>(isLocationUpdated),
    };
  }

  WHAuditingTable copyWith(
          {DateTime? updatedDateAndTime,
          String? auditingId,
          String? serverAuditingId,
          int? qty,
          int? bestBefore,
          String? stockType,
          String? productQuality,
          String? productId,
          String? productName,
          String? whLocationId,
          String? auditDetailId,
          String? description,
          String? mfDate,
          String? productImageUri,
          bool? isProductImageUriUpdated,
          String? apiStatus,
          String? methodName,
          bool? isLocationUpdated}) =>
      WHAuditingTable(
        updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
        auditingId: auditingId ?? this.auditingId,
        serverAuditingId: serverAuditingId ?? this.serverAuditingId,
        qty: qty ?? this.qty,
        bestBefore: bestBefore ?? this.bestBefore,
        stockType: stockType ?? this.stockType,
        productQuality: productQuality ?? this.productQuality,
        productId: productId ?? this.productId,
        productName: productName ?? this.productName,
        whLocationId: whLocationId ?? this.whLocationId,
        auditDetailId: auditDetailId ?? this.auditDetailId,
        description: description ?? this.description,
        mfDate: mfDate ?? this.mfDate,
        productImageUri: productImageUri ?? this.productImageUri,
        isProductImageUriUpdated:
            isProductImageUriUpdated ?? this.isProductImageUriUpdated,
        apiStatus: apiStatus ?? this.apiStatus,
        methodName: methodName ?? this.methodName,
        isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
      );
  @override
  String toString() {
    return (StringBuffer('WHAuditingTable(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('auditingId: $auditingId, ')
          ..write('serverAuditingId: $serverAuditingId, ')
          ..write('qty: $qty, ')
          ..write('bestBefore: $bestBefore, ')
          ..write('stockType: $stockType, ')
          ..write('productQuality: $productQuality, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('whLocationId: $whLocationId, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('description: $description, ')
          ..write('mfDate: $mfDate, ')
          ..write('productImageUri: $productImageUri, ')
          ..write('isProductImageUriUpdated: $isProductImageUriUpdated, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isLocationUpdated: $isLocationUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      updatedDateAndTime,
      auditingId,
      serverAuditingId,
      qty,
      bestBefore,
      stockType,
      productQuality,
      productId,
      productName,
      whLocationId,
      auditDetailId,
      description,
      mfDate,
      productImageUri,
      isProductImageUriUpdated,
      apiStatus,
      methodName,
      isLocationUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WHAuditingTable &&
          other.updatedDateAndTime == this.updatedDateAndTime &&
          other.auditingId == this.auditingId &&
          other.serverAuditingId == this.serverAuditingId &&
          other.qty == this.qty &&
          other.bestBefore == this.bestBefore &&
          other.stockType == this.stockType &&
          other.productQuality == this.productQuality &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.whLocationId == this.whLocationId &&
          other.auditDetailId == this.auditDetailId &&
          other.description == this.description &&
          other.mfDate == this.mfDate &&
          other.productImageUri == this.productImageUri &&
          other.isProductImageUriUpdated == this.isProductImageUriUpdated &&
          other.apiStatus == this.apiStatus &&
          other.methodName == this.methodName &&
          other.isLocationUpdated == this.isLocationUpdated);
}

class WHAuditingCompanion extends UpdateCompanion<WHAuditingTable> {
  final Value<DateTime> updatedDateAndTime;
  final Value<String> auditingId;
  final Value<String> serverAuditingId;
  final Value<int> qty;
  final Value<int> bestBefore;
  final Value<String> stockType;
  final Value<String> productQuality;
  final Value<String> productId;
  final Value<String> productName;
  final Value<String> whLocationId;
  final Value<String> auditDetailId;
  final Value<String> description;
  final Value<String> mfDate;
  final Value<String> productImageUri;
  final Value<bool> isProductImageUriUpdated;
  final Value<String> apiStatus;
  final Value<String> methodName;
  final Value<bool> isLocationUpdated;
  final Value<int> rowid;
  const WHAuditingCompanion({
    this.updatedDateAndTime = const Value.absent(),
    this.auditingId = const Value.absent(),
    this.serverAuditingId = const Value.absent(),
    this.qty = const Value.absent(),
    this.bestBefore = const Value.absent(),
    this.stockType = const Value.absent(),
    this.productQuality = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.whLocationId = const Value.absent(),
    this.auditDetailId = const Value.absent(),
    this.description = const Value.absent(),
    this.mfDate = const Value.absent(),
    this.productImageUri = const Value.absent(),
    this.isProductImageUriUpdated = const Value.absent(),
    this.apiStatus = const Value.absent(),
    this.methodName = const Value.absent(),
    this.isLocationUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WHAuditingCompanion.insert({
    required DateTime updatedDateAndTime,
    required String auditingId,
    required String serverAuditingId,
    required int qty,
    required int bestBefore,
    required String stockType,
    required String productQuality,
    required String productId,
    required String productName,
    required String whLocationId,
    required String auditDetailId,
    required String description,
    required String mfDate,
    required String productImageUri,
    required bool isProductImageUriUpdated,
    required String apiStatus,
    required String methodName,
    required bool isLocationUpdated,
    this.rowid = const Value.absent(),
  })  : updatedDateAndTime = Value(updatedDateAndTime),
        auditingId = Value(auditingId),
        serverAuditingId = Value(serverAuditingId),
        qty = Value(qty),
        bestBefore = Value(bestBefore),
        stockType = Value(stockType),
        productQuality = Value(productQuality),
        productId = Value(productId),
        productName = Value(productName),
        whLocationId = Value(whLocationId),
        auditDetailId = Value(auditDetailId),
        description = Value(description),
        mfDate = Value(mfDate),
        productImageUri = Value(productImageUri),
        isProductImageUriUpdated = Value(isProductImageUriUpdated),
        apiStatus = Value(apiStatus),
        methodName = Value(methodName),
        isLocationUpdated = Value(isLocationUpdated);
  static Insertable<WHAuditingTable> custom({
    Expression<DateTime>? updatedDateAndTime,
    Expression<String>? auditingId,
    Expression<String>? serverAuditingId,
    Expression<int>? qty,
    Expression<int>? bestBefore,
    Expression<String>? stockType,
    Expression<String>? productQuality,
    Expression<String>? productId,
    Expression<String>? productName,
    Expression<String>? whLocationId,
    Expression<String>? auditDetailId,
    Expression<String>? description,
    Expression<String>? mfDate,
    Expression<String>? productImageUri,
    Expression<bool>? isProductImageUriUpdated,
    Expression<String>? apiStatus,
    Expression<String>? methodName,
    Expression<bool>? isLocationUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (updatedDateAndTime != null)
        'updated_date_and_time': updatedDateAndTime,
      if (auditingId != null) 'auditing_id': auditingId,
      if (serverAuditingId != null) 'server_auditing_id': serverAuditingId,
      if (qty != null) 'qty': qty,
      if (bestBefore != null) 'best_before': bestBefore,
      if (stockType != null) 'stock_type': stockType,
      if (productQuality != null) 'product_quality': productQuality,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (whLocationId != null) 'wh_location_id': whLocationId,
      if (auditDetailId != null) 'audit_detail_id': auditDetailId,
      if (description != null) 'description': description,
      if (mfDate != null) 'mf_date': mfDate,
      if (productImageUri != null) 'product_image_uri': productImageUri,
      if (isProductImageUriUpdated != null)
        'is_product_image_uri_updated': isProductImageUriUpdated,
      if (apiStatus != null) 'api_status': apiStatus,
      if (methodName != null) 'method_name': methodName,
      if (isLocationUpdated != null) 'is_location_updated': isLocationUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WHAuditingCompanion copyWith(
      {Value<DateTime>? updatedDateAndTime,
      Value<String>? auditingId,
      Value<String>? serverAuditingId,
      Value<int>? qty,
      Value<int>? bestBefore,
      Value<String>? stockType,
      Value<String>? productQuality,
      Value<String>? productId,
      Value<String>? productName,
      Value<String>? whLocationId,
      Value<String>? auditDetailId,
      Value<String>? description,
      Value<String>? mfDate,
      Value<String>? productImageUri,
      Value<bool>? isProductImageUriUpdated,
      Value<String>? apiStatus,
      Value<String>? methodName,
      Value<bool>? isLocationUpdated,
      Value<int>? rowid}) {
    return WHAuditingCompanion(
      updatedDateAndTime: updatedDateAndTime ?? this.updatedDateAndTime,
      auditingId: auditingId ?? this.auditingId,
      serverAuditingId: serverAuditingId ?? this.serverAuditingId,
      qty: qty ?? this.qty,
      bestBefore: bestBefore ?? this.bestBefore,
      stockType: stockType ?? this.stockType,
      productQuality: productQuality ?? this.productQuality,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      whLocationId: whLocationId ?? this.whLocationId,
      auditDetailId: auditDetailId ?? this.auditDetailId,
      description: description ?? this.description,
      mfDate: mfDate ?? this.mfDate,
      productImageUri: productImageUri ?? this.productImageUri,
      isProductImageUriUpdated:
          isProductImageUriUpdated ?? this.isProductImageUriUpdated,
      apiStatus: apiStatus ?? this.apiStatus,
      methodName: methodName ?? this.methodName,
      isLocationUpdated: isLocationUpdated ?? this.isLocationUpdated,
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
    if (auditingId.present) {
      map['auditing_id'] = Variable<String>(auditingId.value);
    }
    if (serverAuditingId.present) {
      map['server_auditing_id'] = Variable<String>(serverAuditingId.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (bestBefore.present) {
      map['best_before'] = Variable<int>(bestBefore.value);
    }
    if (stockType.present) {
      map['stock_type'] = Variable<String>(stockType.value);
    }
    if (productQuality.present) {
      map['product_quality'] = Variable<String>(productQuality.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (whLocationId.present) {
      map['wh_location_id'] = Variable<String>(whLocationId.value);
    }
    if (auditDetailId.present) {
      map['audit_detail_id'] = Variable<String>(auditDetailId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (mfDate.present) {
      map['mf_date'] = Variable<String>(mfDate.value);
    }
    if (productImageUri.present) {
      map['product_image_uri'] = Variable<String>(productImageUri.value);
    }
    if (isProductImageUriUpdated.present) {
      map['is_product_image_uri_updated'] =
          Variable<bool>(isProductImageUriUpdated.value);
    }
    if (apiStatus.present) {
      map['api_status'] = Variable<String>(apiStatus.value);
    }
    if (methodName.present) {
      map['method_name'] = Variable<String>(methodName.value);
    }
    if (isLocationUpdated.present) {
      map['is_location_updated'] = Variable<bool>(isLocationUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WHAuditingCompanion(')
          ..write('updatedDateAndTime: $updatedDateAndTime, ')
          ..write('auditingId: $auditingId, ')
          ..write('serverAuditingId: $serverAuditingId, ')
          ..write('qty: $qty, ')
          ..write('bestBefore: $bestBefore, ')
          ..write('stockType: $stockType, ')
          ..write('productQuality: $productQuality, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('whLocationId: $whLocationId, ')
          ..write('auditDetailId: $auditDetailId, ')
          ..write('description: $description, ')
          ..write('mfDate: $mfDate, ')
          ..write('productImageUri: $productImageUri, ')
          ..write('isProductImageUriUpdated: $isProductImageUriUpdated, ')
          ..write('apiStatus: $apiStatus, ')
          ..write('methodName: $methodName, ')
          ..write('isLocationUpdated: $isLocationUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  late final $ApiDataTable apiData = $ApiDataTable(this);
  late final $WHLocationTable wHLocation = $WHLocationTable(this);
  late final $WHInOutWardsTable wHInOutWards = $WHInOutWardsTable(this);
  late final $WHAuditingTable wHAuditing = $WHAuditingTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [apiData, wHLocation, wHInOutWards, wHAuditing];
}
