import 'package:flutter/material.dart';

class WorkoutDificulty extends StatefulWidget {
  const WorkoutDificulty({Key? key}) : super(key: key);

  @override
  _WorkoutDificulty createState() => _WorkoutDificulty();
}

class _WorkoutDificulty extends State<WorkoutDificulty> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    final _chips = [
      ChoiceChip(
        label: Text("Easy"),
        selected: _index == 1,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _index == 1 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            _index = value ? 1 : -1;
          });
        },
      ),
      ChoiceChip(
        label: Text("Medium"),
        selected: _index == 2,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _index == 2 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            _index = value ? 2 : -1;
          });
        },
      ),
      ChoiceChip(
        label: Text("Hard"),
        selected: _index == 3,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _index == 3 ? Colors.white : Colors.black),
        onSelected: (value) {
          setState(() {
            _index = value ? 3 : -1;
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
