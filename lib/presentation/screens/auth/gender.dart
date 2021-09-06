import 'package:flutter/material.dart';
import 'package:project/data/models/user/registration_data.dart';

import 'age.dart';
// import 'package:flutter_emoji/flutter_emoji.dart';

class Gender extends StatefulWidget {
  // const Gender({Key? key}) : super(key: key);
  final RegistrationData data;
  Gender(this.data);
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late bool male = false;
  late bool female = false;
  late bool isclicked = male | female;
  @override
  // late final bool isGenderSelected;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // title: Text("AppBar"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Align(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                width: size.width * 0.8,
                child: Text(
                  'What\'s your gender?',
                  style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: size.height * 0.34,
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: male
                          ? Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.cyan),
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: size.width,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.cyan[200],
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    male = false;
                                    isclicked = false;
                                    female = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.woolha.com/media/2020/03/eevee.png'),
                                        backgroundColor: Colors.cyan[300],
                                        radius: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: size.width,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.cyan[200],
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.data.gender = 'Male';
                                    male = true;
                                    isclicked = true;
                                    female = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.woolha.com/media/2020/03/eevee.png'),
                                        backgroundColor: Colors.cyan[300],
                                        radius: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Male',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: female
                          ? Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.cyan),
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: size.width,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.cyan[200],
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    female = false;
                                    isclicked = false;
                                    male = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.woolha.com/media/2020/03/eevee.png'),
                                        backgroundColor: Colors.cyan[300],
                                        radius: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.black38),
                                  borderRadius: BorderRadius.circular(10.0)),
                              width: size.width,
                              height: size.height * 0.08,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onPrimary: Colors.cyan[200],
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.data.gender = 'Female';
                                    female = true;
                                    isclicked = true;
                                    male = false;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://www.woolha.com/media/2020/03/eevee.png'),
                                        backgroundColor: Colors.cyan[300],
                                        radius: 25,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        'Female',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              // border: Border.all(width: 1, color: Colors.cyan),
                              borderRadius: BorderRadius.circular(1000.0)),
                          width: size.width * 0.4,
                          height: size.height * 0.06,
                          child: isclicked
                              ? ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue,
                                      onPrimary: Colors.blue[200],
                                      shadowColor: Colors.blue,
                                      elevation: 0,
                                      shape: StadiumBorder()),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (ctx) => Age(
                                        data: widget.data,
                                      ),
                                    ));
                                  },
                                )
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shadowColor: Colors.white,
                                      elevation: 0,
                                      shape: StadiumBorder()),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  onPressed: null,
                                )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
