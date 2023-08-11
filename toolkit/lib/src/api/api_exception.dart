import 'package:http/http.dart' as http;

class ApiException implements Exception {
  final message;
  final prefix;
  final http.Response? response;

  ApiException([this.message, this.prefix,this.response]);

  String toString() {
    return "$prefix $message";
  }

  String getErrorMessage() {
    try{
      return "Failed Load Data with status code ${response?.statusCode}";
    }catch(e){
      return "";
    }
  }
}

class TimeOutException extends ApiException {
  TimeOutException([String? message,http.Response? response ])
      : super(message, "Error During Communication: ",response);
}

class NoInternetException extends ApiException {
  NoInternetException([String? message,http.Response? response ]) : super(message, "No Internet",response);
}

class BadRequestException extends ApiException {
  BadRequestException([String? message,http.Response? response ]) : super(message, "Invalid Request: ",response);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message,http.Response? response ]) : super(message, "Unauthorised: ",response);
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message,http.Response? response ]) : super(message, "Invalid Input: ",response);
}

class ConflictException extends ApiException {
  ConflictException([String? message,http.Response? response ]) : super(message, "Conflict: ",response);
}

class UnKnowException extends ApiException {
  UnKnowException([ String? message,http.Response? response ])
      : super(message, "Error During Communication: ",response);
}

class APIFails extends ApiException {
  APIFails([String? message,http.Response? response ]) : super(message, "Error During Communication: ",response);
}
