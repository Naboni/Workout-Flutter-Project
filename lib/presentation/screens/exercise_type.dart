import 'package:flutter/material.dart';

class ExerciseType extends StatelessWidget {
  // const ExerciseType({Key? key}) : super(key: key);
  static const routeName = "exercise_type";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // title: Text('exercise'),
        backgroundColor: Colors.transparent,
      ),
      // appBar: AppBar(
      //   leading: BackButton(
      //     onPressed: () {
      //       Navigator.of(context).pushNamed('/');
      //     },
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
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
                // height: MediaQuery.of(context).size.height * 0.6,
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
            height: MediaQuery.of(context).size.height * 0.07,
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
          InkWell(
            onTap: () {},
            child: Material(
                elevation: 5.0,
                shadowColor: Colors.red,
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Center(
                    child: Text(
                      'START',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
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
            // height: MediaQuery.of(context).size.height * 0.21,
            // width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/course1.jpg'),
              fit: BoxFit.cover,
            )),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       height: 20,
          //       padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          //       // color: Colors.amber,
          //       child: Icon(
          //         Icons.arrow_back,
          //         size: 30,
          //       ),
          //     ),
          //   ),
          // ),
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
