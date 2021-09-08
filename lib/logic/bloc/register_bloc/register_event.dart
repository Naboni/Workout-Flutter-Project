import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  final String role;
  final String email;
  final String firstName;
  final String lastName;
  final String password;
  final String bio;
  final String age;
  final String gender;
  final String profileImagePath;

  RegisterButtonPressed(
      {required this.role,
      required this.email,
      required this.firstName,
      required this.password,
      required this.lastName,
      required this.bio,
      required this.age,
      required this.gender,
      required this.profileImagePath});

  @override
  List<Object> get props =>
      [role, email, firstName, lastName, bio, age, profileImagePath, gender];

  @override
  String toString() =>
      'RegisterButtonPressed {email: $email , password:$password}';
}
