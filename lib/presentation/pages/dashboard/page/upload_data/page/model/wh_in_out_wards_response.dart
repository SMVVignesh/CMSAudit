import 'error_model.dart';

class WHInOutWardsResponse {
  String? inOutWardsId;
  dynamic response;
  ErrorModel? errorModel;

  WHInOutWardsResponse({
    this.inOutWardsId,
  });

  WHInOutWardsResponse.fromJson(this.response) {
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
