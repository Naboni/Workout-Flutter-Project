import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/repositories/workout_repository.dart';

// widgets
import '../../widgets/plan/step_one/add_step_one.dart';
import '../../widgets/plan/step_two/add_step_two.dart';

class AddPlan extends StatefulWidget {
  static const routeName = "addPlan";

  @override
  _AddPlanState createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  int _selectedIndex = 0;
  Map<dynamic, dynamic> _stepVals = {};

  _getPages(int index) {
    switch (index) {
      case 0:
        return {'title': "ADD BASIC INFO", 'page': StepOne(_setSelectedIndex)};
      case 1:
        return {
          'title': "ADD EXERCISES",
          'page': RepositoryProvider(
            create: (context) => WorkoutRepository(),
            child: StepTwo(_stepVals),
          )
        };
    }
  }

  _setSelectedIndex(int newIndex, Map<dynamic, dynamic> newMap) {
    setState(() {
      _stepVals = {..._stepVals, ...newMap};
      _selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(_getPages(_selectedIndex)['title']),
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _getPages(_selectedIndex)['page'] as Widget,
      ),
    );
  }
}
