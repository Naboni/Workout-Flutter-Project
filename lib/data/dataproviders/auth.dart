import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/data/models/user/roles.dart';
import 'package:project/data/models/user/user.dart';

class AuthDataProvider {
  static String baseUrl = "http://192.168.137.1:3000/api";
  static var loginUrl = '$baseUrl/users/login';
  final FlutterSecureStorage _storage = FlutterSecureStorage();
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

  static Future<Map<String, dynamic>> signUp({
    required String role,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String age,
    required String profileImagePath,
    required String gender,
    String? bio,
  }) async {
    print("Register [POST]");
    var registerURL = "";
    registerURL = role == Roles.Trainer
        ? '$baseUrl/users/register-trainer'
        : "$baseUrl/users/register-trainee";
    //TODO Profile image
    String? encoded_img;
    if (profileImagePath == "") {
      encoded_img = null;
    } else {
      final bytes = File(profileImagePath).readAsBytesSync();
      encoded_img = base64Encode(bytes);
    }
    var data = {
      "gender": gender,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "age": age,
      "bio": bio,
      "image_encoded": encoded_img,
    };
    try {
      var response = await Dio().post(registerURL, data: data);

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

  //[DELETE] //TRAINEE Unvafors a favored plan
  Future<Map<String, dynamic>> deleteUser() async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/users';
    print("[DELETE]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.delete(url);
      var responseBody = response.data;
      return {
        "body": jsonEncode(responseBody),
        "status": response.statusCode.toString(),
        "message": responseBody["message"]
      };
    } on DioError catch (e) {
      return {
        "status": e.response!.statusCode.toString(),
        "message": e.response!.data["message"]
      };
    } catch (e) {
      return {"status": "404", "message": "Wrong URL or sth"};
    }
  }
}
