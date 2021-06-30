import "package:flutter/material.dart";
import 'package:flutter_app_animation/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Animation",
      debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}
