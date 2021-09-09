import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/cubit/counter_cubit.dart';
import 'package:project/presentation/screens/navigation_drawer.dart';

import '_routes.dart';

class Settings extends StatefulWidget {
  // const Settings({ Key? key }) : super(key: key);
  static const routeName = 'settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future<void> counterDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
            child: X(),
          );
        });
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
        // leading: NavigationDrawerWidget(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, ProfileRoute.routeName, (route) => false);
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
                      onTap: () {},
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

class X extends StatelessWidget {
  const X({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Set Duration (10 ~ 15 secs)',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(),
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Container(
                      child: Text(
                        state.counterValue.toString(),
                        style: TextStyle(fontSize: 44),
                      ),
                    );
                  },
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(),
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
            Text(
              'secs',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'CANCEL',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'SET',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
