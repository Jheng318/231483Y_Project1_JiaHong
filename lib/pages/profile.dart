import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>().getUser?.fullName;
    return Text(user != null ? user.toString() : 'No user found');
  }
}
// can ask user to add their height and weight and i can calculate the bmi
// display their account name and email
// allow users to update their height, weight, name and email