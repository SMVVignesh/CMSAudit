import 'dart:convert';

import 'package:cms_audit/presentation/pages/dashboard/page/audit_details/model/audit_response.dart';
import 'package:tool_kit/tool_kit.dart';

import '../../config/Environment.dart';
import '../../core/constants/api_end_points.dart';
import '../../data/login/new_login_response.dart';
import '../../presentation/pages/dashboard/page/products/model/product_response.dart';
import '../../presentation/pages/login/model/login_response.dart';
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
}
