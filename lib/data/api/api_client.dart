import 'package:get/get.dart';
import 'package:learning_paginate/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
  late Map<String, String> _mainHeaders;
  late SharedPreferences sharedPreferences;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = sharedPreferences.getString(AppConstants.TOKEN) ?? "";
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    _mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    };
    //print("Token in api client: " + token);
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    print("uri now is: " + uri);
    //print("header is: " + _mainHeaders.toString());
    //print("token now is: " + token);
    try {
      Response response = await get(uri, headers: headers ?? _mainHeaders);
      // print("content form get method:" + response.toString());
      return response;
    } catch (e) {
      print("false: " + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    //print("body" + body.toString());
    try {
      Response response = await post(uri, body, headers: _mainHeaders);
      // print("ok:" + response.statusCode.toString());
      return response;
    } catch (e) {
      //  print("False" + e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
