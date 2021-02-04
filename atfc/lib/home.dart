import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'addslot.dart';

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
    return Scaffold(
        body: Center(
          child: DefaultTabController(
            length: 7,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.lightGreen,
                title: Text('Timetable'),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text("SLOT: ${document.id}"),
                                  //Text("Time: ${document.data()[Time]}"),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ),
                  Container(child: Text(days[1])),
                  Container(child: Text(days[2])),
                  Container(child: Text(days[3])),
                  Container(child: Text(days[4])),
                  Container(child: Text(days[5])),
                  Container(child: Text(days[6])),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addslot()),
                );
          },
          child:Icon(Icons.add)
        ));
  }
}
