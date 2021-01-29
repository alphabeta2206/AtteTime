import 'package:atfc/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String errorMessage;
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
                        if (_password.text != _confirmpassword.text) {
                          setState(() {
                            Fluttertoast.showToast(
                                msg: "Check Password",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.blueAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                        } else {
                          setState(() {
                            showProgress = true;
                          });
                          Future.delayed(const Duration(seconds: 1), () async {
                            try {
                              final newuser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: _email.text,
                                      password: _password.text);
 
                              if (newuser != null) {
                                Fluttertoast.showToast(
                                    msg: "Signup Successfull",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }
                              setState(() {
                                showProgress = false;
                              });
                            } on FirebaseAuthException catch (error) {
                              if (error.code == 'weak-password') {
                                Fluttertoast.showToast(
                                    msg: "Weak Password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  showProgress = false;
                                });
                              } else if (error.code == 'email-already-in-use') {
                                Fluttertoast.showToast(
                                    msg: "This email already exists",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueAccent,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                setState(() {
                                  showProgress = false;
                                });
                              }
                            } catch (error) {}
                          });
                        }
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
