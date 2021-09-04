import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  // const Training({Key? key}) : super(key: key);
  static const routeName = "training";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            TrainingAppBar(),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'JUMPING JACKS',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.info,
                          size: 24,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Text(
                    '07:15',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.pause),
                          Text("PAUSE"),
                        ],
                      ),
                      height: 45,
                      width: 150,
                    ),
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.03,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.skip_previous),
                              Text(
                                'Previous',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Container(
                            height: 30,
                            child: VerticalDivider(color: Colors.grey)),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.45,
                          // decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.skip_next),
                              Text(
                                'Next',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TrainingAppBar extends StatelessWidget {
  const TrainingAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/course3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 55, horizontal: 25),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TrainingIcon(Icons.video_call),
                      TrainingIcon(Icons.volume_up),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 100,
                  width: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TrainingIcon(Icons.thumb_up),
                      TrainingIcon(Icons.thumb_down)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TrainingIcon extends StatelessWidget {
  final iconData;

  TrainingIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(200),
          border: Border.all(width: 1, color: Colors.grey),
        ),
        child: Icon(
          iconData,
          size: 18,
          color: Colors.white,
        ),
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
                      image: AssetImage('assets/images/course3.jpg'))),
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
      ),
    );
  }
}
