import 'package:flutter/material.dart';
// deps
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/presentation/screens/_routes.dart';
import 'package:project/presentation/screens/reminder.dart';

// bloc
import '../../logic/bloc/auth/auth.dart';

class OptionsRoute extends StatefulWidget {
  static const routeName = '/OptionsRoute';

  @override
  _OptionsRouteState createState() => _OptionsRouteState();
}

class _OptionsRouteState extends State<OptionsRoute> {
  @override
  Widget build(BuildContext context) {
    AuthenticationBloc authBloc = BlocProvider.of<AuthenticationBloc>(context);
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: const Color(0xff7a8292),
        ),
        title: Text("Can Addis"),
        actions: [],
      ),
      body: Container(
        height: mq.height * .85,
        // color: Colors.amber,
        child: Column(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  tileBuilder(
                    context,
                    Icons.person_outline,
                    "Profile",
                    "ChecklistRoute.routeName",
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.alarm,
                    ),
                    title: Text(
                      "Reminder",
                      style: TextStyle(),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 17,
                    ),
                    onTap: () => Navigator.of(context)
                        .pushNamed(ReminderScreen.routeName),
                  ),
                  const Divider(),
                  const SizedBox(height: 50),
                  TextButton(
                    onPressed: () {
                      authBloc.add(LoggedOut());
                    },
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffebecf0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile tileBuilder(
      BuildContext context, IconData leading, String title, String routeName) {
    return ListTile(
      leading: Icon(
        leading,
      ),
      title: Text(
        title,
        style: TextStyle(),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 17,
      ),
      onTap: () => Navigator.of(context).pushNamed(routeName),
    );
  }
}
