import 'package:flutter/material.dart';

class SetGoal extends StatelessWidget {
  static const routeName = 'setGoal';
  const SetGoal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_splash.jpg'),
                fit: BoxFit.cover),
          ),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 15, right: 15, top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set your weekly goals",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "We recommend training at least 3 days weekly for a better result.",
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  child: Container(
                      height: 50, child: Center(child: Text("SAVE")))),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
