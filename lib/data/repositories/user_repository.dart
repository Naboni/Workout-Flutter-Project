import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:project/data/dataproviders/auth.dart';
import 'package:project/data/models/user/user.dart';

class UserRepositories {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static String baseUrl = "http://192.168.137.1:3000/api";
  var loginUrl = '$baseUrl/users/login';
  User? currentUser;
  // UserRepositories() {
  //   _storage.delete(key: "user");
  //   _storage.deleteAll();
  // }
  Future<User> getCurrentUser() async {
    return User.fromJson(await _storage.read(key: "user"));
  }

  Future<bool> hasUser() async {
    var value = await _storage.read(key: "user");
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persisteUser(String user) async {
    //SAVE THE USER INSTANCE
    await _storage.write(key: "user", value: user);
  }

  //!IF YOU DECIDE TO UPDATE THIS LATTER THEN CALL CURRENT USER DELETE THE KEY FIRST
  Future<void> deleteUser() async {
    await _storage.delete(key: "user");
    await _storage.deleteAll();
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    return await AuthDataProvider.login(email, password);
  }
}
