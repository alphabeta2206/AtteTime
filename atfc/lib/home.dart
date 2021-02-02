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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: AppBar(
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
