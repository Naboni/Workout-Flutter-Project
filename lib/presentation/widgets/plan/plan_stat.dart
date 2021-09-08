import 'package:flutter/material.dart';

class PlanStat extends StatelessWidget {
  const PlanStat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text("2"),
              Text("Workout Plans"),
            ],
          ),
          Column(
            children: [
              Text("2"),
              Text("Workout Plans"),
            ],
          ),
          Column(
            children: [
              Text("2"),
              Text("Workout Plans"),
            ],
          ),
        ],
      ),
    );
  }
}
