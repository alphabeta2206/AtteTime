import 'package:atfc/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atteface"),
        backgroundColor: Colors.green[400],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(15, 200, 15, 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Email",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () => {},
                  child: Container(
                      //height:30,
                      //width:100,
                      padding: EdgeInsets.fromLTRB(150, 15, 150, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: Text("Login"))),
              SizedBox(height: 10),        
              InkWell(
                  onTap: () => {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()))
                  },
                  child: Container(
                      //height:30,
                      //width:100,
                      padding: EdgeInsets.fromLTRB(143, 15, 143, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: Text("Register")))
            ],
          ))
    );
  }
}
