import 'dart:ffi';

import 'package:cms_audit/core/utils/db_api_status.dart';
import 'package:cms_audit/domain/local_data_base/method_status.dart';
import 'package:drift/drift.dart';

import '../../core/utils/utils.dart';
import 'database.dart';

class DatabaseHelper {
  final Database _database = Database();

  factory DatabaseHelper() {
    return _singleton;
  }

  DatabaseHelper._internal();

  /*
  * This is used to create the singleton class*/
  static final DatabaseHelper _singleton = DatabaseHelper._internal();

  /*
  * This method will return all the record in ApiDataTable*/
  Future<List<ApiDataTable>> getAllApiData() async {
    return await _database.select(_database.apiData).get();
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<ApiDataTable?> getApiDataByTag(String tag) async {
    final query = _database.select(_database.apiData)
      ..where((tbl) => tbl.tag.equals(tag));
    final list = await query.get();
    if (list.length > 0) {
      return list[0];
    }
    return null;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> insertApiDataTag(String tag, String data) async {
    await deleteApiDataByTag(tag);
    final query = _database.into(_database.apiData).insert(
        ApiDataTable(data: data, tag: tag, updatedDateAndTime: DateTime.now()));
    return await query;
  }

  /*
  * This method is used to delete the data in ApiDataTable by tag*/
  Future<int> deleteApiDataByTag(String tag) async {
    final query = _database.delete(_database.apiData)
      ..where((tbl) => (tbl.tag.equals(tag)));
    return await query.go();
  }

  /*
  * This method is used to delete all records in the ApiDataTable*/
  Future<int> deleteAllApi() async {
    final query = _database.delete(_database.apiData);
    return await query.go();
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> insertWHLocation(
      {required String locationName,
      required String palletNumber,
      required String description,
      required bool isActive,
      required String auditDetailId}) async {
    String locationId = Utils.getNewGuId();
    final query = _database.into(_database.wHLocation).insert(WHLocationTable(
        updatedDateAndTime: DateTime.now(),
        locationName: locationName,
        palletNumber: palletNumber,
        description: description,
        auditDetailId: auditDetailId,
        isActive: isActive,
        apiStatus: DB_API_STATUS.TODO.name,
        locationId: locationId,
        localLocationId: locationId,
        methodName: METHOD_STATUS.CREATE.name,
        isLocationUpdated: false));
    return await query;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> updateWHLocation({
    required String locationName,
    required String palletNumber,
    required String description,
    required bool isActive,
    required String auditDetailId,
    required String locationId,
  }) async {
    WHLocationCompanion entity = WHLocationCompanion(
        locationName: Value(locationName),
        palletNumber: Value(palletNumber),
        apiStatus: Value(DB_API_STATUS.TODO.name),
        description: Value(description),
        isActive: Value(isActive));
    final query = _database.update(_database.wHLocation)
      ..where((tbl) => tbl.locationId.equals(locationId))
      ..write(entity);
    await query;
    return 1;
  }

  /*
  * This method is used to update the local guid with api guid and also update location id in whAuditingTable and whInOutWardsTable*/
  Future<int> updateWHLocationId({
    required String oldLocationId,
    required String newLocationId,
  }) async {
    WHLocationCompanion entity = WHLocationCompanion(
        localLocationId: Value(oldLocationId),
        locationId: Value(newLocationId),
        isLocationUpdated: const Value(true),
        apiStatus: Value(DB_API_STATUS.COMPLETED.name));
    final query = _database.update(_database.wHLocation)
      ..where((tbl) => tbl.locationId.equals(oldLocationId))
      ..write(entity);
    await query;
    await updateWHInOutWardLocationId(
        whNewLocationId: newLocationId, whOldLocationId: oldLocationId);
    await updateWHAuditingLocationId(
        whNewLocationId: newLocationId, whOldLocationId: oldLocationId);
    return 1;
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHLocation({required String guid}) async {
    final query = _database.delete(_database.wHLocation)
      ..where((tbl) => tbl.locationId.equals(guid));
    return await query.go();
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHInOutWard({required String guid}) async {
    final query = _database.delete(_database.wHInOutWards)
      ..where((tbl) => tbl.inOutWardId.equals(guid));
    return await query.go();
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHAuditing({required String guid}) async {
    final query = _database.delete(_database.wHAuditing)
      ..where((tbl) => tbl.auditingId.equals(guid));
    return await query.go();
  }

  /*
  * This method is used to update delete WHLocations*/
  Future<int> updateDeleteWHAuditing({required String guid}) async {
    WHAuditingCompanion entity = WHAuditingCompanion(
        methodName: Value(METHOD_STATUS.DELETE.name),
        apiStatus: Value(DB_API_STATUS.TODO.name));

    final query = _database.update(_database.wHAuditing)
      ..where((tbl) => tbl.auditingId.equals(guid))
      ..write(entity);
    await query;

    return 1;
  }

  /*
  * This method is used to update delete WHInOurWards*/
  Future<int> updateDeleteWHInOutWards({required String guid}) async {
    WHInOutWardsCompanion entity = WHInOutWardsCompanion(
        methodName: Value(METHOD_STATUS.DELETE.name),
        apiStatus: Value(DB_API_STATUS.TODO.name));
    final query = _database.update(_database.wHInOutWards)
      ..where((tbl) => tbl.inOutWardId.equals(guid))
      ..write(entity);
    await query;
    return 1;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHLocationTable>> getWHLocationByAuditId(String auditId) async {
    List<WHLocationTable> query =
        await _database.select(_database.wHLocation).get();
    List<WHLocationTable> whLocations = query.where((tbl) {
      return tbl.auditDetailId == auditId;
    }).toList();
    return whLocations;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHLocationTable>> getAllWHLocation() async {
    List<WHLocationTable> query =
        await _database.select(_database.wHLocation).get();
    return query;
  }

  Future<List<WHAuditingTable>> getAllWHAuditing() async {
    List<WHAuditingTable> query =
        await _database.select(_database.wHAuditing).get();
    return query;
  }

  Future<List<WHInOutWardsTable>> getAllInOutWards() async {
    List<WHInOutWardsTable> query =
        await _database.select(_database.wHInOutWards).get();
    return query;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHInOutWardsTable>> getWHInOutWard(
      String auditId, String locationId) async {
    List<WHInOutWardsTable> query =
        await _database.select(_database.wHInOutWards).get();
    List<WHInOutWardsTable> whLocations = query.where((tbl) {
      return (tbl.auditDetailId == auditId) &&
          (tbl.whLocationId == locationId) &&
          (tbl.methodName != METHOD_STATUS.DELETE.name);
    }).toList();
    return whLocations;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHAuditingTable>> getWHAuditing(
      String auditId, String locationId) async {
    List<WHAuditingTable> query =
        await _database.select(_database.wHAuditing).get();
    List<WHAuditingTable> whLocations = query.where((tbl) {
      return (tbl.auditDetailId == auditId) &&
          (tbl.whLocationId == locationId) &&
          (tbl.methodName != METHOD_STATUS.DELETE.name);
    }).toList();
    return whLocations;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHInOutWardsTable>> getWHInOutWardByLocationId(
      String locationId) async {
    List<WHInOutWardsTable> query =
        await _database.select(_database.wHInOutWards).get();
    List<WHInOutWardsTable> whLocations = query.where((tbl) {
      return (tbl.whLocationId == locationId);
    }).toList();
    return whLocations;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHAuditingTable>> getWHAuditingByLocationId(
      String locationId) async {
    List<WHAuditingTable> query =
        await _database.select(_database.wHAuditing).get();
    List<WHAuditingTable> whLocations = query.where((tbl) {
      return (tbl.whLocationId == locationId);
    }).toList();
    return whLocations;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> insertWHInOutWard(
      {required int qty,
      required String stockType,
      required String description,
      required String invoNo,
      required String invoType,
      required String invoDate,
      required String customerName,
      required String whLocationId,
      required String auditDetailId,
      required String productName,
      required bool isLocationUpdated,
      required String productId,
      String? productImage,
      bool? isProductImageUpdated}) async {
    final query = _database.into(_database.wHInOutWards).insert(
        WHInOutWardsTable(
            inOutWardId: Utils.getNewGuId(),
            serverInOutWardId: "",
            updatedDateAndTime: DateTime.now(),
            qty: qty,
            stockType: stockType,
            description: description,
            invoNo: invoNo,
            invoType: invoType,
            invoDate: invoDate,
            customerName: customerName,
            whLocationId: whLocationId,
            productId: productId,
            productName: productName,
            apiStatus: DB_API_STATUS.TODO.name,
            methodName: METHOD_STATUS.CREATE.name,
            auditDetailId: auditDetailId,
            isLocationUpdated: isLocationUpdated,
            productImage: productImage ?? "",
            isProductImageUpdated: isProductImageUpdated ?? false));
    return await query;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> updateWHInOutWard(
      {required int qty,
      required String stockType,
      required String description,
      required String invoNo,
      required String invoType,
      required String invoDate,
      required String customerName,
      required String whLocationId,
      required String auditDetailId,
      required String productName,
      required String productId,
      required String inOutWardId,
      String? productImage,
      bool? isProductImageUpdated}) async {
    late WHInOutWardsCompanion entity;
    if (isProductImageUpdated == true) {
      entity = WHInOutWardsCompanion(
          qty: Value(qty),
          stockType: Value(stockType),
          description: Value(description),
          invoNo: Value(invoNo),
          invoType: Value(invoType),
          apiStatus: Value(DB_API_STATUS.TODO.name),
          customerName: Value(customerName),
          productName: Value(productName),
          productId: Value(productId),
          productImage: Value(productImage),
          isProductImageUpdated: Value(isProductImageUpdated ?? false));
    } else {
      entity = WHInOutWardsCompanion(
          qty: Value(qty),
          stockType: Value(stockType),
          description: Value(description),
          invoNo: Value(invoNo),
          invoType: Value(invoType),
          apiStatus: Value(DB_API_STATUS.TODO.name),
          customerName: Value(customerName),
          productName: Value(productName),
          productId: Value(productId),
          isProductImageUpdated: Value(isProductImageUpdated ?? false));
    }

    final query = _database.update(_database.wHInOutWards)
      ..where((tbl) => tbl.inOutWardId.equals(inOutWardId))
      ..write(entity);
    await query;
    return 1;
  }

  Future<int> updateWHInOutWardLocationId({
    required String whOldLocationId,
    required String whNewLocationId,
  }) async {
    WHInOutWardsCompanion entity = WHInOutWardsCompanion(
        whLocationId: Value(whNewLocationId),
        isLocationUpdated: const Value(true));
    final query = _database.update(_database.wHInOutWards)
      ..where((tbl) => tbl.whLocationId.equals(whOldLocationId))
      ..write(entity);
    await query;
    return 1;
  }

  Future<int> updateWHInOutWardApiStatus({
    required String inOutWardId,
    String? newInOutWardId,
    required DB_API_STATUS status,
  }) async {
    WHInOutWardsCompanion entity = ((newInOutWardId?.length ?? 0) > 0)
        ? WHInOutWardsCompanion(
            apiStatus: ((newInOutWardId?.length ?? 0) > 0)
                ? Value(DB_API_STATUS.NO_CHANGES.name)
                : Value(status.name),
            methodName: Value(METHOD_STATUS.UPDATE.name),
            serverInOutWardId: Value(newInOutWardId ?? ""))
        : WHInOutWardsCompanion(
            apiStatus: Value(status.name),
          );
    final query = _database.update(_database.wHInOutWards)
      ..where((tbl) => tbl.inOutWardId.equals(inOutWardId))
      ..write(entity);
    await query;
    return 1;
  }

  Future<int> updateWHAuditingApiStatus({
    required String auditingId,
    String? newAuditId,
    required DB_API_STATUS status,
  }) async {
    WHAuditingCompanion entity = ((newAuditId?.length ?? 0) > 0)
        ? WHAuditingCompanion(
            apiStatus: ((newAuditId?.length ?? 0) > 0)
                ? Value(DB_API_STATUS.NO_CHANGES.name)
                : Value(status.name),
            isProductImageUriUpdated: const Value(false),
            methodName: Value(METHOD_STATUS.UPDATE.name),
            serverAuditingId: Value(newAuditId ?? ""))
        : WHAuditingCompanion(
            apiStatus: Value(status.name),
          );
    final query = _database.update(_database.wHAuditing)
      ..where((tbl) => tbl.auditingId.equals(auditingId))
      ..write(entity);
    await query;
    return 1;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> insertWHAuditing(
      {required int qty,
      required int bestBefore,
      required String stockType,
      required String productQuality,
      required String productId,
      required String whLocationId,
      required String auditDetailId,
      required String description,
      required String mfDate,
      required String productName,
      required String productImageUri,
      required bool isProductImageUriUpdated,
      required bool isLocationUpdated}) async {
    final query = _database.into(_database.wHAuditing).insert(WHAuditingTable(
        updatedDateAndTime: DateTime.now(),
        auditingId: Utils.getNewGuId(),
        serverAuditingId: "",
        qty: qty,
        bestBefore: bestBefore,
        stockType: stockType,
        productQuality: productQuality,
        productId: productId,
        whLocationId: whLocationId,
        auditDetailId: auditDetailId,
        description: description,
        mfDate: mfDate,
        productName: productName,
        apiStatus: DB_API_STATUS.TODO.name,
        methodName: METHOD_STATUS.CREATE.name,
        productImageUri: productImageUri,
        isProductImageUriUpdated:isProductImageUriUpdated,
        isLocationUpdated: isLocationUpdated));
    return await query;
  }

  Future<int> updateWHAuditingLocationId({
    required String whOldLocationId,
    required String whNewLocationId,
  }) async {
    WHAuditingCompanion entity = WHAuditingCompanion(
        whLocationId: Value(whNewLocationId),
        isLocationUpdated: const Value(true));
    final query = _database.update(_database.wHAuditing)
      ..where((tbl) => tbl.whLocationId.equals(whOldLocationId))
      ..write(entity);
    await query;
    return 1;
  }

  /*
  * This method is used to insert the data in ApiDataTable by tag*/
  Future<int> updateWHAuditing(
      {required int qty,
      required int bestBefore,
      required String stockType,
      required String productQuality,
      required String productId,
      required String whLocationId,
      required String auditDetailId,
      required String description,
      required String mfDate,
      required String productName,
      required bool isProductImageUriUpdated,
      required String productImageUri,
      required String auditingId}) async {
    WHAuditingCompanion entity = WHAuditingCompanion(
        qty: Value(qty),
        bestBefore: Value(bestBefore),
        stockType: Value(stockType),
        productQuality: Value(productQuality),
        description: Value(description),
        productName: Value(productName),
        productId: Value(productId),
        apiStatus: Value(DB_API_STATUS.TODO.name),
        mfDate: Value(mfDate),
        isProductImageUriUpdated: Value(isProductImageUriUpdated),
        productImageUri: Value(productImageUri));
    final query = _database.update(_database.wHAuditing)
      ..where((tbl) => tbl.auditingId.equals(auditingId))
      ..write(entity);
    await query;
    return 1;
  }
}
