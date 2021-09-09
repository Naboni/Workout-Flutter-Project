import '../../../presentation/screens/_routes.dart';
import 'package:flutter/material.dart';

Widget buildHeader(
  BuildContext context, {
  required img,
  required name,
  required email,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, ProfileRoute.routeName, (route) => false);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20)
            .add(EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(img),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
