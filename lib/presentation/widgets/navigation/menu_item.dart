import 'package:flutter/material.dart';

Widget buildMenuItem(
  BuildContext context, {
  required String text,
  required IconData icon,
  required String routeName,
}) {
  final color = Colors.white;
  return Container(
    color: Colors.transparent,
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        text,
        style: TextStyle(color: color, fontSize: 16),
      ),
      // onTap: () => Navigator.of(context).popAndPushNamed(routeName),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    ),
  );
}
