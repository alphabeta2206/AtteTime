import 'package:atfc/signin.dart';
import 'package:atfc/signup.dart';
import 'package:flutter/material.dart';


void main() async => runApp(ATFC());
class ATFC extends StatelessWidget {
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
      home: Login(),
    );
  }
}