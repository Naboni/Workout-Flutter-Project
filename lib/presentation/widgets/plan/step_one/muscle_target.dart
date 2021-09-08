import 'package:flutter/material.dart';

class MuscleTarget extends StatefulWidget {
  const MuscleTarget({Key? key}) : super(key: key);

  @override
  _MuscleTarget createState() => _MuscleTarget();
}

class _MuscleTarget extends State<MuscleTarget> {
  bool _arm = false;
  bool _leg = false;
  bool _abs = false;
  @override
  Widget build(BuildContext context) {
    final _chips = [
      FilterChip(
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _abs ? Colors.white : Colors.black),
        checkmarkColor: Colors.white,
        selected: _abs,
        label: Text("Abs"),
        onSelected: (value) {
          print(value);
          setState(() {
            _abs = value;
          });
        },
      ),
      FilterChip(
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _arm ? Colors.white : Colors.black),
        checkmarkColor: Colors.white,
        selected: _arm,
        label: Text("Arm"),
        onSelected: (value) {
          setState(() {
            _arm = value;
          });
        },
      ),
      FilterChip(
        selectedColor: Colors.blue,
        labelStyle: TextStyle(color: _leg ? Colors.white : Colors.black),
        checkmarkColor: Colors.white,
        selected: _leg,
        label: Text("Leg"),
        onSelected: (value) {
          setState(() {
            _leg = value;
          });
        },
      ),
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
