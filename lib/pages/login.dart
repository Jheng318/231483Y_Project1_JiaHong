import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'home.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatefulWidget {
  final List<User> users;
  const LoginPage({super.key, required this.users});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

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
      return 'Please enter a password with at least 8 characters with at least\n1 lowercase and uppercase letter and 1 digit';
    }

    return null;
  }

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
                            maxHeight: 35,
                          ),
                          filled: true,
                          fillColor: ColorExtensions.gray,
                          hintStyle:
                              const TextStyle(color: ColorExtensions.black),
                          hintText: 'Email',
                          contentPadding:
                              const EdgeInsets.fromLTRB(5, 10, 0, 0),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: ColorExtensions.purple, width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: ColorExtensions.purple, width: 2.0)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: Colors.redAccent, width: 2.0)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4),
                              borderSide: const BorderSide(
                                  color: Colors.redAccent, width: 2.0)),
                        ),
                        controller: _emailController,
                        validator: validateEmail,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 33)),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          constraints: const BoxConstraints(
                            maxWidth: 284,
                            maxHeight: 35,
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
                        ),
                        controller: _pwdController,
                        validator: validatePassword,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                      for (final user in widget.users) {
                        print(user.email);
                      }
                      if (_formKey.currentState!.validate()) {
                        // loop throught the users array and check wheher the textfield data is in the users array
                        UserData data = UserData(
                            _emailController.text, _pwdController.text);
                        for (final user in widget.users) {
                          if (data.email == user.getEmail &&
                              data.pwd == user.getPassword) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomePage(data: data)));
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
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
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
