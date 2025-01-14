import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 283,
              height: 283,
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: ColorExtensions.black)),
            ),
            Column(
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      fontSize: 24),
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Email',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _emailController,
                ),
                const Padding(padding: EdgeInsets.only(top: 33)),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorExtensions.gray,
                    hintStyle: const TextStyle(color: ColorExtensions.black),
                    hintText: 'Password',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: ColorExtensions.purple, width: 2.0)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: ColorExtensions.lightPurple, width: 2.0)),
                  ),
                  controller: _pwdController,
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size.fromWidth(MediaQuery.of(context).size.width),
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
