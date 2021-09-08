import 'package:flutter/material.dart';
import 'package:project/presentation/screens/profile.dart';
import '../screens/_routes.dart';

class NavigationDrawerWidget extends StatelessWidget {
  // const NavigationDrawerWidget({ Key? key }) : super(key: key);
  static final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: Colors.blueAccent,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/bg_splash.jpg'),
          fit: BoxFit.cover,
        )),
        child: ListView(
          children: [
            buildHeader(context,
                img: 'assets/images/course1.jpg',
                name: 'Xelc Temch',
                email: 'xelc@gmail.com'),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    context,
                    text: 'Reminder',
                    icon: Icons.update,
                    routeName: ReminderScreen.routeName,
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    context,
                    text: 'Settings',
                    icon: Icons.settings,
                    routeName: AddPlan.routeName,
                  ),
                  const SizedBox(height: 24),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 24),
                  buildMenuItem(
                    context,
                    text: 'Logout',
                    icon: Icons.logout_outlined,
                    routeName: '',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(
    BuildContext context, {
    required String text,
    required IconData icon,
    required String routeName,
  }) {
    final color = Colors.white;
    return Material(
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
        onTap: () => Navigator.of(context).popAndPushNamed(routeName),
      ),
    );
  }

  Widget buildHeader(
    BuildContext context, {
    required img,
    required name,
    required email,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () =>
            Navigator.of(context).popAndPushNamed(ProfileRoute.routeName),
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
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
}
