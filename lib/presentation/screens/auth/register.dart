import 'dart:io';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project/data/models/user/roles.dart';
import 'package:project/logic/bloc/register_bloc/register.dart';
import 'package:project/presentation/screens/auth/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late RegisterBloc _registerBloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _registerBloc = RegisterBloc();
  }

  final _formKeyBasic = GlobalKey<FormState>();
  final _formKeySecond = GlobalKey<FormState>();
  String selectedRole = Roles.Trainee;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String profileImagePath = "";
  String? gender = null;
  void pickImage(ImageSource source) async {
    var pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        profileImagePath = pickedImage.path;
      });
    }
  }

  Container alert({size, type, message}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: type == "success" ? Colors.green[200] : Colors.amber[200]),
      width: size.width * 0.8,
      height: size.height * 0.05,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          message,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.blue.shade700,
          )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget _buildSelector({
      BuildContext? context,
      required String name,
    }) {
      final isActive = name == selectedRole;

      return Expanded(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context!).primaryColor : null,
            border: Border.all(
              width: 0,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: RadioListTile(
            value: name,
            activeColor: Colors.white,
            groupValue: selectedRole,
            onChanged: (String? v) {
              setState(() {
                selectedRole = v!;
              });
            },
            title: Text(
              name,
              style: TextStyle(
                color: isActive ? Colors.white : null,
              ),
            ),
          ),
        ),
      );
    }

    final traineeSteps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKeyBasic,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      profileImagePath != ""
                          ? CircleAvatar(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Image.file(File(profileImagePath)),
                                clipBehavior: Clip.antiAlias,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/icons/no_user.jpg'),
                            ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[200]!),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.white),
                              )),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0)),
                                      ),
                                      child: Wrap(
                                        alignment: WrapAlignment.end,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Camera'),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.camera);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.image),
                                            title: Text('Gallery'),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.gallery);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Camera Icon.svg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              FormField(
                controller: firstNameController,
                labelText: 'First name',
                validatorMessage: 'Enter your First Name',
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              FormField(
                controller: lastNameController,
                labelText: 'Last name',
                validatorMessage: 'Enter your Last name',
              ),
              SizedBox(
                height: 10,
              ),
              FormField(
                controller: emailController,
                labelText: 'Email',
                validatorMessage: 'Enter your email',
              ),
              SizedBox(
                height: 10,
              ),
              FormField(
                controller: passwordController,
                labelText: 'Password',
                validatorMessage: 'Enter your password',
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKeyBasic.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: "Additional Information",
        subtitle: "You're almost there :)",
        content: Form(
            key: _formKeySecond,
            child: Column(
              children: [
                SizedBox(height: 10),
                FormField(
                  controller: ageController,
                  labelText: 'Age',
                  validatorMessage: 'Enter your age',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: gender,
                  isExpanded: true,
                  hint: Text(
                    "Gender",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  elevation: 0,
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'This field is required';
                    }
                  },
                ),
              ],
            )),
        validation: () {
          if (!_formKeySecond.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      )
    ];
    final trainerSteps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKeyBasic,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 40,
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      profileImagePath != ""
                          ? CircleAvatar(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Image.file(File(profileImagePath)),
                                clipBehavior: Clip.antiAlias,
                              ),
                            )
                          : CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/icons/no_user.jpg'),
                            ),
                      Positioned(
                        right: -16,
                        bottom: 0,
                        child: SizedBox(
                          height: 46,
                          width: 46,
                          child: TextButton(
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.grey[200]!),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(color: Colors.white),
                              )),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(16.0),
                                            topRight: Radius.circular(16.0)),
                                      ),
                                      child: Wrap(
                                        alignment: WrapAlignment.end,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.end,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.camera),
                                            title: Text('Camera'),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.camera);
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.image),
                                            title: Text('Gallery'),
                                            onTap: () async {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.gallery);
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: SvgPicture.asset(
                                "assets/icons/Camera Icon.svg"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              FormField(
                controller: firstNameController,
                labelText: 'First name',
                validatorMessage: 'Enter your First Name',
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
              FormField(
                controller: lastNameController,
                labelText: 'Last name',
                validatorMessage: 'Enter your Last name',
              ),
              SizedBox(
                height: 10,
              ),
              FormField(
                controller: emailController,
                labelText: 'Email',
                validatorMessage: 'Enter your email',
              ),
              SizedBox(
                height: 10,
              ),
              FormField(
                controller: passwordController,
                labelText: 'Password',
                validatorMessage: 'Enter your password',
              ),
            ],
          ),
        ),
        validation: () {
          if (!_formKeyBasic.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      ),
      CoolStep(
        title: "Additional Information",
        subtitle: "You're almost there :)",
        content: Form(
            key: _formKeySecond,
            child: Column(
              children: [
                SizedBox(height: 10),
                FormField(
                  controller: ageController,
                  labelText: 'Age',
                  validatorMessage: 'Enter your age',
                  inputType: TextInputType.number,
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  isExpanded: true,
                  hint: Text(
                    "Gender",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  elevation: 0,
                  onChanged: (String? newValue) {
                    setState(() {
                      gender = newValue!;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'This field is required';
                    }
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  controller: bioController,
                  decoration: InputDecoration(
                    labelText: "Bio",
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
                )
              ],
            )),
        validation: () {
          if (!_formKeySecond.currentState!.validate()) {
            return 'Fill form correctly';
          }
          return null;
        },
      )
    ];
    final roleChoose = [
      CoolStep(
        title: 'Select a role',
        subtitle: 'Please select a role you wish to sign up on',
        content: Container(
          child: Row(
            children: <Widget>[
              _buildSelector(
                context: context,
                name: Roles.Trainee,
              ),
              SizedBox(width: 5.0),
              _buildSelector(
                context: context,
                name: Roles.Trainer,
              ),
            ],
          ),
        ),
        validation: () {
          return null;
        },
      ),
    ];
    _onRegisterButtonPressed() {
      _registerBloc.add(RegisterButtonPressed(
          role: selectedRole,
          email: emailController.text,
          firstName: firstNameController.text,
          password: passwordController.text,
          lastName: lastNameController.text,
          bio: bioController.text,
          age: ageController.text,
          profileImagePath: profileImagePath,
          gender: gender!));
    }

    return BlocProvider(
      create: (context) => _registerBloc,
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            //TODO Find a way to give feedback
            print("Registration Loading...");
          }
          if (state is RegisterSuccess) {
            final snackBar = SnackBar(
              content: alert(
                  message: "Registration succesful.",
                  size: size,
                  type: "success"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 80),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar,
            );
            Future.delayed(Duration(seconds: 2), () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: Duration(milliseconds: 350),
                  child: Login(),
                ),
              );
            });
          }
          if (state is RegisterFaliure) {
            final snackBar = SnackBar(
              content: alert(message: state.error, size: size, type: "error"),
              backgroundColor: Colors.transparent,
              elevation: 0,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 100),
              behavior: SnackBarBehavior.floating,
              duration: Duration(seconds: 2),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              snackBar,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height - AppBar().preferredSize.height,
                      child: CoolStepper(
                        showErrorSnackbar: false,
                        onCompleted: () {
                          print('Steps completed!');
                          _onRegisterButtonPressed();
                        },
                        steps: selectedRole == Roles.Trainee
                            ? [
                                ...roleChoose,
                                ...traineeSteps,
                              ]
                            : [...roleChoose, ...trainerSteps],
                        config: CoolStepperConfig(
                            finalText: "Finish",
                            nextText: "Next",
                            backText: 'Prev',
                            stepText: "Step",
                            ofText: "of"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FormField extends StatelessWidget {
  final String labelText;
  final String validatorMessage;
  final TextEditingController controller;
  final TextInputType inputType;
  FormField({
    required this.labelText,
    required this.validatorMessage,
    required this.controller,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
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
