import 'package:flutter/material.dart';
//models
import '../../../data/models/exercise/exercise.dart';
//screen
import '../../screens/exercise_type.dart';

class WorkoutsListItem extends StatelessWidget {
  final String title;
  final String image;
  final List<Exercise> exercises;
  WorkoutsListItem({
    Key? key,
    required this.title,
    required this.image,
    required this.exercises,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExerciseType.routeName,
          arguments: [title, image, exercises],
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        margin: EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage('$image'),
                    fit: BoxFit.cover,
                  )),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient:
                        LinearGradient(begin: Alignment.bottomRight, colors: [
                      Colors.black.withOpacity(.5),
                      Colors.black.withOpacity(.2),
                    ])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$title",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                    // Text(
                    //   "$title",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.w600),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
