import 'package:flutter/material.dart';
// import 'package:project/presentation/widgets/main_drawer.dart';

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

class Field extends StatelessWidget {
  final String labelText;
  final String hintText;
  Field(
    this.labelText,
    this.hintText,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 3,
            ),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          height: 135,
          width: 135,
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            // overflow: Overflow.visible,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/course1.jpg"),
              ),
              Positioned(
                right: -2,
                bottom: 0,
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.orange, width: 3),
                    ),
                    color: Color(0xFFF5F6F9),
                    child: Icon(Icons.edit),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
