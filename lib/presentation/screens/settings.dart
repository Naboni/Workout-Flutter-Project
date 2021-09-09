import 'package:flutter/material.dart';
import 'package:project/presentation/screens/navigation_drawer.dart';
import 'package:project/presentation/widgets/navigation/counter_dialogue.dart';
import 'package:project/presentation/widgets/navigation/delete_account_dialogue.dart';
import 'package:project/presentation/widgets/navigation/reset_dialog.dart';

import '_routes.dart';

class Settings extends StatefulWidget {
  static const routeName = 'settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('SETTINGS'),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: InkWell(
                onTap: () async {
                  await deleteAccountDialog(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            child: Text(
                              'Delete Account.',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            child: Text(
                              "This action can't be reversed",
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 25),
                      child: Icon(Icons.restore),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      'WORKOUT',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListTile(
                      title: Text('Profile'),
                      leading: Icon(Icons.person),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileRoute()),
                        );
                      },
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListTile(
                      title: Text('Countdown Timer'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '15 secs',
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                          Icon(
                            Icons.arrow_downward_sharp,
                            color: Colors.blue,
                            size: 16,
                          ),
                        ],
                      ),
                      leading: Icon(Icons.coffee),
                      onTap: () async {
                        await counterDialog(context);
                      },
                    ),
                  ),
                  Divider(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ListTile(
                      title: Text('Reset Progress'),
                      leading: Icon(Icons.time_to_leave),
                      onTap: () async {
                        await resetDialog(context);
                      },
                    ),
                  ),
                  Divider(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
