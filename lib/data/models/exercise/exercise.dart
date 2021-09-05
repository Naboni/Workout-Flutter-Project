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

  Exercise();

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        duration = json['duration'],
        lottieUrl = json['lottieUrl'];

  @override
  String toString() {
    return 'Exercise(id: $id, name: $name, duration: $duration, lottieUrl: $lottieUrl)';
  }
}
