import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/logic/bloc/auth_bloc/auth.dart';
import 'package:project/logic/bloc/login_bloc/login.dart';

import 'register.dart';

import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool isValidAccount =
      true; // if account info is valid, warning will not be displayed

  final _formKey = GlobalKey<FormState>();
  late LoginBloc loginBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginBloc = LoginBloc(authBloc: BlocProvider.of<AuthBloc>(context));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    _onLoginButtonPressed() {
      loginBloc
        ..add(LoginButtonPressed(
            email: emailController.text, password: passwordController.text));
    }

    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              color: Colors.transparent,
              // decoration: BoxDecoration(),
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
                          Icons.login,
                          color: Colors.blue,
                          size: 69.0,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Text(
                          'Login',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue.shade700,
                          )),
                        ),
                        Column(children: [
                          state is LoginFaliure
                              ? authAlert(size, state.error)
                              : SizedBox(
                                  height: size.height * 0.12,
                                ),
                          SizedBox(
                            height: size.height * 0.025,
                          ),
                        ]),
                        Padding(
                          padding: const EdgeInsets.only(left: 40.0, right: 40),
                          child: Column(children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  FormField(
                                    controller: emailController,
                                    labelText: 'Email',
                                    validatorMessage: 'Enter your email',
                                  ),
                                  FormField(
                                    controller: passwordController,
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
                                        borderRadius:
                                            new BorderRadius.circular(8.0),
                                      ),
                                      primary: Colors.blue[400]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Login',
                                        ),
                                        state is LoginLoading
                                            ? CircularProgressIndicator(
                                                color: Colors.white,
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _onLoginButtonPressed();
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
                                  'Don\'t have an account yet?',
                                  style: TextStyle(
                                    color: Colors.black54,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (ctx) => Register(),
                                    ));
                                  },
                                  child: Text(
                                    'Sign Up',
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
          ),
        ));
      },
    );
  }

  Container authAlert(Size size, String error) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.075,
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Colors.amber[200],
                ),
                width: size.width * 0.8,
                height: size.height * 0.05,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    error,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue.shade700,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
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
        // hintText: "your email",
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
