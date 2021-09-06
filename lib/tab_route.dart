import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//dep
import 'package:page_transition/page_transition.dart';
import 'package:project/data/repositories/user_repository.dart';

// import 'presentation/widgets/main_drawer.dart';
import 'data/models/user/user.dart';
import 'logic/bloc/auth_bloc/auth.dart';
import 'presentation/screens/_routes.dart';

class TabRoute extends StatefulWidget {
  static const routeName = "tab";
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabRoute> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;
  late Future<User> user = Future<User>.delayed(const Duration(seconds: 0),
      () => RepositoryProvider.of<UserRepositories>(context).getCurrentUser());
  @override
  void initState() {
    _pages = [
      {
        'page': Home(),
        'title': 'Home',
      },
      {
        'page': Feeds(),
        'title': 'Feeds',
      },
      {
        'page': MyPlan(),
        'title': 'Feeds',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 350),
                  child: OptionsRoute(),
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LoggedOut());
              },
              icon: Icon(Icons.logout_outlined)),
          FutureBuilder(
            future: user,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.role!);
              }
              return CircularProgressIndicator();
            },
          ),
        ],
        title: Row(
          children: [
            Text(
              "CAN ",
              style: TextStyle(color: Colors.blue[700]),
            ),
            Text(
              "ADDIS",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      // drawer: Drawer(
      //   child: MainDrawer(),
      // ),
      body: _pages![_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: "Feeds",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: "My Plan",
          ),
        ],
      ),
    );
  }
}
