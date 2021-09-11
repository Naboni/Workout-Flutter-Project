import 'package:flutter/material.dart';
import 'package:project/data/models/user/user.dart';

class FeedDetailHeader extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String description;
  final User creator;
  const FeedDetailHeader(
      this.imgUrl, this.title, this.description, this.creator,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imgUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 50,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                            image: NetworkImage(
                                'http://192.168.137.1:3000/api/images/${creator.profileImage}'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(100)),
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                        child: Text(
                          '$title',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        child: const Text(
                          'Description',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                color: Color.fromRGBO(246, 225, 190, 0.8),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Text(
                                          description,
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     width: 110,
          //     padding: EdgeInsets.all(20),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           width: 30,
          //           height: 30,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(60),
          //           ),
          //           child: Icon(
          //             Icons.thumb_up,
          //             size: 20,
          //           ),
          //         ),
          //         Container(
          //           width: 30,
          //           height: 30,
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(60),
          //           ),
          //           child: Icon(
          //             Icons.thumb_down,
          //             size: 20,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
