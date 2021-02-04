import 'package:flutter/material.dart';

import 'fire.dart';

class Addslot extends StatefulWidget {
  Addslot({Key key}) : super(key: key);
  @override
  _AddslotState createState() => _AddslotState();
}

class _AddslotState extends State<Addslot> {
  List<String> slottype = ["Theory", "Lab", "Additional"];
  String dropdownvalue = "Theory";
  List<String> day = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  String dropdownvalue1 = "Monday";
  TextEditingController _name = TextEditingController();
  TextEditingController _startingtime = TextEditingController();
  TextEditingController _endingtime = TextEditingController();
  TextEditingController _facultyname = TextEditingController();
  TextEditingController _classroom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(height: 150),
          DropdownButton(
            value: dropdownvalue,
            onChanged: (String value) {
              setState(() {
                dropdownvalue = value;
              });
            },
            items: slottype.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          SizedBox(height: 10),
          DropdownButton(
            value: dropdownvalue1,
            onChanged: (String value) {
              setState(() {
                dropdownvalue1 = value;
              });
            },
            items: day.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _name,
              decoration: InputDecoration(labelText: "Enter Slot name"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _startingtime,
              decoration: InputDecoration(labelText: "Enter Starting Time"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _endingtime,
              decoration: InputDecoration(labelText: "Enter Ending Time"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _facultyname,
              decoration: InputDecoration(labelText: "Enter Faculty name"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1.3,
            child: TextFormField(
              controller: _classroom,
              decoration: InputDecoration(labelText: "Enter Classroom"),
            ),
          ),
          SizedBox(height: 20),
          Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.lightGreenAccent),
              child: MaterialButton(
                onPressed: () async {
                  await add(dropdownvalue1, _name.text, _startingtime.text, _endingtime.text, 
                  _facultyname.text, _classroom.text, dropdownvalue);
                  Navigator.of(context).pop();
                },
                child: Text("Add"),
              ))
        ],
      ),
    );
  }
}
