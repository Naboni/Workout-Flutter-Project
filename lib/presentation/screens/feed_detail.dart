import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/constants/data.dart';
import 'package:project/data/models/workoutPlan/workout_plan_response.dart';
import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import 'package:project/presentation/screens/trainer_profile_public.dart';
import 'package:project/presentation/widgets/feeds/days_wrapper.dart';

// widget
import '../widgets/feeds/feed_detail_header.dart';

class FeedDetail extends StatelessWidget {
  final WorkoutPlan workoutPlan;
  const FeedDetail(this.workoutPlan, {Key? key}) : super(key: key);
  static const routeName = '/feed-detail';
  @override
  Widget build(BuildContext context) {
    void _showSnackBar(String value) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(value)));
    }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          actions: [                Align(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: 0, vertical: 5),
              child: DottedBorder(
                color: Colors.blueAccent,
                strokeWidth: 3,
                padding: EdgeInsets.zero,
                borderType: BorderType.Circle,
                child: GestureDetector(
                  onTap: () {
                    print("HELLO ");
                    Navigator.of(context).pushNamed(TrainerProfilePublic.routeName, arguments: workoutPlan.creator!);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                          image: NetworkImage(
                              'http://192.168.137.1:3000/api/images/${workoutPlan.creator!.profileImage}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
              ),
            ),
            alignment: Alignment.topRight,
          )],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FeedDetailHeader(workoutPlan.imgUrl!, workoutPlan.title!,
                workoutPlan.description!, workoutPlan.creator!),
            Container(
              height: MediaQuery.of(context).size.height * .15,
              color: Colors.grey[200],
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 15),
                        ...workoutPlan.weekDays!
                            .map((e) => Container(
                                  margin: EdgeInsets.only(right: 5),
                                  width: 30,
                                  height: 30,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Center(
                                    child:
                                        Text('${stringDays[e].substring(0, 1)}'),
                                  ),
                                ))
                            .toList(),
                        Spacer(),
                        TextButton(
                            onPressed: () {
                              _showDetails(
                                  context, workoutPlan.id!, _showSnackBar, true);
                            },
                            child: Text("Add")),
                        TextButton(
                          onPressed: () {
                            _showDetails(
                                context, workoutPlan.id!, _showSnackBar, false);
                          },
                          child: Text(
                            "Remove",
                            style: TextStyle(color: Colors.red),
                          ),
                        )
                      ],
                    ),
                    Row(children: [
                      SizedBox(width: 15),
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
                    ]),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height * 0.49,
              child: DaysWrapper(workoutPlan.workouts!),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDetails(BuildContext context, String workoutPlan,
    Function _showSnackBar, bool isAdd) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      content: Container(
        child: BlocConsumer<WorkoutPlanBloc, WorkoutPlanState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is WorkoutPlanFavoringSucceded) {
              return _showSnackBar(state.mssg);
              // ! navigate to fav
            }
            if (state is WorkoutPlanFavoringFailed) {
              return _showSnackBar(state.mssg);
            }
          },
          builder: (context, state) {
            if (state is WorkoutPlanFavoring) {
              return Text('Loading please wait...');
            }
            return isAdd
                ? Text('Add this workout to favourites?')
                : Text('Remove this workout from favourites?');
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            isAdd
                ? BlocProvider.of<WorkoutPlanBloc>(context)
                    .add(FavorWorkoutPlan(workoutPlan))
                : BlocProvider.of<WorkoutPlanBloc>(context)
                    .add(UnfavorWorkoutPlan(workoutPlan));
            Navigator.of(context).pop();
          },
          child: Text(
            'YES',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'NO',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}
