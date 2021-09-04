import 'package:flutter/material.dart';

// widgets
import '../../presentation/widgets/home/exercise.dart';
import '../../presentation/widgets/home/stat.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF7F6F2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mq.height * .25,
              child: Stack(
                children: [
                  Container(
                    height: mq.height * .15,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            const Color(0xFF70a8ff),
                            const Color(0xFF097bff),
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                  ),
                  Stat(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Exercise(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
