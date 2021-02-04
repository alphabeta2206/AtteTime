import 'package:flutter/material.dart';

class Addslot extends StatefulWidget {
  Addslot({Key key}) : super(key: key);
  @override
  _AddslotState createState() => _AddslotState();
}

class _AddslotState extends State<Addslot> {
  List<String> slottype = ["Theory", "Lab", "Additional"];
  String dropdownvalue = "Theory";
  TextEditingController _name = TextEditingController();
  TextEditingController _time = TextEditingController();
  TextEditingController _facultyname = TextEditingController();
  TextEditingController _classroom = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
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
              controller: _time,
              decoration: InputDecoration(labelText: "Enter Slot Timing"),
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
          Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.lightGreenAccent),
              child: MaterialButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text("Add"),
              ))
        ],
      ),
    );
  }
}
