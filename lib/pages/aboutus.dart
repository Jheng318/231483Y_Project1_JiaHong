import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: Center(
        widthFactor: MediaQuery.of(context).size.width * 0.9,
        child: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "About Us",
                style: TextStyle(
                  color: ColorExtensions.purple,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 23)),
              SizedBox(
                width: 100,
                child: Divider(
                  thickness: 4,
                  color: ColorExtensions.black,
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              SizedBox(
                width: 320,
                child: Text(
                  "Our fitness app is your personalized workout guide. We connect you with a vast library of expertly designed workout plans tailored to your fitness goals, whether you're a beginner or a seasoned athlete. Our intuitive interface allows you to easily filter plans by your preferred activity (strength training, cardio, yoga, etc.), fitness level, equipment availability, and time commitment. With our app, you'll find a workout plan that fits seamlessly into your busy life while helping you achieve your fitness aspirations.",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Text(
                "Our Team",
                style: TextStyle(
                  color: ColorExtensions.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 50,
                child: Divider(
                  thickness: 2,
                  color: ColorExtensions.black,
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Row(
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
              SizedBox(
                height: 40,
              ),
              Text(
                "Contact Infromation",
                style: TextStyle(
                  color: ColorExtensions.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              SizedBox(
                width: 150,
                child: Divider(
                  thickness: 2,
                  color: ColorExtensions.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
