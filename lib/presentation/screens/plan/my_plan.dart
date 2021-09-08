import 'package:flutter/material.dart';

// widgets
import '../../widgets/plan/plan_stat.dart';

class MyPlan extends StatefulWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/myplan";

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  // global key to identify the form and for validation
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PlanStat(),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, index) => Text("data"),
              itemCount: 10,
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {
              print("object");
              Navigator.of(context).pushNamed('addPlan');
            },
            label: Row(
              children: [Icon(Icons.add), Text('ADD NEW PLAN')],
            ),
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}
