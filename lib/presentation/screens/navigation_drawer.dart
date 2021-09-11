import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/user/user.dart';
import 'package:project/data/repositories/user_repository.dart';
import 'package:project/logic/bloc/auth_bloc/auth.dart';
import 'package:project/tab_route.dart';
import '/presentation/widgets/navigation/menu_item.dart';
import '/presentation/widgets/navigation/navigtion_header.dart';
import '_routes.dart';

class NavigationDrawerWidget extends StatefulWidget {
  // final User user;
  // const NavigationDrawerWidget({ Key? key }) : super(key: key);
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  late Future<User> user =
      RepositoryProvider.of<UserRepositories>(context).getCurrentUser();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
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
                      img:
                          'http://192.168.137.1:3000/api/images/${snapshot.data!.profileImage}',
                      name:
                          '${snapshot.data!.firstName} ${snapshot.data!.lastName}',
                      email: '${snapshot.data!.email}'),
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
                    Container(
                      color: Colors.transparent,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        // onTap: () => Navigator.of(context).popAndPushNamed(routeName),
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                          Navigator.of(context).popUntil((route) => route.isFirst);
                        },
                      ),
                    )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
