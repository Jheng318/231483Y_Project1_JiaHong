import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:jiahong_mad_project/pages/login.dart';

class UserSignup {
  final String email;
  final String name;
  final String pwd;
  final String confirm;
  UserSignup(this.email, this.name, this.pwd, this.confirm);
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
  // shared preferences
  // must parse the data from the signup to the login
  final users = listOfUsers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: SingleChildScrollView(
        child: Center(
          widthFactor: MediaQuery.of(context).size.width * 0.9,
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
              SizedBox(
                width: 284,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _emailController,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 33)),
              SizedBox(
                width: 284,
                height: 35,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Full Name',
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _nameController,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 33)),
              SizedBox(
                width: 284,
                height: 35,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _pwdController,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 33)),
              SizedBox(
                width: 284,
                height: 35,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Confirm Password',
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _confirmController,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // loop throught the users array and check wheher the textfield data is in the users array
                      UserSignup data = UserSignup(
                          _emailController.text,
                          _nameController.text,
                          _pwdController.text,
                          _confirmController.text);

                      // to check whether the user entered something into the input
                      if (data.email.isNotEmpty &&
                          data.name.isNotEmpty &&
                          data.pwd.isNotEmpty &&
                          data.confirm.isNotEmpty) {
                        // to create a new User and
                        User newUser = User(
                            email: data.email,
                            fullName: data.name,
                            password: data.pwd);
                        // add new user to the end of the array
                        users.add(newUser);
                        // switch to the login page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage(users: users)));
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 283,
              height: 283,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: ColorExtensions.black)),
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
            SizedBox(
              width: 284,
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorExtensions.gray,
                  hintStyle: const TextStyle(color: ColorExtensions.black),
                  hintText: 'Email',
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: ColorExtensions.purple, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: ColorExtensions.lightPurple, width: 2.0)),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 33)),
            SizedBox(
              width: 284,
              height: 35,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorExtensions.gray,
                  hintStyle: const TextStyle(color: ColorExtensions.black),
                  hintText: 'Password',
                  contentPadding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: ColorExtensions.purple, width: 2.0)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                          color: ColorExtensions.lightPurple, width: 2.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size.fromWidth(284),
                      backgroundColor: ColorExtensions.purple,
                      foregroundColor: ColorExtensions.gray),
                  child: const Text('Login'),
                ),
                const Padding(padding: EdgeInsets.only(top: 39)),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: ColorExtensions.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "SignUp",
                      style: TextStyle(
                          color: ColorExtensions.purple,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
