import 'package:flutter/material.dart';

// deps
import 'package:lottie/lottie.dart';
import 'package:project/data/models/exercise/exercise.dart';

// constants
import '../../../../../constants/data.dart';

class ExerciseSelector extends StatelessWidget {
  final int day;
  final List<Exercise> exercises;
  final Function fillDay;
  ExerciseSelector(this.day, this.exercises, this.fillDay, {Key? key})
      : super(key: key);

  List<dynamic> _selectedExercises = [];
  _handleSelection(Exercise selectedExercise, bool isClickForSelect) {
    if (isClickForSelect) {
      _selectedExercises.add(selectedExercise.toMap());
    } else {
      _selectedExercises = _selectedExercises.where((exercise) {
        return exercise["name"] != selectedExercise.toMap()["name"];
      }).toList();
    }

    print(_selectedExercises);
    fillDay(day, _selectedExercises);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 5),
        Text(
          " " + stringDays[day],
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        Container(
          height: 100,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Item(exercises[index], _handleSelection),
            itemCount: exercises.length,
          ),
        ),
      ],
    );
  }
}

class Item extends StatefulWidget {
  final Exercise exercise;
  final Function selectionHandler;
  const Item(this.exercise, this.selectionHandler, {Key? key})
      : super(key: key);

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    final Exercise ex = widget.exercise;
    return Stack(
      children: [
        Card(
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = !isSelected;
              });
              widget.selectionHandler(ex, isSelected);
            },
            child: Container(child: Lottie.asset(ex.lottieUrl)),
          ),
        ),
        if (isSelected)
          Positioned(
            left: 10,
            top: 10,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 20,
            ),
          ),
      ],
    );
  }
}
