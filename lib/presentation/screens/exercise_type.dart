import 'package:flutter/material.dart';
import 'package:project/presentation/screens/_routes.dart';

class ExerciseType extends StatelessWidget {
  // const ExerciseType({Key? key}) : super(key: key);
  static const routeName = "exercise_type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            ExerciseAppBar(),
            SizedBox(
              height: 8,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
              // margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text(
                    '10 mins ',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.brightness_1, size: 5),
                  Text(
                    ' 11 Workouts',
                    style: TextStyle(
                      // color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: Container(
                width: double.infinity,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SpecificExercise();
                    },
                    itemCount: 10,
                  ),
                ),
              ),
            ),
            Divider(),
            ExerciseFooter(),
          ],
        ),
      ),
    );
  }
}

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

class ExerciseAppBar extends StatelessWidget {
  const ExerciseAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.21,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/course1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              height: 90,
              // width: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day 1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FULL BODY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SpecificExercise extends StatelessWidget {
  const SpecificExercise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        child: Row(
          children: [
            Icon(Icons.menu),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/course1.jpg'))),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'JUMPING JACKS',
                ),
                Text(
                  '00:20',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
