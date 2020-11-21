import 'package:atfc/signin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  await Firebase.initializeApp();
  runApp(ATFC());
}

class ATFC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Atfc",
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
