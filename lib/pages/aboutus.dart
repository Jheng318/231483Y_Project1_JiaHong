import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
// flutter email sender

class AboutusPage extends StatefulWidget {
  const AboutusPage({super.key});

  @override
  State<AboutusPage> createState() => _AboutusPageState();
}

class _AboutusPageState extends State<AboutusPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "About Us",
            style: TextStyle(
              color: ColorExtensions.purple,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 23)),
          const SizedBox(
            width: 100,
            child: Divider(
              thickness: 4,
              color: ColorExtensions.black,
            ),
          ),
          const Padding(padding: EdgeInsets.all(15)),
          const SizedBox(
            width: 320,
            child: Text(
              "Our fitness app is your personalized workout guide. We connect you with a vast library of expertly designed workout plans tailored to your fitness goals, whether you're a beginner or a seasoned athlete. Our intuitive interface allows you to easily filter plans by your preferred activity (strength training, cardio, yoga, etc.), fitness level, equipment availability, and time commitment. With our app, you'll find a workout plan that fits seamlessly into your busy life while helping you achieve your fitness aspirations.",
              textAlign: TextAlign.center,
              style: TextStyle(),
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          const Text(
            "Developer",
            style: TextStyle(
              color: ColorExtensions.purple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          const SizedBox(
            width: 50,
            child: Divider(
              thickness: 2,
              color: ColorExtensions.black,
            ),
          ),
          const Padding(padding: EdgeInsets.all(20)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage("images/profile_pic.jpeg"),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jia Hong",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: ColorExtensions.purple,
                          fontSize: 15)),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Jia Hong is a full-stack developer who works on mobile applications on the side",
                      softWrap: true,
                      overflow: TextOverflow.clip,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Contact Infromation",
            style: TextStyle(
              color: ColorExtensions.purple,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(padding: EdgeInsets.all(5)),
          const SizedBox(
            width: 150,
            child: Divider(
              thickness: 2,
              color: ColorExtensions.black,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Phone Number:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("92133981")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Email Address:"),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Fit&Me@gmail.com")
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 260,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorExtensions.purple,
            ),
            child: Column(
              children: [
                const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(35, 15, 0, 15),
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: ColorExtensions.gray,
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  width: 193,
                  child: TextField(
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      fillColor: ColorExtensions.gray,
                      hintStyle: TextStyle(color: ColorExtensions.black),
                      hintText: 'Name: ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.purple, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.lightPurple, width: 2.0)),
                    ),
                    controller: _nameController,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                  width: 193,
                  height: 30,
                  child: TextField(
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      fillColor: ColorExtensions.gray,
                      hintStyle: TextStyle(color: ColorExtensions.black),
                      hintText: 'Email: ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.purple, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.lightPurple, width: 2.0)),
                    ),
                    controller: _emailController,
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                SizedBox(
                  width: 193,
                  child: TextField(
                    decoration: const InputDecoration(
                      isDense: true,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      fillColor: ColorExtensions.gray,
                      hintStyle: TextStyle(color: ColorExtensions.black),
                      hintText: 'Feedback: ',
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.purple, width: 2.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: ColorExtensions.lightPurple, width: 2.0)),
                    ),
                    controller: _feedbackController,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(children: [
                  const SizedBox(
                    width: 22,
                  ),
                  TextButton(
                      onPressed: null,
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorExtensions.gray,
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3, horizontal: 12),
                        child: const Text(
                          "Send",
                          style: TextStyle(
                              color: ColorExtensions.purple, fontSize: 14.0),
                        ),
                      ))
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}
