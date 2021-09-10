import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/bloc/report/report_bloc.dart';

class Stat extends StatefulWidget {
  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<ReportBloc>().add(GetReport());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return BlocBuilder<ReportBloc, ReportState>(
      builder: (context, state) {
        if (state is ReportInitial) {
          return Container(
            height: 100,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is Repor) {
          final r = state.report;
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                padding: EdgeInsets.all(10),
                width: mq.width * .95,
                height: mq.height * .15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${r.length}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 7),
                          Text(
                            "WORKOUTS",
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${Duration(seconds: r.length * 20).inMinutes}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("MINUTES"),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${r.length * 20}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700],
                            ),
                          ),
                          SizedBox(height: 7),
                          Text("POINTS"),
                        ],
                      ),
                    ],
                  ),
                )),
          );
        }
        return Container();
      },
    );
  }
}
