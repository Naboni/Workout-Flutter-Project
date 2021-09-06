import 'package:flutter/material.dart';
import 'package:project/data/models/user/registration_data.dart';

import 'package:project/presentation/screens/auth/gender.dart';

import 'login.dart';

import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(password.value);
    final newRegData = new RegistrationData();
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.8),
            ),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.12,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Icon(
                    Icons.app_registration,
                    color: Colors.blue,
                    size: 69.0,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Register',
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue.shade700,
                    )),
                  ),
                  SizedBox(
                    height: size.height * 0.14,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Column(children: [
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormField(
                              controller: username,
                              labelText: 'Username',
                              validatorMessage: 'Enter your username',
                            ),
                            FormField(
                              controller: password,
                              labelText: 'Password',
                              validatorMessage: 'Enter your password',
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0, right: 40),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(8.0),
                                ),
                                primary: Colors.blue[400]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                'Login',
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  newRegData.username = username.text;
                                  newRegData.password = password.text;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Gender(newRegData),
                                  ),
                                );
                                print('-------------------');
                                print(newRegData.username);
                                print(newRegData.password);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Login(),
                              ));
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[400]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class FormField extends StatelessWidget {
  final String labelText;
  final String validatorMessage;

  final TextEditingController controller;

  FormField({
    required this.labelText,
    required this.validatorMessage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.blue[400]),
        // hintText: "your username",
        hintStyle: TextStyle(fontSize: 14, color: Colors.black26),
        enabledBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: new UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade400),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
    );
  }
}
