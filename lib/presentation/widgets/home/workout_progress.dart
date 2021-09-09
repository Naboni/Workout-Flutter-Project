import 'package:flutter/material.dart';

class WorkoutProgress extends StatelessWidget {
  final int done;
  final int all;
  const WorkoutProgress(this.done, this.all, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final divident = (done / all).toDouble();
    return LayoutBuilder(
      builder: (_, constraints) {
        return Container(
          height: 32,
          child: Column(
            children: [
              Row(
                children: [
                  Text("${all - done} Exercises left",
                      style: TextStyle(color: Colors.white)),
                  Spacer(),
                  Text('${(divident * 100).toStringAsFixed(0)} %',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: constraints.maxWidth,
                  height: 6,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: 6,
                        width: double.infinity,
                        color: Colors.grey.withOpacity(.4),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: divident,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
