import 'package:flutter/material.dart';
import 'package:project/data/models/exercise/exercise.dart';

// models
import 'package:project/data/models/workout/workout.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';

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
        return MaterialPageRoute(
            builder: (ctx) => FeedDetail(settings.arguments as WorkoutPlan));
      case TabRoute.routeName:
        return MaterialPageRoute(builder: (ctx) => TabRoute());
      case Settings.routeName:
        return MaterialPageRoute(builder: (ctx) => Settings());
      case History.routeName:
        return MaterialPageRoute(builder: (ctx) => History());
      case ExerciseWrapper.routeName:
        return MaterialPageRoute(
            builder: (ctx) =>
                ExerciseWrapper(settings.arguments as List<Exercise>));
      case ExerciseType.routeName:
        return MaterialPageRoute(builder: (ctx) {
          return ExerciseType(settings.arguments as Workout);
        });
      case Training.routeName:
        return MaterialPageRoute(
            builder: (ctx) => Training((settings.arguments as Workout)));
      case AddPlan.routeName:
        return MaterialPageRoute(builder: (ctx) => AddPlan());
      case Favorites.routeName:
        return MaterialPageRoute(builder: (ctx) => Favorites());
      default:
        return MaterialPageRoute(builder: (ctx) => ProfileRoute());
    }
  }
}
