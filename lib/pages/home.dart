import 'package:flutter/material.dart';
import 'package:jiahong_mad_project/data/users.dart';

class HomePage extends StatefulWidget {
  final UserData data;
  const HomePage({super.key, required this.data});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("hello data ${widget.data.email} and ${widget.data.pwd}"),
    );
  }
}
