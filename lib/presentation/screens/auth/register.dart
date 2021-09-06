import 'dart:io';

import 'package:cool_stepper/cool_stepper.dart';
import 'package:flutter/material.dart';
import 'package:project/data/models/user/roles.dart';
import 'package:project/utils/image_input_adapter.dart';
import 'package:image_form_field/image_form_field.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRole = Roles.Trainee;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
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
                selectedRole = v;
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

    final steps = [
      CoolStep(
        title: 'Basic Information',
        subtitle: 'Please fill some of the basic information to get started',
        content: Form(
          key: _formKey,
          child: Column(
            children: [
              ImageFormField<ImageInputAdapter>(
                shouldAllowMultiple: false,
                previewImageBuilder: (_, image) => image.widgetize(),
                buttonBuilder: (_, int count) =>
                    Container(child: Text("Upload Image")),
                initializeFileAsImage: (File file) =>
                    ImageInputAdapter(file: file),
                // Even if `shouldAllowMultiple` is true, images will always be a `List` of the declared type (i.e. `ImageInputAdater`).
                onSaved: (images) {
                  // _images = images
                },
              ),
              SizedBox(height: 10),
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
          // if (!_formKey.currentState!.validate()) {
          //   return 'Fill form correctly';
          // }
          return null;
        },
      ),
      CoolStep(
        title: 'Select your role',
        subtitle: 'Select your role',
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: CoolStepper(
              showErrorSnackbar: false,
              onCompleted: () {
                print('Steps completed!');
              },
              steps: steps,
              config: CoolStepperConfig(
                backText: 'PREV',
              ),
            ),
          ),
        ),
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
