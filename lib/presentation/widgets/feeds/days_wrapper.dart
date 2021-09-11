import 'package:flutter/material.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/presentation/widgets/feeds/days_item.dart';

class DaysWrapper extends StatelessWidget {
  final List<Workouts> workouts;
  const DaysWrapper(this.workouts, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.separated(
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (_, index) => DaysItem(workouts[index]),
        itemCount: workouts.length,
      ),
    );
  }
}
