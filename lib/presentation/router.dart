import 'package:flutter/material.dart';

import './screens/_routes.dart';
// model
import 'package:project/data/models/exercise/exercise.dart';

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
      case ExerciseType.routeName:
        return MaterialPageRoute(
            builder: (ctx) =>
                ExerciseType(settings.arguments as List<Exercise>));
      case Training.routeName:
        return MaterialPageRoute(builder: (ctx) => Training());
      case MyPlan.routeName:
        return MaterialPageRoute(builder: (ctx) => MyPlan());
      default:
        return MaterialPageRoute(builder: (ctx) => ProfileRoute());
    }
  }
}
