import 'package:flutter/material.dart';
// import 'package:flutter_emoji/flutter_emoji.dart';

class Gender extends StatefulWidget {
  // const Gender({Key? key}) : super(key: key);

  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
              Text(
                'What\'s your gender?',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              SizedBox(
                height: size.height * 0.18,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.cyan[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.woolha.com/media/2020/03/eevee.png'),
                                  backgroundColor: Colors.transparent,
                                  radius: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.amber[200]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // color: Colors.cyan[100],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        width: size.width * 0.4,
                        height: size.height * 0.3,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.amber[200],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {},
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 16),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://www.woolha.com/media/2020/03/eevee.png'),
                                  backgroundColor: Colors.transparent,
                                  radius: 35,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                      fontSize: 26, color: Colors.cyan[200]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // color: Colors.cyan[100],
                      ),
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
