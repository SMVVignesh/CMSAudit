import 'dart:convert';

import 'package:cms_audit/core/utils/db_api_status.dart';
import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/domain/local_data_base/method_status.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/products/model/product_response.dart';

import '../../core/constants/local_data_base_constants.dart';
import 'database_helper.dart';

class DatabaseRepository {
  DatabaseHelper databaseHelper = DatabaseHelper();

  factory DatabaseRepository() {
    return _singleton;
  }

  DatabaseRepository._internal();

  /*
  * This is used to create the singleton class*/
  static final DatabaseRepository _singleton = DatabaseRepository._internal();

  //
  // Future<int> addWHLocation(WHLocationTable wHLocationTable) async {
  //   return await databaseHelper.insertApiDataTag(
  //       LocalDatabaseConstants.PRODUCT_DATA, data);
  // }
  //
  // Future<ProductResponse?> getProductData() async {
  //   try {
  //     final encryptedData = await databaseHelper
  //         .getApiDataByTag(LocalDatabaseConstants.PRODUCT_DATA);
  //     if (encryptedData != null) {
  //       final data = json.decode(encryptedData.data);
  //       return ProductResponse.fromJson(data);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print("data base Conversion exception :${e.toString()}");
  //     return null;
  //   }
  // }

  Future<int> saveProductData(ProductResponse response) async {
    final data = json.encode(response);
    return await databaseHelper.insertApiDataTag(
        LocalDatabaseConstants.PRODUCT_DATA, data);
  }

