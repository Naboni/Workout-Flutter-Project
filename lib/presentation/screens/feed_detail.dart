import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/presentation/widgets/feeds/days_wrapper.dart';

// widget
import '../widgets/feeds/feed_detail_header.dart';

class FeedDetail extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  const FeedDetail(this.workoutPlan, {Key? key}) : super(key: key);
  static const routeName = '/feed-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedDetailHeader(workoutPlan.imgUrl!, workoutPlan.title!,
              workoutPlan.description!),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height * 0.65,
            child: DaysWrapper(workoutPlan.workouts!),
          ),
        ],
      ),
    );
  }
}
