import 'package:project/data/models/exercise/exercise.dart';
import 'package:project/data/models/user/user.dart';

/// plans : [{"date_created":"2021-09-09T14:09:43.807Z","targetMuscles":[{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}],"weekDays":[1,3,5],"workouts":[{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}],"_id":"613a15d680b1be31dcce1d4e","title":"Input text","age":"Input text","imgUrl":"abcd","description":"Input text","difficulty":-1,"creator":{"verified":false,"date_created":"2021-09-09T14:03:52.687Z","age":null,"rating":0,"_id":"613a144851f5573a08e9226c","first_name":"Maruf","last_name":"pls","email":"m"},"__v":0},{"date_created":"2021-09-09T14:09:43.807Z","targetMuscles":[{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}],"weekDays":[1,3,5],"workouts":[{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}],"_id":"613b0b7050065245bc7a207d","title":"Input text","age":"Input text","imgUrl":"abcd","description":"Input text","difficulty":-1,"creator":{"verified":false,"date_created":"2021-09-09T14:03:52.687Z","age":null,"rating":0,"_id":"613a144851f5573a08e9226c","first_name":"Maruf","last_name":"pls","email":"m"},"__v":0},{"date_created":"2021-09-09T14:09:43.807Z","targetMuscles":[{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}],"weekDays":[1,3,5],"workouts":[{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}],"_id":"613b0b9250065245bc7a2081","title":"Input text","age":"Input text","imgUrl":"abcd","description":"Input text","difficulty":-1,"creator":{"verified":false,"date_created":"2021-09-09T14:03:52.687Z","age":null,"rating":0,"_id":"613a144851f5573a08e9226c","first_name":"Maruf","last_name":"pls","email":"m"},"__v":0}]

class WorkoutPlansResponse {
  List<WorkoutPlan>? plans;

  WorkoutPlansResponse({this.plans});

  WorkoutPlansResponse.fromJson(dynamic json) {
    if (json['plans'] != null) {
      plans = [];
      json['plans'].forEach((v) {
        plans?.add(WorkoutPlan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (plans != null) {
      map['plans'] = plans?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// date_created : "2021-09-09T14:09:43.807Z"
/// targetMuscles : [{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}]
/// weekDays : [1,3,5]
/// workouts : [{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}]
/// _id : "613a15d680b1be31dcce1d4e"
/// title : "Input text"
/// age : "Input text"
/// imgUrl : "abcd"
/// description : "Input text"
/// difficulty : -1
/// creator : {"verified":false,"date_created":"2021-09-09T14:03:52.687Z","age":null,"rating":0,"_id":"613a144851f5573a08e9226c","first_name":"Maruf","last_name":"pls","email":"m"}
/// __v : 0

class WorkoutPlan {
  String? dateCreated; // !
  List<TargetMuscles>? targetMuscles; //
  List<int>? weekDays; //
  List<Workouts>? workouts; //
  String? id; // !
  String? title; //
  String? age; //
  String? imgUrl; // !
  String? description; //
  int? difficulty; //
  User? creator; // !

  WorkoutPlan({
    this.dateCreated,
    this.targetMuscles,
    this.weekDays,
    this.workouts,
    this.id,
    this.title,
    this.age,
    this.imgUrl,
    this.description,
    this.difficulty,
    this.creator,
  });

  WorkoutPlan.fromJson(dynamic json) {
    dateCreated = json['date_created'];
    if (json['targetMuscles'] != null) {
      targetMuscles = [];
      json['targetMuscles'].forEach((v) {
        targetMuscles?.add(TargetMuscles.fromJson(v));
      });
    }
    weekDays = json['weekDays'] != null ? json['weekDays'].cast<int>() : [];
    if (json['workouts'] != null) {
      workouts = [];
      json['workouts'].forEach((v) {
        workouts?.add(Workouts.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    age = json['age'];
    imgUrl = json['imgUrl'];
    description = json['description'];
    difficulty = json['difficulty'];
    creator = json['creator'] != null ? User.fromJson(json['creator']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['date_created'] = dateCreated;
    if (targetMuscles != null) {
      map['targetMuscles'] = targetMuscles?.map((v) => v.toJson()).toList();
    }
    map['weekDays'] = weekDays;
    if (workouts != null) {
      map['workouts'] = workouts?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['title'] = title;
    map['age'] = age;
    map['imgUrl'] = imgUrl;
    map['description'] = description;
    map['difficulty'] = difficulty;
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    return map;
  }
}

/// day : 1
/// exercises : [{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]

class Workouts {
  int? day;
  List<Exercise>? exercises;

  Workouts({this.day, this.exercises});

  Workouts.fromJson(dynamic json) {
    day = json['day'];
    if (json['exercises'] != null) {
      exercises = [];
      json['exercises'].forEach((v) {
        exercises?.add(Exercise.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['day'] = day;
    if (exercises != null) {
      map['exercises'] = exercises?.map((v) => v.toMap()).toList();
    }
    return map;
  }
}

/// name : "Warmup"
/// value : true

class TargetMuscles {
  String? name;
  bool? value;

  TargetMuscles({this.name, this.value});

  TargetMuscles.fromJson(dynamic json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['name'] = name;
    map['value'] = value;
    return map;
  }
}
