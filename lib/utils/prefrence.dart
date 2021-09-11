// deps
import 'package:shared_preferences/shared_preferences.dart';

import '../data/dataproviders/workout_dataProvider.dart';

class Pref {
  static Future<bool> checkIfPopulated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('populated') ?? false;
  }

  // ? populate db and change populated key to true
  static Future<void> setPopulated() async {
    WorkoutDataProvider wdp = WorkoutDataProvider();
    await wdp.saveWorkouts();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('populated', true);
  }

  static setTimer(int timer) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('timer', timer);
  }
}
