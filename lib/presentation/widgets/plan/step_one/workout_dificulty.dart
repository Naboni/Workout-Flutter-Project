import 'package:flutter/material.dart';

class WorkoutDificulty extends StatefulWidget {
  int index;
  Function changeDifficultyLevel;
  WorkoutDificulty(this.index, this.changeDifficultyLevel, {Key? key})
      : super(key: key);

  @override
  _WorkoutDificulty createState() => _WorkoutDificulty();
}

class _WorkoutDificulty extends State<WorkoutDificulty> {
  @override
  Widget build(BuildContext context) {
    final _chips = [
      ChoiceChip(
        label: Text("Easy"),
        selected: widget.index == 1,
        selectedColor: Colors.blue,
        labelStyle:
            TextStyle(color: widget.index == 1 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            value
                ? widget.changeDifficultyLevel(1)
                : widget.changeDifficultyLevel(-1);
          });
        },
      ),
      ChoiceChip(
        label: Text("Medium"),
        selected: widget.index == 2,
        selectedColor: Colors.blue,
        labelStyle:
            TextStyle(color: widget.index == 2 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            value
                ? widget.changeDifficultyLevel(2)
                : widget.changeDifficultyLevel(-1);
          });
        },
      ),
      ChoiceChip(
        label: Text("Hard"),
        selected: widget.index == 3,
        selectedColor: Colors.blue,
        labelStyle:
            TextStyle(color: widget.index == 3 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            value
                ? widget.changeDifficultyLevel(3)
                : widget.changeDifficultyLevel(-1);
          });
        },
      )
    ];
    return Wrap(
      children: [
        for (final chip in _chips)
          Padding(
            padding: EdgeInsets.all(4),
            child: chip,
          )
      ],
    );
  }
}
