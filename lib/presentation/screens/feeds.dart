import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  // const FeedPage({Key? key}) : super(key: key);
  static const routeName = "/feeds";

  final List<FeatureItem> items = [
    FeatureItem(
      title: 'Best Exercise',
      image: 'assets/images/course1.jpg',
    ),
    FeatureItem(
      title: 'Hell Exercise',
      image: 'assets/images/course3.jpg',
    ),
    FeatureItem(
      title: 'Great Exercise',
      image: 'assets/images/course2.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 20 * 0.75, horizontal: 20),
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
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                // width: double.infinity,
                // margin: EdgeInsets.all(15),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return FeatureItem(
                      title: items[index].title,
                      image: items[index].image,
                    );
                  },
                  itemCount: items.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String title;
  final String image;
  FeatureItem({
    Key? key,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('$image'),
                  fit: BoxFit.cover,
                )),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.5),
                    Colors.black.withOpacity(.2),
                  ])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 20,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "$title",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Add'),
                style: ElevatedButton.styleFrom(primary: Colors.orange),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$title",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$title",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
