import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/data/models/user/roles.dart';

// import 'presentation/widgets/main_drawer.dart';
import 'data/models/user/user.dart';
import 'data/repositories/user_repository.dart';
import 'logic/bloc/auth_bloc/auth.dart';
import 'presentation/screens/_routes.dart';
import 'presentation/screens/navigation_drawer.dart';

class TabRoute extends StatefulWidget {
  static const routeName = "tab";
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabRoute> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;
  late Future<User> user =
      RepositoryProvider.of<UserRepositories>(context).getCurrentUser();
  @override
  void initState() {
    _pages = [];
    user.then((value) {
      if (value.role == Roles.Trainer) {
        _pages!.add({
          'page': Home(),
        });
        _pages!.add({
          'page': MyPlan(),
        });
      }
      if (value.role == Roles.Trainee) {
        _pages!.add({
          'page': Home(),
        });
        _pages!.add({
          'page': Feeds(),
        });
      }
    });

    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var traineeBottomNav = [
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
    ];
    var trainerBottomNav = [
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
        label: "My Plan",
      ),
    ];
    return FutureBuilder(
      future: user,
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            drawer: NavigationDrawerWidget(),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: FutureBuilder(
                    future: user,
                    builder:
                        (BuildContext context, AsyncSnapshot<User> snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                            child: Text(
                          '${snapshot.data!.role![0].toUpperCase()}${snapshot.data!.role!.substring(1)}',
                          style: TextStyle(),
                        ));
                      }
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(LoggedOut());
                    },
                    icon: Icon(Icons.logout_outlined)),
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
              items: snapshot.data!.role == Roles.Trainee
                  ? traineeBottomNav
                  : trainerBottomNav,
            ),
          );
        } else {
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
