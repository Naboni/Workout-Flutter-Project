import 'package:project/data/models/exercise/exercise.dart';

/// date_created : "2021-09-09T14:09:43.807Z"
/// targetMuscles : [{"name":"Warmup","value":true},{"name":"Abs","value":true},{"name":"Legs","value":true}]
/// weekDays : [1,3,5]
/// workouts : [{"day":1,"exercises":[{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]},{"day":3,"exercises":[{"id":1,"name":"SEATED ABS CIRCLE","duration":20,"lottieUrl":"assets/anim/workouts/abs/seated-abs-circles.json","category":"abs","description":" erwtwqeerth","difficulty":"medium"},{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]}]
/// title : "Input text"
/// age : "Input text"
/// imgUrl : "abcd"
/// description : "Input text"
/// difficulty : -1

class Plan {
  String? dateCreated;
  List<TargetMuscle>? targetMuscles;
  List<int>? weekDays;
  List<Workout>? workouts;
  String? title;
  String? age;
  String? imgUrl;
  String? description;
  int? difficulty;

  Plan(
      {this.dateCreated,
      this.targetMuscles,
      this.weekDays,
      this.workouts,
      this.title,
      this.age,
      this.imgUrl,
      this.description,
      this.difficulty});

  Plan.fromJson(dynamic json) {
    dateCreated = json['date_created'];
    if (json['targetMuscles'] != null) {
      targetMuscles = [];
      json['targetMuscles'].forEach((v) {
        targetMuscles?.add(TargetMuscle.fromJson(v));
      });
    }
    weekDays = json['weekDays'] != null ? json['weekDays'].cast<int>() : [];
    if (json['workouts'] != null) {
      workouts = [];
      json['workouts'].forEach((v) {
        workouts?.add(Workout.fromJson(v));
      });
    }
    title = json['title'];
    age = json['age'];
    imgUrl = json['imgUrl'];
    description = json['description'];
    difficulty = json['difficulty'];
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
    map['title'] = title;
    map['age'] = age;
    map['imgUrl'] = imgUrl;
    map['description'] = description;
    map['difficulty'] = difficulty;
    return map;
  }
}

/// day : 1
/// exercises : [{"id":0,"name":"PLANK EXERCISE","duration":20,"lottieUrl":"assets/anim/workouts/abs/plank-excercise.json","category":"abs","description":"The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time.","difficulty":"hard"}]

class Workout {
  int? day;
  List<Exercise>? exercises;

  Workout({this.day, this.exercises});

  Workout.fromJson(dynamic json) {
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

class TargetMuscle {
  String? name;
  bool? value;

  TargetMuscle({this.name, this.value});

  TargetMuscle.fromJson(dynamic json) {
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


// /// verified : false
// /// date_created : "2021-09-09T14:03:52.687Z"
// /// age : null
// /// rating : 0
// /// _id : "613a144851f5573a08e9226c"
// /// first_name : "Maruf"
// /// last_name : "pls"
// /// email : "m"

// class Creator {
//   bool? verified;
//   String? dateCreated;
//   dynamic? age;
//   int? rating;
//   String? id;
//   String? firstName;
//   String? lastName;
//   String? email;

//   Creator(
//       {this.verified,
//       this.dateCreated,
//       this.age,
//       this.rating,
//       this.id,
//       this.firstName,
//       this.lastName,
//       this.email});

//   Creator.fromJson(dynamic json) {
//     verified = json['verified'];
//     dateCreated = json['date_created'];
//     age = json['age'];
//     rating = json['rating'];
//     id = json['_id'];
//     firstName = json['first_name'];
//     lastName = json['last_name'];
//     email = json['email'];
//   }

//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['verified'] = verified;
//     map['date_created'] = dateCreated;
//     map['age'] = age;
//     map['rating'] = rating;
//     map['_id'] = id;
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     map['email'] = email;
//     return map;
//   }
// }


//!
// /// id : 0
// /// name : "PLANK EXERCISE"
// /// duration : 20
// /// lottieUrl : "assets/anim/workouts/abs/plank-excercise.json"
// /// category : "abs"
// /// description : "The plank is an isometric core strength exercise that involves maintaining a position similar to a push-up for the maximum possible time."
// /// difficulty : "hard"

// class Exercises {
//   int? id;
//   String? name;
//   int? duration;
//   String? lottieUrl;
//   String? category;
//   String? description;
//   String? difficulty;

//   Exercises(
//       {this.id,
//       this.name,
//       this.duration,
//       this.lottieUrl,
//       this.category,
//       this.description,
//       this.difficulty});

//   Exercises.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     duration = json['duration'];
//     lottieUrl = json['lottieUrl'];
//     category = json['category'];
//     description = json['description'];
//     difficulty = json['difficulty'];
//   }

//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['duration'] = duration;
//     map['lottieUrl'] = lottieUrl;
//     map['category'] = category;
//     map['description'] = description;
//     map['difficulty'] = difficulty;
//     return map;
//   }
// }
//!