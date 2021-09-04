import 'package:flutter/material.dart';
import 'package:project/presentation/screens/exercise_type.dart';
import 'package:project/presentation/screens/my_plan.dart';
import 'package:project/presentation/screens/training.dart';
import './screens/_routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Feeds.routeName:
        return MaterialPageRoute(builder: (ctx) => Feeds());
      case ProfileRoute.routeName:
        return MaterialPageRoute(builder: (ctx) => ProfileRoute());
      case ReminderScreen.routeName:
        return MaterialPageRoute(builder: (ctx) => ReminderScreen());
      case ExerciseType.routeName:
        return MaterialPageRoute(builder: (ctx) => ExerciseType());
      case Training.routeName:
        return MaterialPageRoute(builder: (ctx) => Training());
      case MyPlan.routeName:
        return MaterialPageRoute(builder: (ctx) => MyPlan());
      default:
        return MaterialPageRoute(builder: (ctx) => ProfileRoute());
    }
  }
}
