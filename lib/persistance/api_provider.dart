
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:task/model/model.dart';
import 'exceptions.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Client client = Client();
  BuildContext context;

  final baseUrl = 'https://rickandmortyapi.com/api/';

  final baseHeader = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };
  
  String getQuery(Map<String, dynamic> params) {
    var result = "?";
    params.forEach((key, value) {
      result += '&$key=$value';
    });
    return result;
  }

  String getUrl(String baseUrl, String path, Map<String, dynamic> params) {
    return '$baseUrl$path${getQuery(params)}';
  }

  
  Future<Model> getAllData(Map<String, dynamic> params) async {
    var responseJson;
    try {
      final response = await client.get(
          getUrl(baseUrl, 'character', params),
          headers: baseHeader);

      print(response.request.headers.toString());
      print(response.body);

      var res = _response(response);
      responseJson = Model.fromJson(res);
    } on FetchDataException {
      throw FetchDataException("No Internet connection");
    }
    return responseJson;
  }


  void initContext(BuildContext context){
    this.context = context;
  }

  dynamic _response(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw BadRequestException(response.body.toString());
        break;
      case 401:
        print("401 error");
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 403:
        Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw UnauthorisedException(response.body.toString());
        break;
      case 500:

      default:
      Navigator.of(context).pushReplacementNamed('/NotFoundPage');
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
      break;
    }
  }
}
