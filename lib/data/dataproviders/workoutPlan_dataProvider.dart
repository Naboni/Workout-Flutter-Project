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
        "status": e.response!.statusCode,
        "message": e.response!.data["message"]
      };
    } catch (e) {
      return {"status": "404", "message": "Wrong URL or sth"};
    }
    // send post req to backend
  }

  Future<Map<String, dynamic>> getWorkoutPlans() async {
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
      var response = await dio.get(url);
      var responseBody = response.data;
      return {
        "body": jsonEncode(responseBody),
        "status": response.statusCode.toString(),
        "message": responseBody["message"]
      };
    } on DioError catch (e) {
      return {
        "status": e.response!.statusCode,
        "message": e.response!.data["message"]
      };
    } catch (e) {
      return {"status": "404", "message": "Wrong URL or sth"};
    }
  }

  Future<void> deleteWorkoutPlan(String workoutPlan) async {
    // send delete req to backend
  }
}
