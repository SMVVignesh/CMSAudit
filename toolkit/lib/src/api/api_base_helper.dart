import 'package:http/http.dart' as http;
import 'dart:convert';
import 'api_exception.dart';

class ApiBaseHelper {
  String baseUrl = "";
  bool? debug = false;

  Map<String, String>? headers = {
    'Content-type': 'application/json',
    'Accept': '*/*'
  };

  ApiBaseHelper({required this.baseUrl, this.debug, this.headers});

  updateHeaders(Map<String, String> header) {
    this.headers = header;
  }

  /*
  * This method is used for the get method with custom headers*/
  Future<dynamic> get(String url, [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    var responseJson;
    showLog("Api:Method===>  GET");
    showLog("Api:Headers===>  ${currentHeader.toString()}");
    showLog("Api:Url===>  $baseUrl$url");
    try {
      final startTime = DateTime.now();
      final response =
          await http.get(Uri.parse('$baseUrl$url'), headers: currentHeader);
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");
      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the post method with custom headers*/
  Future<dynamic> post(String url, Map<String, dynamic> body,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  POST");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  ${body.toString()}");
      final startTime = DateTime.now();
      final response = await http.post(Uri.parse('$baseUrl$url'),
          body: jsonEncode(body), headers: currentHeader);
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");
      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the post method with custom headers*/
  Future<dynamic> postEncoding(String url, String? body,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  POST");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  $body");
      final startTime = DateTime.now();
      final response = await http.post(Uri.parse('$baseUrl$url'),
          body: body,
          headers: currentHeader,
          encoding: Encoding.getByName('utf-8'));
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");

      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the put method with custom headers*/
  Future<dynamic> put(String url, Map<String, dynamic> body,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  PUT");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  ${body.toString()}");
      final startTime = DateTime.now();
      final response = await http.put(Uri.parse('$baseUrl$url'),
          body: jsonEncode(body), headers: currentHeader);
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");

      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the delete method with custom headers*/
  Future<dynamic> delete(String url, Map<String, dynamic> body,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  DELETE");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  ${body.toString()}");
      final startTime = DateTime.now();
      final response = await http.delete(Uri.parse('$baseUrl$url'),
          body: jsonEncode(body), headers: currentHeader);
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");

      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the post method with custom headers*/
  Future<dynamic> postFormUrlEncoded(String url, Map<String, dynamic> body,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  POST");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  ${body.toString()}");
      final startTime = DateTime.now();
      final response = await http.post(Uri.parse('$baseUrl$url'),
          body: body, headers: currentHeader);
      responseJson = returnResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");
      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }

  /*
  * This method is used for the post method with custom headers*/
  Future<dynamic> postMultipart(
      String url, Map<String, String> body, List<String> files,
      [Map<String, String>? customHeader]) async {
    Map<String, String>? currentHeader =
        (customHeader != null) ? customHeader : headers;
    try {
      var responseJson;
      showLog("Api:Method===>  POST");
      showLog("Api:Headers===>  $currentHeader");
      showLog("Api:Url===>  $baseUrl$url");
      showLog("Api:Body===>  ${body.toString()}");
      final startTime = DateTime.now();

      final request = await http.MultipartRequest('POST', Uri.parse(url));
      request.fields.addAll(body);
      for (String item in files) {
        request.files
            .add(await http.MultipartFile.fromPath('attachments', item));
      }
      if (currentHeader != null) {
        request.headers.addAll(currentHeader);
      }

      http.StreamedResponse response = await request.send();

      responseJson = returnStreamedResponse(response);
      showLog(
          "Api:Total Time Take ===>  $baseUrl$url ${getTimeDifference(startTime)} milliseconds");
      return responseJson;
    } catch (e) {
      showLog("Api: Exception===>  ${e.toString()}");
      rethrow;
    }
  }


  /*
  * This method is used to throw exception based on status code*/
  dynamic returnStreamedResponse(http.StreamedResponse response) async{
    String responseString = await response.stream.bytesToString();

    showLog("Api:StatusCode===> ${response.statusCode}");
    showLog("Api:Response===> ${responseString}");

    switch (response.statusCode) {
      case 200:
        return responseString;
      case 401:
          throw UnauthorisedException(responseString);
      case 400:
        throw BadRequestException(responseString);
      case 403:
        throw UnauthorisedException(responseString);
      case 408:
        throw TimeOutException(responseString);
      case 409:
        throw ConflictException(responseString);
      default:
        throw UnKnowException("Unknown Error");
    }
  }

/*
  * This method is used to throw exception based on status code*/
  dynamic returnResponse(http.Response response) {
    showLog("Api:StatusCode===> ${response.statusCode}");
    showLog("Api:Response===> ${json.decode(response.body.toString())}");
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 401:
        if (response.body.toString().contains("invalid_grant")) {
          throw UnauthorisedException(response.body.toString(), response);
        }
        throw UnauthorisedException(response.body.toString(), response);
      case 400:
        if (response.body.toString().contains("invalid_grant")) {
          throw UnauthorisedException(response.body.toString(), response);
        }
        throw BadRequestException(response.body.toString(), response);
      case 403:
        throw UnauthorisedException(response.body.toString(), response);
      case 408:
        throw TimeOutException(response.body.toString(), response);
      case 409:
        throw ConflictException(response.body.toString(), response);
      default:
        throw UnKnowException("Unknown Error", response);
    }
  }

  showLog(String message) {
    if (debug ?? false) {
      print(message);
    }
  }

  int getTimeDifference(DateTime startTime) {
    DateTime now = DateTime.now();
    return startTime.difference(now).inMilliseconds;
  }
}
