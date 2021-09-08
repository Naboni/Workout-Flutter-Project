import 'package:bloc/bloc.dart';
import 'package:project/logic/bloc/auth_bloc/auth.dart';
import 'package:project/data/repositories/user_repository.dart';
import 'dart:async';
import 'dart:convert';

import 'package:project/logic/bloc/register_bloc/register_event.dart';
import 'package:project/logic/bloc/register_bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepositories userRepositories = UserRepositories();
  RegisterBloc() : super(RegisterInitial());
  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterButtonPressed) {
      yield RegisterLoading();
      try {
        print(event.email);
        final user = await userRepositories.SignUp(
            role: event.role,
            email: event.email,
            firstName: event.firstName,
            lastName: event.lastName,
            password: event.password,
            age: event.age,
            profileImagePath: event.profileImagePath,
            gender: event.gender);
        print(user["status"]);
        if (user["status"] != "201") {
          yield RegisterFaliure(error: (user["message"]));
        } else {
          yield RegisterSuccess(
              email: jsonDecode(user["body"])["user"]["email"]);
        }
      } catch (error) {
        yield RegisterFaliure(error: "Unknown error occoured.");
      }
    }
  }
}
