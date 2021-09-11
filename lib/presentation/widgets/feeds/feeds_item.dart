import 'package:flutter/material.dart';
import 'package:project/constants/data.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/presentation/screens/feed_detail.dart';

class FeedsItem extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  const FeedsItem(this.workoutPlan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 0,
                  offset: Offset(1, 1))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                FeedDetail.routeName,
                arguments: workoutPlan,
              );
            },
            child: Row(
              children: [
                Container(
                  width: size.width * 0.3,
                  height: size.height * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      image: AssetImage(workoutPlan.imgUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.52,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20 / 2, top: 20 / 1.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              workoutPlan.title!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.check_circle,
                                    color: workoutPlan.creator!.verified!
                                        ? Colors.green
                                        : Colors.grey),
                                Text('${workoutPlan.creator!.firstName!}'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 9),
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            workoutPlan.difficulty! == -1
                                ? "All"
                                : difficulty[workoutPlan.difficulty! - 1],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text('Age: ${workoutPlan.age}'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
