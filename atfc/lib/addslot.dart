import 'package:flutter/material.dart';

class Addslot extends StatefulWidget {
  Addslot({Key key}) : super(key: key);

  @override
  _AddslotState createState() => _AddslotState();
}
class _AddslotState extends State<Addslot> {
  List<String> slottype = ["Theory", "Lab"];
  String dropwdownvalue = "Theory";
  TextEditingController _name = TextEditingController();
  TextEditingController _time = TextEditingController();
  TextEditingController _facultyname = TextEditingController();
  TextEditingController _classroom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
