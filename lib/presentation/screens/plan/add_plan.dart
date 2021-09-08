import 'package:flutter/material.dart';

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
        return StepOne(_setSelectedIndex);
      case 1:
        return StepTwo(_stepVals);
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
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: _getPages(_selectedIndex) as Widget,
      ),
    );
  }
}
