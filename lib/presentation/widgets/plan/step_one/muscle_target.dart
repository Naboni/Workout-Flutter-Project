import 'package:flutter/material.dart';

class MuscleTarget extends StatefulWidget {
  List<Map<String, dynamic>> targetMuscles;
  Function changeTargetMuscles;
  MuscleTarget(this.targetMuscles, this.changeTargetMuscles, {Key? key})
      : super(key: key);

  @override
  _MuscleTarget createState() => _MuscleTarget();
}

class _MuscleTarget extends State<MuscleTarget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < widget.targetMuscles.length; i++)
          Padding(
            padding: EdgeInsets.all(4),
            child: FilterChip(
              selectedColor: Colors.blue,
              labelStyle: TextStyle(
                  color: widget.targetMuscles[i]["value"] as bool
                      ? Colors.white
                      : Colors.black),
              checkmarkColor: Colors.white,
              selected: widget.targetMuscles[i]["value"] as bool,
              label: Text(widget.targetMuscles[i]["name"] as String),
              onSelected: (value) {
                widget.changeTargetMuscles(i, value);
              },
            ),
          )
      ],
    );
  }
}
