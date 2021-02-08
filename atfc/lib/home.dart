import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addslot.dart';
import 'package:backdrop/backdrop.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      frontLayer: Center(
        child: DefaultTabController(
          length: 7,
          child: Scaffold(
            appBar: BackdropAppBar(
              backgroundColor: HexColor("#FEDBD0"),
              title: Text('Timetable',style: TextStyle(color:HexColor("#442C2E"))),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.calendar_today), text: 'Mon'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Tue'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Wed'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Thu'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Fri'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Sat'),
                  Tab(icon: Icon(Icons.calendar_today), text: 'Sun'),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Monday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            width: MediaQuery.of(context).size.width/1.3,
                            height: 150,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Tuesday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: 100,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Wednesday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Thursday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Friday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Saturday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(FirebaseAuth.instance.currentUser.uid)
                        .collection('Sunday')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView(
                        children: snapshot.data.docs.map((document) {
                          return Container(
                            width: MediaQuery.of(context).size.width/1.3,
                            height: MediaQuery.of(context).size.height,
                            decoration: BoxDecoration(
                            color: Colors.lightGreenAccent),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Slot Name: ${document.id}"),
                                Text("Start Time: ${document.data()['Startingtime']}"),
                                Text("End Time: ${document.data()['Endingtime']}"),
                                Text("Faculty: ${document.data()['Faculty']}"),
                                Text("ClassRoom: ${document.data()['Classroom']}"),
                                Text("Slot Type: ${document.data()['Slottype']}")
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addslot()),
            );
          },
          child: Icon(Icons.add)),
    );
  }
}
