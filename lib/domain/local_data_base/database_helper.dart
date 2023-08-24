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
  Future<int> deleteWHLocation(
      {required String locationName,
      required String palletNumber,
      required String auditDetailId}) async {
    final query = _database.delete(_database.wHLocation)
      ..where((tbl) => tbl.locationName.equals(locationName))
      ..where((tbl) => tbl.palletNumber.equals(palletNumber))
      ..where((tbl) => tbl.auditDetailId.equals(auditDetailId));
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
}
