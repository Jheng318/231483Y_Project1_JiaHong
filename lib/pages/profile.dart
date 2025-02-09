import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:jiahong_mad_project/pages/login.dart';
import 'package:provider/provider.dart';

// can ask user to add their height and weight and i can calculate the bmi
// display their account name and email
// allow users to update their height, weight, name and email
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final users = listOfUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: ColorExtensions.black,
        backgroundColor: ColorExtensions.gray,
        title: const Center(
            child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 18, color: ColorExtensions.purple),
        )),
      ),
      body: Center(child: SingleChildScrollView(
        child: Consumer<UserModel>(builder: (context, userModel, child) {
          var user = userModel.getUser;
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Username: ",
                    style: TextStyle(color: ColorExtensions.purple),
                  ),
                  Text(user!.fullName!,
                      style: const TextStyle(color: ColorExtensions.purple))
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    userModel.logout();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage(
                                  users: users,
                                )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorExtensions.purple,
                    foregroundColor: ColorExtensions.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text("Logout"),
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
