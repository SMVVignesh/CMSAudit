import 'dart:convert';

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
    final encryptedData = await databaseHelper
        .getApiDataByTag(LocalDatabaseConstants.AUDIT_DATA);
    if (encryptedData != null) {
      return encryptedData.updatedDateAndTime;
    } else {
      return null;
    }
  }
}
