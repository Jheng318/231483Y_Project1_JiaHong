import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.gray,
      body: SingleChildScrollView(
        child: Center(
          widthFactor: MediaQuery.of(context).size.width * 0.9,
          child: const Column(
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
              Text(
                "Our fitness app is your personalized workout guide. We connect you with a vast library of expertly designed workout plans tailored to your fitness goals, whether you're a beginner or a seasoned athlete. Our intuitive interface allows you to easily filter plans by your preferred activity (strength training, cardio, yoga, etc.), fitness level, equipment availability, and time commitment. With our app, you'll find a workout plan that fits seamlessly into your busy life while helping you achieve your fitness aspirations.",
                textWidthBasis: ,
                textAlign: TextAlign.center,
                style: TextStyle(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
