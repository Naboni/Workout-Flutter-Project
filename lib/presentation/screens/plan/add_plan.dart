import 'package:flutter/material.dart';

// deps
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

// model
import '../../../data/models/workoutPlan/workoutPlan.dart';

// widgets
import '../../widgets/plan/step_one/add_step_one.dart';
import '../../widgets/plan/add_step_two.dart';

class AddPlan extends StatefulWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "addPlan";

  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  List<Object>? _pages;
  int _selectedIndex = 0;

  WorkoutPlan _workoutPlan = WorkoutPlan();

  _setSelectedIndex(int newIndex, WorkoutPlan wp) {
    setState(() {
      _selectedIndex = newIndex;
    });
    _workoutPlan
      ..title = wp.title
      ..description = wp.description
      ..exercise = wp.exercise;
    print(_workoutPlan.title);
    print(_workoutPlan.description);
    print(_workoutPlan.exercise[0].name);
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      StepOne(_setSelectedIndex),
      StepTwo(_setSelectedIndex, _workoutPlan)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // title: Text("Add plan"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _pages![_selectedIndex] as Widget,
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String labelText;
  final String validatorMessage;

  FormField({
    required this.icon,
    required this.hintText,
    required this.labelText,
    required this.validatorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText,
        labelText: labelText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }
}
