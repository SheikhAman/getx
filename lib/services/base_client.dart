import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:getx/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int time_out_duration = 20;
//GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    // internet connection + url exception caught korte try catch e get method ta diye dilam
    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet  connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responding in  time', uri.toString());
    }
  }

//POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    // response send korar age payloadObj re json encode kore pathalam
    var payload = json.encode(payloadObj);
    // internet connection + url exception caught korte try catch e get method ta diye dilam
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet  connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responding in  time', uri.toString());
    }
  }

  // Put
  Future<dynamic> put(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    // response send korar age payloadObj re json encode kore pathalam
    var payload = json.encode(payloadObj);
    // internet connection + url exception caught korte try catch e get method ta diye dilam
    try {
      var response = await http
          .put(uri, body: payload)
          .timeout(Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet  connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responding in  time', uri.toString());
    }
  }

//DELETE
  Future<dynamic> delete(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
    // response send korar age payloadObj re json encode kore pathalam

    try {
      var response =
          await http.delete(uri).timeout(Duration(seconds: time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet  connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responding in  time', uri.toString());
    }
  }
//OTHER

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200: // for get , put and post
        // i am reading the response from bodyBytes this will help you when you are working with other languages than english
        // response  8bit e niye utf8 e decode kortesi
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        // for post method // and  put method
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 204:
        // for successful delete
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
