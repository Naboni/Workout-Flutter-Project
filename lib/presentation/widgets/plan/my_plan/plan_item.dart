import 'package:flutter/material.dart';
import 'package:project/constants/data.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/presentation/screens/feed_detail.dart';

class MyPlanItem extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  const MyPlanItem(this.workoutPlan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(FeedDetail.routeName, arguments: workoutPlan);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    workoutPlan.title!,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      workoutPlan.difficulty! == -1
                          ? "All"
                          : difficulty[workoutPlan.difficulty!],
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              Text('Age: ${workoutPlan.age}'),
              Row(
                children: [
                  Text('Target muscles:  '),
                  if (workoutPlan.targetMuscles!.isEmpty)
                    Text("All")
                  else
                    ...workoutPlan.targetMuscles!
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 3, horizontal: 9),
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                                color: Colors.blue[300],
                                borderRadius: BorderRadius.circular(20)),
                            child: Row(
                              children: [
                                Text(
                                  e.name!,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                ],
              ),
              Row(
                children: [
                  ...workoutPlan.weekDays!
                      .map((e) => Container(
                            margin: EdgeInsets.only(right: 5),
                            width: 25,
                            height: 25,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(100)),
                            child: Center(
                              child: Text('${stringDays[e].substring(0, 1)}'),
                            ),
                          ))
                      .toList(),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                    child: Row(
                      children: [
                        Icon(Icons.check_circle,
                            color: workoutPlan.creator!.verified!
                                ? Colors.green
                                : Colors.grey),
                        Text('${workoutPlan.creator!.firstName!}'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
