import 'package:flutter/material.dart';
import '../widgets/feeds_item.dart';

class Feeds extends StatelessWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/feeds";

  final List<FeedsItem> items = [
    FeedsItem(
      title: 'Best Exercise',
      image: 'assets/images/course1.jpg',
    ),
    FeedsItem(
      title: 'Hell Exercise',
      image: 'assets/images/course3.jpg',
    ),
    FeedsItem(
      title: 'Great Exercise',
      image: 'assets/images/course2.jpg',
    ),
    FeedsItem(
      title: 'Best Exercise',
      image: 'assets/images/course1.jpg',
    ),
    FeedsItem(
      title: 'Hell Exercise',
      image: 'assets/images/course3.jpg',
    ),
    FeedsItem(
      title: 'Great Exercise',
      image: 'assets/images/course2.jpg',
    ),
    FeedsItem(
      title: 'Best Exercise',
      image: 'assets/images/course1.jpg',
    ),
    FeedsItem(
      title: 'Hell Exercise',
      image: 'assets/images/course3.jpg',
    ),
    FeedsItem(
      title: 'Great Exercise',
      image: 'assets/images/course2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              elevation: 5.0,
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 20 * 0.75, horizontal: 20),
                  fillColor: Colors.white,
                  hintText: 'Email',
                  suffixIcon: Icon(
                    Icons.search,
                    size: 25.0,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FeedsItem(
                      title: items[index].title,
                      image: items[index].image,
                    );
                  },
                  itemCount: items.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
