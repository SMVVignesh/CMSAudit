import 'error_model.dart';

class CreateLocationModel {
  String? locationId;
  dynamic response;
  ErrorModel? errorModel;

  CreateLocationModel({
    this.locationId,
  });

  CreateLocationModel.fromJson(this.response) {
    Map<String, dynamic>;
    if (response is String) {
      locationId = response;
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
