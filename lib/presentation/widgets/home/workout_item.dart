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
          arguments: exercises,
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
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
                child: Text(
                  "$title",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
