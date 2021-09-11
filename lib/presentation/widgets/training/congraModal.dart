import 'package:flutter/material.dart';
// deps
import 'package:lottie/lottie.dart';

class CongraModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: Lottie.asset(
                  'assets/anim/workouts/trophy-congratulation.json'),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Congrats",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 25.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // var count = 0;
                      // Navigator.popUntil(context, (route) {
                      //   return count++ == 2;
                      // });
                      Navigator.pushNamed(context, 'history');
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.arrow_forward_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
