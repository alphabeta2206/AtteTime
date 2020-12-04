import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  void onRegister() {}
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
                controller: _email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Email",
                ),
              ),
              SizedBox(height: 10),
              TextField(
                  controller: _password,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Password",
                  )),
              SizedBox(height: 10),
              TextField(
                  controller: _confirmpassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm Password",
                  )),
              SizedBox(height: 10),
              GestureDetector(
                  onTap: () => {
                    
                  },
                  child: Container(
                      //height:30,
                      //width:100,
                      padding: EdgeInsets.fromLTRB(150, 15, 150, 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: Text("Register"))),
            ],
          )),
    );
  }
}
