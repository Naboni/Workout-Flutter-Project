import 'package:flutter/material.dart';
import 'package:project/tab_route.dart';
import '/presentation/widgets/navigation/menu_item.dart';
import '/presentation/widgets/navigation/navigtion_header.dart';
import '_routes.dart';

class NavigationDrawerWidget extends StatelessWidget {
  // const NavigationDrawerWidget({ Key? key }) : super(key: key);

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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    context,
                    text: 'Home',
                    icon: Icons.home,
                    routeName: TabRoute.routeName,
                  ),
                  buildMenuItem(
                    context,
                    text: 'Reminder',
                    icon: Icons.update,
                    routeName: ReminderScreen.routeName,
                  ),
                  buildMenuItem(
                    context,
                    text: 'Settings',
                    icon: Icons.settings,
                    routeName: Settings.routeName,
                  ),
                  buildMenuItem(
                    context,
                    text: 'History',
                    icon: Icons.history,
                    routeName: History.routeName,
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
}
