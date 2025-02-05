import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User {
  final String email;
  final String fullName;
  final String password;
  final List<String> favouriteCourse;
  final double? weight;
  final double? height;
  final double? bmi;
  String get getEmail {
    return email;
  }

  String get getPassword {
    return password;
  }

  const User(
      {required this.email,
      required this.fullName,
      required this.password,
      required this.favouriteCourse,
      this.weight,
      this.height,
      this.bmi});
}

class UserModel extends ChangeNotifier {
  User? userData;
  User? get getUser => userData;
  set setUserData(User? value) {
    userData = value;
    notifyListeners();
  }

  void updateName(String name) {}
}

class UserData {
  final String email;
  final String pwd;
  UserData(this.email, this.pwd);
}

List<User> listOfUsers() {
  return [
    const User(
        email: 'john.doe@example.com',
        fullName: 'John Doe',
        password: 'Password123@',
        favouriteCourse: []),
    const User(
        email: 'jane.smith@example.com',
        fullName: 'Jane Smith',
        password: 'secret',
        favouriteCourse: []),
    const User(
        email: 'david.lee@example.com',
        fullName: 'David Lee',
        password: 'pass456',
        favouriteCourse: []),
  ];
}
