// models
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/data/models/user/user.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

class WorkoutPlanDataProvider {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static String baseUrl = "http://192.168.137.1:3000/api";

  //[POST] //Add a workout plan
  Future<Map<String, dynamic>> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/plans/';
    print("[POST]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.post(url, data: workoutPlan.toJson());
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

  //[GET] //GET personalized workout plans
  Future<Map<String, dynamic>> getWorkoutPlans() async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/plans/';
    print("[GET]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.get(url);
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

  //[GET] //Search workout plans
  Future<Map<String, dynamic>> searchWorkoutPlans(
      {required String title}) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/plans/?title=$title';
    print("[GET]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.get(url);
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

  //[GET] //GET a workout plan
  Future<Map<String, dynamic>> getWorkoutPlan({required String id}) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/plans/$id';
    print("[GET]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.get(url);
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

  //[DELETE] //GET personalized workout plans
  Future<bool> deleteWorkoutPlan(String planId) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/plans/$planId';
    print("[DELETE]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.delete(url);
      return true;
    } on DioError catch (e) {
      print(e);
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  //[GET] //GET plans the TRAINER Created
  Future<Map<String, dynamic>> getWorkoutPlansByTrainer() async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/users/plans-created';
    print("[GET]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.get(url);
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

  //! DEALING WITH TRAINEE PLANS FROM HERE ON

  //[POST] //TRAINEE FAVORS A PLAN
  Future<Map<String, dynamic>> favorPlan({required String planId}) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/user-plans/$planId';
    print("[POST]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.post(url);
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

  //[DELETE] //TRAINEE Unvafors a favored plan
  Future<Map<String, dynamic>> unfavorPlan({required String planId}) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/user-plans/$planId';
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

  //[GET] //GET plans favored by trainee
  Future<Map<String, dynamic>> getFavoredPlans() async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      throw ("Secure storage is empty");
    }
    String token = User.fromJson(user).token!;
    String url = '$baseUrl/user-plans/';
    print("[GET]@$url");
    try {
      var dio = Dio();
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = token;
      var response = await dio.get(url);
      var responseBody = response.data;
      return {
        "body": jsonEncode(responseBody),
        "status": response.statusCode.toString(),
      };
    } on DioError catch (e) {
      return {
        "status": e.response!.statusCode.toString(),
      };
    } catch (e) {
      print(e);
      return {"status": "404", "message": "Wrong URL or sth"};
    }
  }
}
