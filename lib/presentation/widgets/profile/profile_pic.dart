import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  final String imgUrl;
  const ProfilePic(
    this.imgUrl, {
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
                backgroundImage: NetworkImage(
                    'http://192.168.137.1:3000/api/images/$imgUrl'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