  Future<ProductResponse?> getProductData() async {
    try {
      final encryptedData = await databaseHelper
          .getApiDataByTag(LocalDatabaseConstants.PRODUCT_DATA);
      if (encryptedData != null) {
        final data = json.decode(encryptedData.data);
        return ProductResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print("data base Conversion exception :${e.toString()}");
      return null;
    }
  }

  Future<DateTime?> getProductUpdatedDate() async {
    final encryptedData = await databaseHelper
        .getApiDataByTag(LocalDatabaseConstants.PRODUCT_DATA);
    if (encryptedData != null) {
      return encryptedData.updatedDateAndTime;
    } else {
      return null;
    }
  }

  Future<int> saveAuditData(AuditResponse response) async {
    final data = json.encode(response);
    return await databaseHelper.insertApiDataTag(
        LocalDatabaseConstants.AUDIT_DATA, data);
  }

  Future<AuditResponse?> getAuditData() async {
    try {
      final encryptedData = await databaseHelper
          .getApiDataByTag(LocalDatabaseConstants.AUDIT_DATA);
      if (encryptedData != null) {
        final data = json.decode(encryptedData.data);
        return AuditResponse.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      print("data base Conversion exception :${e.toString()}");
      return null;
    }
  }

  Future<DateTime?> getAuditUpdatedDate() async {
    final encryptedData =
        await databaseHelper.getApiDataByTag(LocalDatabaseConstants.AUDIT_DATA);
    if (encryptedData != null) {
      return encryptedData.updatedDateAndTime;
    } else {
      return null;
    }
  }

  Future<int> deleteWHLocation({required String guid}) async {
    final encryptedData = await databaseHelper.deleteWHLocation(guid: guid);
    return encryptedData;
  }

  Future<int> deleteWHInOutWard(
      {required WHInOutWardsTable wHInOutWardsTable}) async {
    int? encryptedData;
    if (wHInOutWardsTable.methodName == METHOD_STATUS.UPDATE.name) {
      encryptedData = await databaseHelper.updateDeleteWHInOutWards(
          guid: wHInOutWardsTable.inOutWardId);
    } else {
      encryptedData = await databaseHelper.deleteWHInOutWard(
          guid: wHInOutWardsTable.inOutWardId);
    }
    return encryptedData;
  }

  Future<int> deleteWHAuditing({required WHAuditingTable auditingTable}) async {
    int? encryptedData;
    if (auditingTable.methodName == METHOD_STATUS.UPDATE.name) {
      encryptedData = await databaseHelper.updateDeleteWHAuditing(
          guid: auditingTable.auditingId);
    } else {
      encryptedData =
          await databaseHelper.deleteWHAuditing(guid: auditingTable.auditingId);
    }
    return encryptedData ?? 0;
  }

  Future<List<WHLocationTable>> getWHLocationByAuditId(String auditId) async {
    final encryptedData = await databaseHelper.getWHLocationByAuditId(auditId);
    return encryptedData;
  }

  Future<int> insertWHLocation(
      {required String locationName,
      required String palletNumber,
      required String description,
      required String auditDetailId,
      required bool isActive}) async {
    final encryptedData = await databaseHelper.insertWHLocation(
        locationName: locationName,
        palletNumber: palletNumber,
        description: description,
        isActive: isActive,
        auditDetailId: auditDetailId);
    return encryptedData;
  }

  Future<int> updateWHLocation(
      {required String locationName,
      required String palletNumber,
      required String description,
      required String auditDetailId,
      required String locationId,
      required bool isActive}) async {
    final encryptedData = await databaseHelper.updateWHLocation(
        locationName: locationName,
        palletNumber: palletNumber,
        description: description,
        isActive: isActive,
        auditDetailId: auditDetailId,
        locationId: locationId);
    return encryptedData;
  }

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
    final encryptedData = await databaseHelper.insertWHInOutWard(
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
        isLocationUpdated: isLocationUpdated,
        auditDetailId: auditDetailId,
        productImage: productImage,
        isProductImageUpdated: isProductImageUpdated);
    return encryptedData;
  }

  Future<int> updateWHLocationId({
    required String oldLocationId,
    required String newLocationId,
  }) async {
    final encryptedData = await databaseHelper.updateWHLocationId(
        oldLocationId: oldLocationId, newLocationId: newLocationId);
    return encryptedData;
  }

  Future<int> updateWHAuditingApiStatus({
    required String auditingId,
    String? newAuditId,
    required DB_API_STATUS status,
  }) async {
    final encryptedData = await databaseHelper.updateWHAuditingApiStatus(
        auditingId: auditingId, status: status, newAuditId: newAuditId);
    return encryptedData;
  }

  Future<int> updateWHInOutWardApiStatus({
    required String inOutWardId,
    String? newInOutWardId,
    required DB_API_STATUS status,
  }) async {
    final encryptedData = await databaseHelper.updateWHInOutWardApiStatus(
        inOutWardId: inOutWardId,
        status: status,
        newInOutWardId: newInOutWardId);
    return encryptedData;
  }

  // Future<int> updateWHInOutWardLocationId({
  //   required String whOldLocationId,
  //   required String whNewLocationId,
  // }) async {
  //   final encryptedData = await databaseHelper.updateWHInOutWardLocationId(
  //       whOldLocationId: whOldLocationId, whNewLocationId: whNewLocationId);
  //   return encryptedData;
  // }
  //
  //
  // Future<int> updateWHAuditingLocationId({
  //   required String whOldLocationId,
  //   required String whNewLocationId,
  // }) async {
  //   final encryptedData = await databaseHelper.updateWHAuditingLocationId(
  //       whOldLocationId: whOldLocationId, whNewLocationId: whNewLocationId);
  //   return encryptedData;
  // }

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
    final encryptedData = await databaseHelper.updateWHInOutWard(
        qty: qty,
        stockType: stockType,
        description: description,
        invoNo: invoNo,
        invoType: invoType,
        invoDate: invoDate,
        customerName: customerName,
        whLocationId: whLocationId,
        auditDetailId: auditDetailId,
        productName: productName,
        productId: productId,
        inOutWardId: inOutWardId);
    return encryptedData;
  }

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
    final encryptedData = await databaseHelper.insertWHAuditing(
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
        isProductImageUriUpdated: isProductImageUriUpdated,
        productImageUri: productImageUri,
        isLocationUpdated: isLocationUpdated);
    return encryptedData;
  }

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
      required String productImageUri,
      required bool isProductImageUriUpdated,
      required String auditingId}) async {
    final encryptedData = await databaseHelper.updateWHAuditing(
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
        isProductImageUriUpdated: isProductImageUriUpdated,
        productImageUri: productImageUri,
        auditingId: auditingId);
    return encryptedData;
  }

  Future<List<WHInOutWardsTable>> getWHInOutWardByAuditId(
      String auditId, String locationId) async {
    final encryptedData =
        await databaseHelper.getWHInOutWard(auditId, locationId);
    return encryptedData;
  }

  Future<List<WHAuditingTable>> getWHAuditingByAuditId(
      String auditId, String locationId) async {
    final encryptedData =
        await databaseHelper.getWHAuditing(auditId, locationId);
    return encryptedData;
  }

  Future<List<WHInOutWardsTable>> getWHInOutWardByLocationId(
      String locationId) async {
    final encryptedData =
        await databaseHelper.getWHInOutWardByLocationId(locationId);
    return encryptedData;
  }

  /*
  * This method will return only one record by tag in ApiDataTable*/
  Future<List<WHAuditingTable>> getWHAuditingByLocationId(
      String locationId) async {
    final encryptedData =
        await databaseHelper.getWHAuditingByLocationId(locationId);
    return encryptedData;
  }

  Future<List<WHLocationTable>> getAllWHLocation() async {
    final encryptedData = await databaseHelper.getAllWHLocation();
    return encryptedData;
  }

  Future<List<WHAuditingTable>> getAllWHAuditing() async {
    final encryptedData = await databaseHelper.getAllWHAuditing();
    return encryptedData;
  }

  Future<List<WHInOutWardsTable>> getAllInOutWards() async {
    final encryptedData = await databaseHelper.getAllInOutWards();
    return encryptedData;
  }
}
