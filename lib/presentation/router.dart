import 'package:flutter/material.dart';

// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/workout/workout.dart';
// repo
import '../data/repositories/workout_repository.dart';
// model
import 'package:project/data/models/exercise/exercise.dart';
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
