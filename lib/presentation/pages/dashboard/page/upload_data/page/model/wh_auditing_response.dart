import 'error_model.dart';

class WHAuditingResponse {
  String? inOutWardsId;
  dynamic response;
  ErrorModel? errorModel;

  WHAuditingResponse({
    this.inOutWardsId,
  });

  WHAuditingResponse.fromJson(this.response) {
    Map<String, dynamic>;
    if (response is String) {
      inOutWardsId = response;
    } else {
      errorModel = ErrorModel.fromJson(response);
    }
  }

  dynamic toJson() {
    if (response is String) {
      return response;
    } else {
      return errorModel?.toJson();
    }
  }
}
