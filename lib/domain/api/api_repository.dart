import 'package:cms_audit/core/utils/utils.dart';
import 'package:intl/intl.dart';

import 'package:cms_audit/domain/local_data_base/database.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../config/Environment.dart';
import '../../core/constants/api_end_points.dart';
import '../../presentation/pages/dashboard/page/products/model/product_response.dart';
import '../../presentation/pages/dashboard/page/upload_data/page/model/create_location_model.dart';
import '../../presentation/pages/dashboard/page/upload_data/page/model/wh_auditing_response.dart';
import '../../presentation/pages/dashboard/page/upload_data/page/model/wh_in_out_wards_response.dart';
import '../../presentation/pages/login/model/login_response.dart';
import '../local_data_base/method_status.dart';
import '../share_preference/shared_preference_repository.dart';

class ApiRepository {
  factory ApiRepository() {
    return _singleton;
  }

  ApiRepository._internal();

  /*
  * This is used to create the singleton class*/
  static final ApiRepository _singleton = ApiRepository._internal();

  ApiBaseHelper loginInApis = ApiBaseHelper(
      baseUrl: Environment().config?.loginHost ?? "", debug: true);

  ApiBaseHelper otherInApis =
      ApiBaseHelper(baseUrl: Environment().config?.apiHost ?? "", debug: true);

