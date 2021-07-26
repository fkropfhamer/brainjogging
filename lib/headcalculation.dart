import 'dart:async';
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
  var _wasFalse = false;
  var _wasRight = false;

  void generateTask() {
    var a = _random.nextInt(100);
    var b = _random.nextInt(100);

    _task = '$a + $b = ?';
    _rightResult = a + b;
  }

  void showFalse() {
    setState(() {
      _wasFalse = true;
      Timer(new Duration(seconds: 1), () { setState(() {
        _wasFalse = false;
      });});
    });
  }

  void showRight() {
    setState(() {
      _wasRight = true;
      Timer(new Duration(seconds: 1), () { setState(() {
        _wasRight = false;
      });});
    });
  }

  MaterialColor getColor() {
    if (_wasRight) {
      return Colors.green;
    }

    if (_wasFalse) {
      return Colors.red;
    }

    return Colors.blue;
  }

  void checkInput() {
    try {
      if (int.parse(_inputController.text) == _rightResult) {
        showRight();
        generateTask();
        setState(() {
          _score = _score + 1;
        });
      } else {
        showFalse();
      }
    } catch(_) {
      showFalse();
    } finally {
      _inputController.clear();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text("Headcalculation"),),
      body: ListView( children: [
        ListTile(
          title: Text(
            _task,
            style: const TextStyle(fontSize: 30),
          ),
        ),
        ListTile(
          title: TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (value) => checkInput(),
            controller: _inputController,
          ),
          trailing: ElevatedButton(
            onPressed: () => checkInput(),
            child: const Icon(Icons.arrow_forward_rounded),
            style: ElevatedButton.styleFrom(primary: getColor()),
          ),
        ),
        ListTile(title: Text('Score: $_score'),)
      ],),
    );
  }
}