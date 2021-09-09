import 'package:flutter/material.dart';

// deps
import 'package:project/data/models/workout/workout.dart';

import '../tab_route.dart';
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
      case FeedDetail.routeName:
        return MaterialPageRoute(builder: (ctx) => FeedDetail());
      case TabRoute.routeName:
        return MaterialPageRoute(builder: (ctx) => TabRoute());
      case Settings.routeName:
        return MaterialPageRoute(builder: (ctx) => Settings());
      case ExerciseType.routeName:
        return MaterialPageRoute(builder: (ctx) {
          return ExerciseType(settings.arguments as Workout);
        });
      case Training.routeName:
        return MaterialPageRoute(
            builder: (ctx) => Training((settings.arguments as Workout)));
      case AddPlan.routeName:
        return MaterialPageRoute(builder: (ctx) => AddPlan());
      case SetGoal.routeName:
        return MaterialPageRoute(builder: (ctx) => SetGoal());
      default:
        return MaterialPageRoute(builder: (ctx) => ProfileRoute());
    }
  }
}
