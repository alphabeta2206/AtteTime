import 'package:atfc/home.dart';
import 'package:atfc/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String errorMessage;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void onLogin() {}
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
                    GestureDetector(
                        onTap: () async {
                          setState(() {
                            showProgress = true;
                          });
                          try {
                            final newUser =
                                await _auth.signInWithEmailAndPassword(
                                    email: _email.text,
                                    password: _password.text);
                            print(newUser.toString());

                            if (newUser != null) {
                              Fluttertoast.showToast(
                                  msg: "Login Successfull",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blueAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                showProgress = false;
                              });

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()));
                            } else {
                              Fluttertoast.showToast(
                                  msg: "No such user found",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blueAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
                          } catch (error) {
                            switch (error.code) {
                              case "ERROR_INVALID_EMAIL":
                                errorMessage =
                                    "Your email address appears to be malformed.";
                                break;
                              case "ERROR_WRONG_PASSWORD":
                                errorMessage = "Your password is wrong.";
                                break;
                              case "ERROR_USER_NOT_FOUND":
                                errorMessage =
                                    "User with this email doesn't exist.";
                                break;
                              case "ERROR_USER_DISABLED":
                                errorMessage =
                                    "User with this email has been disabled.";
                                break;
                              case "ERROR_TOO_MANY_REQUESTS":
                                errorMessage =
                                    "Too many requests. Try again later.";
                                break;
                              case "ERROR_OPERATION_NOT_ALLOWED":
                                errorMessage =
                                    "Signing in with Email and Password is not enabled.";
                                break;
                              default:
                                errorMessage = "An undefined Error happened.";
                            }
                          }
                          if (errorMessage != null) {
                            return Future.error(errorMessage);
                          }

                        },
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()))
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
                )),
          ),
        ));
  }
}
