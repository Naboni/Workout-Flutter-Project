import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:project/logic/bloc/workout_plan/workout_plan_bloc.dart';
import '../widgets/feeds/feeds_item.dart';

class Feeds extends StatefulWidget {
  static const routeName = "/feeds";

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<WorkoutPlanBloc>()..add(GetWorkoutPlan());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutPlanBloc, WorkoutPlanState>(
      builder: (context, state) {
        if (state is WorkoutPlanInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is WorkoutPlanFailed) {
          return Text("Sorry loading failed");
        }
        if (state is WorkoutPlanLoaded) {
          final workoutplans = state.workoutResponse;
          return Container();
        }
        return Container();
      },
    );

    //  SingleChildScrollView(
    //   child: Padding(
    //     padding: EdgeInsets.symmetric(
    //         horizontal: MediaQuery.of(context).size.width * .01),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20),
    //           child: Material(
    //             elevation: 5.0,
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(30.0),
    //             child: TextField(
    //               decoration: InputDecoration(
    //                 border: OutlineInputBorder(borderSide: BorderSide.none),
    //                 contentPadding: EdgeInsets.symmetric(
    //                     vertical: 20 * 0.75, horizontal: 20),
    //                 fillColor: Colors.white,
    //                 hintText: 'Search',
    //                 suffixIcon: Icon(
    //                   Icons.search,
    //                   size: 25.0,
    //                   color: Colors.black.withOpacity(0.4),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //         SizedBox(
    //           height: 20,
    //         ),
    //         SingleChildScrollView(
    //           physics: BouncingScrollPhysics(),
    //           child: Container(
    //             height: MediaQuery.of(context).size.height * 0.75,
    //             child: ListView.builder(
    //               itemBuilder: (context, index) {
    //                 return FeedsItem(
    //                   title: items[index].title,
    //                   image: items[index].image,
    //                 );
    //               },
    //               itemCount: items.length,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
