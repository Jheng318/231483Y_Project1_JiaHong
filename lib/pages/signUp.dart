import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:jiahong_mad_project/pages/login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? email, fullName, password, confirmPass;

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
      return 'Please enter a password with at least 8 characters with at least\n'
          '1 lowercase and uppercase letter and 1 digit';
    }

    return null;
  }

  String? validateName(String? name) {
    RegExp nameRegex = RegExp(r'^[A-Za-z\s]+$');
    final isNameValid = nameRegex.hasMatch(name ?? '');
    if (!isNameValid) return "Please enter a valid name";
    return null;
  }

  String? validateConfirmPass(String? confirm) {
    if (confirm == null || confirm.isEmpty) {
      return "Please confirm your password";
    }
    if (confirm != _passwordController.text) {
      return "The confirm password does not match";
    }

    return null;
  }

  final users = listOfUsers();
  final _passwordController = TextEditingController();
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
                "Signup",
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
                      TextFormField(
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxWidth: 284,
                          ),
                          filled: true,
                          fillColor: ColorExtensions.gray,
                          hintStyle:
                              const TextStyle(color: ColorExtensions.black),
                          hintText: 'Full Name',
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
                        validator: validateName,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (val) {
                          setState(() {
                            fullName = val;
                          });
                        },
                      ),
                      TextFormField(
                        obscureText: false,
                        controller: _passwordController,
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
                      TextFormField(
                        obscureText: false,
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
                          hintText: 'Confirm Password',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: ColorExtensions.purple, width: 2.0)),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                        ),
                        validator: validateConfirmPass,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (val) {
                          setState(() {
                            confirmPass = val;
                          });
                        },
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // loop throught the users array and check wheher the textfield data is in the users array
                      // to check whether the user entered something into the input

                      if (_formKey.currentState!.validate()) {
                        // save the form values int the email an password variables
                        _formKey.currentState!.save();

                        User data = User(
                            email: email!,
                            fullName: fullName!,
                            password: password!,
                            favouriteCourse: []);
                        // to check if there is data that is recieved from the form an add it into the users array
                        if (data.email.isNotEmpty &&
                            data.fullName.isNotEmpty &&
                            data.password.isNotEmpty) {
                          users.add(data);

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LoginPage(users: users)));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(284),
                        backgroundColor: ColorExtensions.purple,
                        foregroundColor: ColorExtensions.gray),
                    child: const Text('Sign Up'),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account? ",
                        style: TextStyle(
                            color: ColorExtensions.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage(
                                          users: users,
                                        )));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: ColorExtensions.purple,
                                fontWeight: FontWeight.bold),
                          ))
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
