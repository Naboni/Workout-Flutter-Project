import 'package:flutter/material.dart';

class MyPlan extends StatefulWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/myplan";

  @override
  _MyPlanState createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  // global key to identify the form and for validation
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormField(
                    icon: Icons.person,
                    hintText: 'Enter your workout name',
                    labelText: 'Workout Name',
                    validatorMessage: 'Please enter some text',
                  ),
                  FormField(
                    icon: Icons.date_range,
                    hintText: 'Enter target age range',
                    labelText: 'Age Range',
                    validatorMessage: 'Please enter age range. E.g. 18-27',
                  ),
                  FormField(
                    icon: Icons.face,
                    hintText: 'Enter target gender',
                    labelText: 'Target Gender',
                    validatorMessage: 'Please choose',
                  ),
                  FormField(
                    icon: Icons.video_camera_front,
                    hintText: 'Enter steps of workout, gif or video',
                    labelText: 'Workout Video',
                    validatorMessage: 'Please enter valid file',
                  ),
                  FormField(
                    icon: Icons.food_bank,
                    hintText: 'Enter meals necessary for the exercise',
                    labelText: 'Meals',
                    validatorMessage: 'Please enter meals',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                  ),
                  child: Container(
                    child: Center(
                      child: Text("SUBMIT"),
                    ),
                    height: 45,
                    width: 150,
                  ),
                ),
              )
            ],
          ),
        ),
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
