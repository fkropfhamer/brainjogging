import 'dart:math';

import 'package:flutter/material.dart';

class Headcalculation extends StatefulWidget {

  @override
  _HeadcalculationState createState() => _HeadcalculationState();
}

class _HeadcalculationState extends State<Headcalculation> {
  _HeadcalculationState() {
    generateTask();
  }

  var _task;
  var _score = 0;
  var _random = new Random();
  var _rightResult;
  var _inputController = TextEditingController();

  void generateTask() {
    var a = _random.nextInt(100);
    var b = _random.nextInt(100);

    _task = '$a + $b = ?';
    _rightResult = a + b;
  }

  void checkInput() {
    if (int.parse(_inputController.text) == _rightResult) {
      generateTask();
      setState(() {
        _score = _score + 1;
      });
    }
    _inputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Headcalculation"),),
      body: ListView( children: [
        ListTile(title: Text(_task),),
        TextField(
          keyboardType: TextInputType.number,
          onSubmitted: (value) => checkInput(),
          controller: _inputController,
        ),
        ListTile(title: Text('Score: $_score'),)
      ],),
    );
  }
}