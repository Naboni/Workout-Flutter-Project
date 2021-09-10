// models
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/data/models/user/user.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

class WorkoutPlanDataProvider {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static String baseUrl = "http://192.168.137.1:3000/api";

  //[POST] //Add a workout plan
  Future<bool> addWorkoutPlan(WorkoutPlan workoutPlan) async {
    String? user = await _storage.read(key: "user");
    if (user == null) {
      print("Secure storage is empty");
      return false;
    }
    String? token = User.fromJson(user).token;
    // ! added ? to token
    return true;
    // send post req to backend
  }

  Future<void> deleteWorkoutPlan(String workoutPlan) async {
    // send delete req to backend
  }

  Future<WorkoutPlansResponse> getWorkoutPlans() async {
    return WorkoutPlansResponse.fromJson("json");
  }
}
