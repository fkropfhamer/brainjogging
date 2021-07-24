import 'package:flutter/material.dart';

class Headcalculation extends StatefulWidget {

  @override
  _HeadcalculationState createState() => _HeadcalculationState();
}

class _HeadcalculationState extends State<Headcalculation> {
  var task = "1 + 2 = ?";
  var score = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Headcalculation"),),
      body: ListView( children: [
        ListTile(title: Text(task),),
        TextField(
          keyboardType: TextInputType.number,
        ),
        ListTile(title: Text('Score: $score'),)
      ],),
    );
  }
}