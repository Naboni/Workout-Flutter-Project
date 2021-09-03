import 'package:flutter/material.dart';
import '../screens/_routes.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(IconData icon, String title, Function()? tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Xelc Temch'),
            accountEmail: Text('xelc@gmial.com'),
            currentAccountPicture: Icon(
              Icons.person,
              size: 76,
              color: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.self_improvement),
            title: Text('Profile'),
            onTap: () {
              Navigator.of(context).popAndPushNamed(ProfileRoute.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
