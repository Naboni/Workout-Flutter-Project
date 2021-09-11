import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Congrats extends StatelessWidget {
  const Congrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color textColor = Colors.black;
    return Scaffold(
      body: Center(
        child: Container(
            // color: Colors.red,
            child: Column(
          children: [
            Stack(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    height: size.height * 0.7,
                    // color: Colors.amber,
                    child: Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/images/finish.svg",
                          height: size.height * 0.6,
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(
                        //       top: size.height * 0.08,
                        //       left: size.height * 0.03),
                        //   child: Align(
                        //     alignment: Alignment.topLeft,
                        //     child: IconButton(
                        //       icon: Icon(Icons.arrow_back_outlined),
                        //       color: Colors.black,
                        //       onPressed: () {
                        //         print('icon button test');
                        //       },
                        //     ),
                        //   ),
                        // ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: size.height * 0.2,
                            width: size.width * 0.9,
                            // color: Colors.green,
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '11',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: textColor,
                                            )),
                                          ),
                                          Text(
                                            'Exercises',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: textColor,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '1.9',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: textColor,
                                            )),
                                          ),
                                          Text(
                                            'Kcal',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: textColor,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: FittedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '00:06',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              color: textColor,
                                            )),
                                          ),
                                          Text(
                                            'Duration',
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                              color: textColor,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width * 0.8,
              child: Container(
                child: ElevatedButton(
                  child: Text('View history'),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
