import 'dart:ffi';

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
    final query = _database.into(_database.wHLocation).insert(WHLocationTable(
        updatedDateAndTime: DateTime.now(),
        locationName: locationName,
        palletNumber: palletNumber,
        description: description,
        auditDetailId: auditDetailId,
        isActive: isActive,
        guId: Utils.getNewGuId()));
    return await query;
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHLocation({required String guid}) async {
    final query = _database.delete(_database.wHLocation)
      ..where((tbl) => tbl.guId.equals(guid));
    return await query.go();
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHInOutWard({required String guid}) async {
    final query = _database.delete(_database.wHInOutWards)
      ..where((tbl) => tbl.guId.equals(guid));
    return await query.go();
  }

  /*
  * This method is used to delete WHLocations*/
  Future<int> deleteWHAuditing({required String guid}) async {
    final query = _database.delete(_database.wHAuditing)
      ..where((tbl) => tbl.guId.equals(guid));
    return await query.go();
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
  Future<List<WHInOutWardsTable>> getWHInOutWard(
      String auditId, String locationId) async {
    List<WHInOutWardsTable> query =
        await _database.select(_database.wHInOutWards).get();
    List<WHInOutWardsTable> whLocations = query.where((tbl) {
      return (tbl.auditDetailId == auditId) && (tbl.whLocationId == locationId);
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
      return (tbl.auditDetailId == auditId) && (tbl.whLocationId == locationId);
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
      required String productId}) async {
    final query = _database.into(_database.wHInOutWards).insert(
        WHInOutWardsTable(
            guId: Utils.getNewGuId(),
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
            auditDetailId: auditDetailId));
    return await query;
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
      required String file}) async {
    final query = _database.into(_database.wHAuditing).insert(WHAuditingTable(
        updatedDateAndTime: DateTime.now(),
        guId: Utils.getNewGuId(),
        qty: qty,
        bestBefore: bestBefore,
        stockType: stockType,
        productQuality: productQuality,
        productId: productId,
        whLocationId: whLocationId,
        auditDetailId: auditDetailId,
        description: description,
        mfDate: mfDate,
        file: file));
    return await query;
  }
}
