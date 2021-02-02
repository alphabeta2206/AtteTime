import 'package:flutter/material.dart';

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
  int x;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Timetable'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.calendar_view_day), text: days[0]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[1]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[2]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[3]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[4]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[5]),
                Tab(icon: Icon(Icons.calendar_view_day), text: days[6]),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(child:Text(days[0])),
              Container(child:Text(days[1])),
              Container(child:Text(days[2])),
              Container(child:Text(days[3])),
              Container(child:Text(days[4])),
              Container(child:Text(days[5])),
              Container(child:Text(days[6])),
            ],
          ),
        ),
      ),
    );
  }
}
