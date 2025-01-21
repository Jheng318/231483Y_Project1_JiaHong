import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/pages/signup.dart';
import 'home.dart';
import 'package:jiahong_mad_project/data/users.dart';

class LoginPage extends StatefulWidget {
  final List<User>? users;
  const LoginPage({super.key, this.users});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? email, password;

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? password) {
    RegExp passwordRegex = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
    );
    final isPasswordValid = passwordRegex.hasMatch(password ?? '');
    if (!isPasswordValid) {
      return 'Password must be at least 8 characters, with 1 uppercase, 1 lowercase letter, and 1 digit.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: Center(
        widthFactor: MediaQuery.of(context).size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 283,
                height: 283,
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2.0, color: ColorExtensions.black)),
              ),
              const SizedBox(height: 50),
              const Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                    fontSize: 24),
              ),
              const SizedBox(height: 20),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxWidth: 284,
                          ),
                          filled: true,
                          fillColor: ColorExtensions.gray,
                          hintStyle:
                              const TextStyle(color: ColorExtensions.black),
                          hintText: 'Email',
                          contentPadding:
                              const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: ColorExtensions.purple)),
                        ),
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                      const Padding(padding: EdgeInsets.only(top: 33)),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxWidth: 284,
                          ),
                          filled: true,
                          contentPadding:
                              const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          fillColor: ColorExtensions.gray,
                          hintStyle:
                              const TextStyle(color: ColorExtensions.black),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: ColorExtensions.purple, width: 2.0)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        validator: validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // loop throught the users array and check wheher the textfield data is in the users array

                      // if the form has no error after validation
                      if (_formKey.currentState!.validate()) {
                        // save the form values int the email an password variables
                        _formKey.currentState!.save();

                        UserData data = UserData(email!, password!);
                        // to loop through the users list and check whether the details entered is in the listOfUsers list
                        // in the users.dart
                        for (final user in widget.users!) {
                          if (email == user.getEmail &&
                              password == user.getPassword) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(data: data)));
                            break;
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(284),
                        backgroundColor: ColorExtensions.purple,
                        foregroundColor: ColorExtensions.gray),
                    child: const Text('Login'),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 39)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            color: ColorExtensions.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()));
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(
                                color: ColorExtensions.purple,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
