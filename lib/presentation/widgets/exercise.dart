import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/presentation/screens/exercise_type.dart';

class Exercise extends StatelessWidget {
  const Exercise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final item in items)
            ExerciseListItem(
              title: item.title,
              image: item.image,
            ),
        ],
      ),
    );
  }
}

class ExerciseListItem extends StatelessWidget {
  final String title;
  final String image;

  ExerciseListItem({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          ExerciseType.routeName,
          // arguments: exercise,
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

class ExerciseItem {
  final String title;
  final String image;
  ExerciseItem({
    required this.title,
    required this.image,
  });
}

final items = [
  ExerciseItem(
    title: 'ABS BEGINNER',
    image: 'assets/images/course1.jpg',
  ),
  ExerciseItem(
    title: 'CHEST BEGINNER',
    image: 'assets/images/course3.jpg',
  ),
  ExerciseItem(
    title: 'ARM BEGINNER',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'LEG BEGINNER',
    image: 'assets/images/course1.jpg',
  ),
  ExerciseItem(
    title: 'SHOULDER & BACK BEGINNER',
    image: 'assets/images/course3.jpg',
  ),
  ExerciseItem(
    title: 'ABS INTERMEDIATE',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'CHEST INTERMEDIATE',
    image: 'assets/images/course1.jpg',
  ),
  ExerciseItem(
    title: 'ARM INTERMEDIATE',
    image: 'assets/images/course3.jpg',
  ),
  ExerciseItem(
    title: 'LEG INTERMEDIATE',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'SHOULDER & BACK INTERMEDIATE',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'ABS ADVANCED',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'CHEST ADVANCED',
    image: 'assets/images/course1.jpg',
  ),
  ExerciseItem(
    title: 'ARM ADVANCED',
    image: 'assets/images/course3.jpg',
  ),
  ExerciseItem(
    title: 'LEG ADVANCED',
    image: 'assets/images/course2.jpg',
  ),
  ExerciseItem(
    title: 'SHOULDER & BACK ADVANCED',
    image: 'assets/images/course2.jpg',
  ),
];
