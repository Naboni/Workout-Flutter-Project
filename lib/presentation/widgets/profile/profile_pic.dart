import 'package:flutter/material.dart';

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
