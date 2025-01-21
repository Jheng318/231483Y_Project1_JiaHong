import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/color_extensions.dart';
import 'package:jiahong_mad_project/data/users.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final UserData? data;
  const HomePage({super.key, this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtensions.purple,
      body: Column(
        children: [
          SvgPicture.asset('assets/svgs/profile_icon.svg'),
          Image.asset('assets/svgs/superhero.jpg'),
          const Text('Hlloe world'),
        ],
      ),
    );
  }
}
