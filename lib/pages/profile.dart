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
  final formKey = GlobalKey<FormState>();

  String? name, email;
  double? height, weight, bmi;

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
          style: TextStyle(
              fontSize: 20,
              color: ColorExtensions.purple,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Center(child: SingleChildScrollView(
        child: Consumer<UserModel>(builder: (context, userModel, child) {
          var user = userModel.getUser;
          if (user != null && user.height != null && user.weight != null) {
            bmi = user.weight! / (user.height! * user.height!);
          } else {
            bmi = 0;
          }
          return Column(
            children: [
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                          ),
                          Text("Full Name:",
                              style: TextStyle(
                                  color: ColorExtensions.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: user?.fullName ?? "",
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            constraints: const BoxConstraints(
                                maxWidth: 284, maxHeight: 45),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: ColorExtensions.purple,
                                    width: 2.0))),
                        onSaved: (value) {
                          if (value != null) {
                            setState(() {
                              name = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                          ),
                          Text("Email Address:",
                              style: TextStyle(
                                  color: ColorExtensions.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: user?.email ?? "",
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            constraints: const BoxConstraints(
                                maxWidth: 284, maxHeight: 45),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: ColorExtensions.purple,
                                    width: 2.0))),
                        onSaved: (value) {
                          if (value != null) {
                            setState(() {
                              email = value;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                          ),
                          Text("Weight:",
                              style: TextStyle(
                                  color: ColorExtensions.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: user?.weight?.toString() ?? "0.00",
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            constraints: const BoxConstraints(
                                maxWidth: 284, maxHeight: 45),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: ColorExtensions.purple,
                                    width: 2.0))),
                        onSaved: (value) {
                          if (value != null) {
                            setState(() {
                              weight = double.parse(value);
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 54,
                          ),
                          Text("Height:",
                              style: TextStyle(
                                  color: ColorExtensions.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        initialValue: user?.height?.toString() ?? "0.00",
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            constraints: const BoxConstraints(
                                maxWidth: 284, maxHeight: 45),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: const BorderSide(
                                    color: ColorExtensions.purple,
                                    width: 2.0))),
                        onSaved: (value) {
                          if (value != null) {
                            setState(() {
                              height = double.parse(value);
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("BMI:",
                      style: TextStyle(
                          color: ColorExtensions.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  Text(
                      ((bmi?.isNaN == true ? 0.0 : bmi) ?? 0.0)
                          .toStringAsFixed(1),
                      style: const TextStyle(
                          color: ColorExtensions.purple,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      userModel.updateName(name ?? "");
                      userModel.updateEmail(email ?? "");
                      userModel.updateWeight(weight ?? 0.0);
                      userModel.updateHeight(height ?? 0.0);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Information Upadated')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorExtensions.purple,
                    foregroundColor: ColorExtensions.gray,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                    ),
                  ),
                  child: const Text("Save details"),
                ),
              ),
              const SizedBox(
                height: 20,
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
              const SizedBox(
                height: 20,
              )
            ],
          );
        }),
      )),
    );
  }
}
