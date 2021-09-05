import 'package:flutter/material.dart';
import '../widgets/profile/profile_field.dart';
import '../widgets/profile/profile_pic.dart';

class ProfileRoute extends StatelessWidget {
  static const routeName = "profileRoute";
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text('Profile'),
      ),
      // drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfilePic(),
            SizedBox(
              height: 10,
            ),
            Text(
              'Xelc Temch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Xelc@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Field('Full Name', 'Xelc Temch'),
            Field('Email', 'xelc@gmail.com'),
            Field('Password', '165464'),
            Field('Phone', '0964648916'),
            Field('Gender', 'M'),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {},
              child: Material(
                  elevation: 10.0,
                  shadowColor: Colors.red,
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: Center(
                      child: Text(
                        'Submit',
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
      ),
    );
  }
}
