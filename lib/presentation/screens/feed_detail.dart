import 'package:flutter/material.dart';

// widget
import '../widgets/feeds/feed_detail_header.dart';

class FeedDetail extends StatelessWidget {
  // const FeedDetail({Key? key}) : super(key: key);
  static const routeName = '/feed-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedDetailHeader(),
              Container(
                padding: EdgeInsets.only(top: 18, left: 20),
                child: Text(
                  'Exercise Routines',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  padding: EdgeInsets.all(18),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Padding(
                    padding: const EdgeInsets.only(right: 1),
                    child: AspectRatio(
                      aspectRatio: 283 / 180,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        child: Image.asset(
                          'assets/images/course1.jpg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  itemCount: 3,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  content here'
                  'lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      // fontSize: 18,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Target Muscles',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Arm, Hand, Abs',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      // fontSize: 18,
                      ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  'Meals',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Avocado, Banana, Chilli',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      // fontSize: 18,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
