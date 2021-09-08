import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/data/models/user/user.dart';

class AuthDataProvider {
  static String baseUrl = "http://192.168.137.1:3000/api";
  static var loginUrl = '$baseUrl/users/login';
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    print("POST $loginUrl");
    //! DOESNT CATCH SHIT!!!! DONT TRUST IT;
    try {
      var response = await Dio()
          .post(loginUrl, data: {'email': email, 'password': password});
      var responseBody = response.data;
      return {
        "body": json.encode(responseBody),
        "status": response.statusCode.toString(),
        "message": responseBody["message"]
      };
    } on DioError catch (e) {
      return {
        "status": e.response!.statusCode,
        "message": e.response!.data["message"]
      };
    } catch (e) {
      return {"status": "69", "message": "Wrong URL or sth"};
    }
  }
}
