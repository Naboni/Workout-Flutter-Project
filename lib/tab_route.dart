import 'package:flutter/material.dart';

//dep
import 'package:page_transition/page_transition.dart';

// import 'presentation/widgets/main_drawer.dart';
import 'presentation/screens/_routes.dart';

class TabRoute extends StatefulWidget {
  static const routeName = "tab";
  @override
  _TabState createState() => _TabState();
}

class _TabState extends State<TabRoute> {
  List<Map<String, Object>>? _pages;
  int _selectedPageIndex = 0;

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
