import 'package:flutter/material.dart';

class User {
  String? email;
  String? fullName;
  String? password;
  List<String>? favouriteWorkouts;
  double? weight;
  double? height;
  double? bmi;
  String? get getEmail {
    return email;
  }

  String? get getPassword {
    return password;
  }

  User(
      {this.email,
      this.fullName,
      this.password,
      this.favouriteWorkouts,
      this.weight,
      this.height,
      this.bmi});
}

class UserModel extends ChangeNotifier {
  User? userData;
  User? get getUser => userData;
  void setUserData(User? value) {
    userData = value;
    notifyListeners();
  }

  void updateName(String name) async {
    userData?.fullName = name;
    notifyListeners();
  }

  void updateEmail(String email) async {
    userData?.email = email;
    notifyListeners();
  }

  void updateWeight(double newweight) async {
    userData?.weight = newweight;
    notifyListeners();
  }

  void updateHeight(double newHeight) async {
    userData?.height = newHeight;
    notifyListeners();
  }

  void addWorkout(String workoutname) async {
    userData?.favouriteWorkouts?.add(workoutname);
    notifyListeners();
  }

  void removeWorkout(String workoutname) async {
    userData?.favouriteWorkouts?.remove(workoutname);
    notifyListeners();
  }
}

List<User> listOfUsers() {
  return [
    User(
        email: 'john.doe@example.com',
        fullName: 'John Doe',
        password: 'Password123@',
        favouriteWorkouts: []),
    User(
        email: 'jane.smith@example.com',
        fullName: 'Jane Smith',
        password: 'secret',
        favouriteWorkouts: []),
    User(
        email: 'david.lee@example.com',
        fullName: 'David Lee',
        password: 'pass456',
        favouriteWorkouts: []),
  ];
}
