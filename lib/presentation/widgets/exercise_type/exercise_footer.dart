import 'package:flutter/material.dart';
import '../../screens/training.dart';

class ExerciseFooter extends StatelessWidget {
  const ExerciseFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.08,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              children: [
                Icon(
                  Icons.assignment_outlined,
                  size: 24,
                ),
                Text(
                  'Adjust',
                  style: TextStyle(
                    // color: Colors.white,
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                Training.routeName,
                // arguments: exercise,
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
            ),
            child: Container(
              child: Center(
                child: Text("START"),
              ),
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.7,
            ),
          ),
        ],
      ),
    );
  }
}
