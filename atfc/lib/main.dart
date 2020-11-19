import 'package:atfc/signup.dart';
import 'package:flutter/material.dart';


void main() => runApp(MAGICUI());
class MAGICUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Magic",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Register(),
    );
  }
}