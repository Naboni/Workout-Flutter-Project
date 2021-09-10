import 'package:project/data/models/user/user.dart';

import 'workout_plan.dart';

/// plan : {"date_created":"2021-09-09T14:09:43.807Z","targetMuscles":[{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}],"weekDays":[1,3,5],"workouts":[{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}],"title":"Input text","age":"Input text","imgUrl":"abcd","description":"Input text","difficulty":-1}
/// _id : "613a15d680b1be31dcce1d4e"
/// creator : {"verified":false,"date_created":"2021-09-09T14:03:52.687Z","age":null,"rating":0,"_id":"613a144851f5573a08e9226c","first_name":"Maruf","last_name":"pls","email":"m"}

class WorkoutResponse {
  Plan? plan;
  String? id;
  User? creator;

  WorkoutResponse({this.plan, this.id, this.creator});

  WorkoutResponse.fromJson(dynamic json) {
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
    id = json['_id'];
    creator = json['creator'] != null ? User.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (plan != null) {
      map['plan'] = plan?.toJson();
    }
    map['_id'] = id;
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    return map;
  }
}
