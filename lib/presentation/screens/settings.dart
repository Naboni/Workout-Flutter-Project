import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/logic/bloc/auth_bloc/auth.dart';
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
  void deleteAccountPressed() {
    BlocProvider.of<AuthBloc>(context).add(LoggedOut());
  }

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
              decoration:
                  BoxDecoration(color: Color.fromRGBO(227, 232, 246, 1)),
              child: InkWell(
                onTap: () async {
                  showDeleteAccount(context, deleteAccountPressed);

                  // await deleteAccountDialog(context);
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

  void showDeleteAccount(BuildContext context, Function deleteAccountPressed) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              children: [
                SizedBox(
                  child: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.grey,
                    size: 90.0,
                  ),
                ),
                Text(
                  'Delete Your Account?',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              'You will lose all of your data by deleting your account. This action can\'t be undone',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(253, 214, 215, 1)),
                          onPressed: () {
                            deleteAccountPressed();
                            // Navigator.pop(context, 'OK');
                          },
                          child: Text(
                            'Delete Account',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color.fromRGBO(92, 64, 51, 1)),
                              // fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(237, 242, 246, 1)),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text(
                          'Cancel',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
