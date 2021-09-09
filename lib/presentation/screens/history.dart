import 'package:flutter/material.dart';

import 'navigation_drawer.dart';

class History extends StatelessWidget {
  static const routeName = 'history';
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('HISTORY'),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              color: Colors.grey,
              height: 0.3,
            ),
            preferredSize: Size.fromHeight(1.0)),
      ),
      body: ListView.builder(
        itemBuilder: (_, index) {
          return Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.1,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: Image(
                    image: AssetImage('assets/images/ic_upper_body.png'),
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sep 9, 5:24 AM',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      Text('FULL BODY - DAY 1'),
                      Row(
                        children: [
                          Icon(
                            Icons.timer,
                            size: 14,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '00:10',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.score,
                            size: 14,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Point',
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
