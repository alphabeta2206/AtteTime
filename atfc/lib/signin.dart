import 'package:atfc/home.dart';
import 'package:atfc/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:backdrop/backdrop.dart';
import 'package:hexcolor/hexcolor.dart';
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
        appBar: BackdropAppBar(
              backgroundColor: HexColor("#FEDBD0"),
              title: Text('Login',style: TextStyle(color:HexColor("#442C2E"))),
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
                            }
                          } on FirebaseAuthException catch (error) {
                            if (error.code == 'user-not-found') {
                              Fluttertoast.showToast(
                                  msg: "No such User",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blueAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                              setState(() {
                                showProgress = false;
                              });
                            } else if (error.code == 'wrong-password') {
                              Fluttertoast.showToast(
                                  msg: "Incorrect password",
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
