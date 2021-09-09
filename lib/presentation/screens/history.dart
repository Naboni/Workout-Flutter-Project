import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/bloc/report/report_bloc.dart';

import 'navigation_drawer.dart';

class History extends StatelessWidget {
  static const routeName = 'history';
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state is ReportInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Repor) {
          final reps = state.report;
          return Scaffold(
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              title: Text('HISTORY'),
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: PreferredSize(
                  child: Container(
                    color: Colors.grey,
                    height: 0.3,
                  ),
                  preferredSize: Size.fromHeight(1.0)),
            ),
            body: ListView.builder(
              itemBuilder: (_, index) {
                return Report(
                  context,
                  reps[index].dateCreated,
                  reps[index].execiseName,
                  reps[index].duration.toString(),
                  reps[index].duration.toString(),
                );
              },
              itemCount: reps.length,
            ),
          );
        }
        return Container();
      },
    );
  }

  Container Report(BuildContext context, String date, String name,
      String duration, String point) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 100,
            // width: MediaQuery.of(context).size.height * 0.15,
            child: Image(
              image: AssetImage('assets/images/ic_upper_body.png'),
            ),
          ),
          SizedBox(width: 20),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                Text(name),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 14,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      duration,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.score,
                      size: 14,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '$point Points',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