  /*
* This method is used to get the headers with access token */
  Future<Map<String, String>> getHeaderWithAuth() async {
    String? accessKeyFuture =
        await SharedPreferenceRepository().getAccessToken();
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer $accessKeyFuture",
    };
  }

  /*This method is used to get all Products*/
  Future<ProductResponse> getProducts() async {
    late ProductResponse productResponse;
    final response =
        await otherInApis.get(ApiEndPoints.PRODUCTS, await getHeaderWithAuth());
    productResponse = ProductResponse.fromJson(response);
    return productResponse;
  }

  /*This method is used to call the generate New token end point*/
  Future<LoginResponse> loginApi(
      String userName, String password, String tenant) async {
    Map<String, String> headers = {
      'accept': 'application/json',
      'Content-type': 'application/json',
      'Charset': 'utf-8',
      'tenant': tenant
    };
    Map<String, String> body = {'email': userName, 'password': password};

    late LoginResponse tokenGenerationResponseModel;
    final response = await loginInApis.post(ApiEndPoints.LOGIN, body, headers);
    tokenGenerationResponseModel = LoginResponse.fromJson(response);
    return tokenGenerationResponseModel;
  }

  /*This method is used to get Audit List*/
  Future<AuditResponse> getAuditList() async {
    Map<String, dynamic> body = {"isActive": false};

    late AuditResponse auditResponse;
    final response = await otherInApis.post(
        ApiEndPoints.AUDIT_SEARCH, body, await getHeaderWithAuth());
    auditResponse = AuditResponse.fromJson(response);
    return auditResponse;
  }

  /*This method is used to call the generate New token end point*/
  Future<CreateLocationModel> createWHLocation(
      {required WHLocationTable whLocationTable}) async {
    Map<String, dynamic> body = {
      "locationName": whLocationTable.locationName,
      "palletNumber": whLocationTable.palletNumber,
      "description": whLocationTable.description,
      "isActive": whLocationTable.isActive,
      "auditDetailId": whLocationTable.auditDetailId
    };
    late CreateLocationModel tokenGenerationResponseModel;
    final response = await otherInApis.post(
        ApiEndPoints.WH_LOCATIONS, body, await getHeaderWithAuth());
    tokenGenerationResponseModel = CreateLocationModel.fromJson(response);
    return tokenGenerationResponseModel;
  }

  /*This method is used to upload whInOutWars to server*/
  Future<WHInOutWardsResponse> createInOutWards(
      {required WHInOutWardsTable whInOutWardsTable}) async {
    // 2023-08-30T16:19:49.995Z
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String logEntryDateTime = "";
    try {
      logEntryDateTime = formatter.format(whInOutWardsTable.updatedDateAndTime);
    } catch (e) {
      print("Exception Time Stamp: ${e.toString()}");
    }

    Map<String, dynamic> body = {
      "qty": whInOutWardsTable.qty,
      "stockType": whInOutWardsTable.stockType,
      "description": whInOutWardsTable.description,
      "invoNo": whInOutWardsTable.invoNo,
      "invoType": whInOutWardsTable.invoType,
      "invoDate": whInOutWardsTable.invoDate,
      "logEntryDateTime": logEntryDateTime,
      "customerName": whInOutWardsTable.customerName,
      "whLocationId": whInOutWardsTable.whLocationId,
      "productId": whInOutWardsTable.productId
    };
    late WHInOutWardsResponse tokenGenerationResponseModel;
    dynamic response;
    if (whInOutWardsTable.methodName == METHOD_STATUS.UPDATE.name) {
      body["id"] = whInOutWardsTable.serverInOutWardId;
      response = await otherInApis.put(
          "${ApiEndPoints.WH_IN_OUT_WARDS}/${whInOutWardsTable.serverInOutWardId}",
          body,
          await getHeaderWithAuth());
    } else if (whInOutWardsTable.methodName == METHOD_STATUS.DELETE.name) {
      body.clear();
      body["id"] = whInOutWardsTable.serverInOutWardId;
      response = await otherInApis.delete(
          "${ApiEndPoints.WH_IN_OUT_WARDS}/${whInOutWardsTable.serverInOutWardId}",
          body,
          await getHeaderWithAuth());
    } else {
      response = await otherInApis.post(
          ApiEndPoints.WH_IN_OUT_WARDS, body, await getHeaderWithAuth());
    }
    tokenGenerationResponseModel = WHInOutWardsResponse.fromJson(response);
    return tokenGenerationResponseModel;
  }

  /*This method is used to upload whAuditing to server*/
  Future<WHAuditingResponse> createOrUpdateWhAuditing(
      {required WHAuditingTable wHAuditingTable}) async {
    // 2023-08-30T16:19:49.995Z
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    String logEntryDateTime = "";
    try {
      logEntryDateTime = formatter.format(wHAuditingTable.updatedDateAndTime);
    } catch (e) {
      print("Exception Time Stamp: ${e.toString()}");
    }

    Map<String, dynamic> body = {
      "qty": wHAuditingTable.qty,
      "stockType": wHAuditingTable.stockType,
      "description": wHAuditingTable.description,
      "mfDate": wHAuditingTable.mfDate,
      "productQuality": wHAuditingTable.productQuality,
      "productId": wHAuditingTable.productId,
      "logEntryDateTime": logEntryDateTime,
      "whLocationId": wHAuditingTable.whLocationId,
    };

    if (wHAuditingTable.isProductImageUriUpdated) {
      if (wHAuditingTable.productImageUri.length == 0) {
        body["aProductImage"] = null;
      } else {
        body["aProductImage"] = Utils.getProductImageJson(wHAuditingTable.productImageUri);
      }
    }

    late WHAuditingResponse tokenGenerationResponseModel;
    dynamic response;
    if (wHAuditingTable.methodName == METHOD_STATUS.UPDATE.name) {
      body["id"] = wHAuditingTable.serverAuditingId;
      response = await otherInApis.put(
          "${ApiEndPoints.WH_AUDITING}/${wHAuditingTable.serverAuditingId}",
          body,
          await getHeaderWithAuth());
    } else if (wHAuditingTable.methodName == METHOD_STATUS.DELETE.name) {
      body.clear();
      body["id"] = wHAuditingTable.serverAuditingId;
      response = await otherInApis.delete(
          "${ApiEndPoints.WH_AUDITING}/${wHAuditingTable.serverAuditingId}",
          body,
          await getHeaderWithAuth());
    } else {
      response = await otherInApis.post(
          ApiEndPoints.WH_AUDITING, body, await getHeaderWithAuth());
    }
    tokenGenerationResponseModel = WHAuditingResponse.fromJson(response);
    return tokenGenerationResponseModel;
  }
}
