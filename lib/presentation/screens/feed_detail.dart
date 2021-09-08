import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Material(
                // elevation: 20,
                // color: Colors.amber,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 18, left: 20),
                        child: Text(
                          'Exercise Routines',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: ListView.builder(
                          padding: EdgeInsets.all(18),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
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
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Target Muscles',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Arms'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan[300],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Chest'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan[300],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Glutes'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.cyan[300],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                          ),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: () {},
                    //   child: Text('Medium'),
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Colors.amber,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8))),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Center(
                child: ElevatedButton(
                  child: const Text('Show More'),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            color: Color.fromRGBO(246, 225, 190, 0.8),
                            child: Center(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 15),
                                      child: Text(
                                        'Description',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: Text(
                                        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using  content here'
                                        'lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose injected humour and the like',
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
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
