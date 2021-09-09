import 'dart:convert';

import 'package:hive/hive.dart';

part 'exercise.g.dart';

// extending from HiveObject lets us use .save() / .delete()
@HiveType(typeId: 3)
class Exercise {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String duration;
  @HiveField(3)
  late String lottieUrl;
  @HiveField(4)
  late String category;
  @HiveField(5)
  late String description;
  @HiveField(6)
  late String difficulty;
  @HiveField(7)
  late bool isDone;

  Exercise();

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        duration = json['duration'],
        lottieUrl = json['lottieUrl'],
        category = json['category'],
        description = json['description'],
        difficulty = json['difficulty'],
        isDone = json['isDone'];

  toMap() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'lottieUrl': lottieUrl,
      'category': category,
      'description': description,
      'difficulty': difficulty,
      'isDone': isDone
    };
  }

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, duration: $duration, lottieUrl: $lottieUrl, category: $category, description: $description, difficulty: $difficulty, isDone: $isDone,)';
  }
}
