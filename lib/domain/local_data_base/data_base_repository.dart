import 'dart:convert';

import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/products/model/product_response.dart';

import '../../core/constants/local_data_base_constants.dart';
import '../share_preference/shared_preference_repository.dart';
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
    final encryptedData = await databaseHelper.deleteWHLocation(
        guid: guid);
    return encryptedData;
  }

  Future<int> deleteWHInOutWard({required String guid}) async {
    final encryptedData = await databaseHelper.deleteWHInOutWard(
        guid: guid);
    return encryptedData;
  }

  Future<int> deleteWHAuditing({required String guid}) async {
    final encryptedData = await databaseHelper.deleteWHAuditing(
        guid: guid);
    return encryptedData;
  }

  Future<List<WHLocationTable>> getWHLocationByAuditId(String auditId) async {
    final encryptedData = await databaseHelper.getWHLocationByAuditId(auditId);
    return encryptedData;
  }

  Future<int> insertWHLocation({required String locationName,
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

  Future<int> insertWHInOutWard({required int qty,
    required String stockType,
    required String description,
    required String invoNo,
    required String invoType,
    required String invoDate,
    required String customerName,
    required String whLocationId,
    required String auditDetailId,
    required String productName,
    required String productId}) async {
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
        productName:productName,
        auditDetailId: auditDetailId);
    return encryptedData;
  }


  Future<int> insertWHAuditing({required int qty,
    required int bestBefore,
    required String stockType,
    required String productQuality,
    required String productId,
    required String whLocationId,
    required String auditDetailId,
    required String description,
    required String mfDate,
    required String productName,
    required String file}) async {
    final encryptedData = await databaseHelper.insertWHAuditing(qty: qty,
        bestBefore: bestBefore,
        stockType: stockType,
        productQuality: productQuality,
        productId: productId,
        whLocationId: whLocationId,
        auditDetailId: auditDetailId,
        description: description,
        mfDate: mfDate,
        productName: productName,
        file: file);
    return encryptedData;
  }


  Future<List<WHInOutWardsTable>> getWHInOutWardByAuditId(String auditId,
      String locationId) async {
    final encryptedData = await databaseHelper.getWHInOutWard(
        auditId, locationId);
    return encryptedData;
  }

  Future<List<WHAuditingTable>> getWHAuditingByAuditId(String auditId,
      String locationId) async {
    final encryptedData = await databaseHelper.getWHAuditing(
        auditId, locationId);
    return encryptedData;
  }
}
