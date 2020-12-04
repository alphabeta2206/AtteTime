import 'package:atfc/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: showProgress,
          child: Padding(
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
                      onTap: () async {
                        setState(() {
                          showProgress = true;
                        });
                        try {
                          final newuser =
                              await _auth.createUserWithEmailAndPassword(
                                  email: _email.text, password: _password.text);
                                  
                          if (newuser != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }
                          setState(() {
                            showProgress = false;
                          });
                        } catch (e) {}
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
        ),
      ),
    );
  }
}
