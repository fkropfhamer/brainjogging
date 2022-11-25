import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Headcalculation extends StatefulWidget {

  @override
  _HeadcalculationState createState() => _HeadcalculationState();
}

var random = Random();

// min inclusive, max exclusive
int randomInt(int min, int max) {
  return min + random.nextInt(max - min);
}

class _HeadcalculationState extends State<Headcalculation> {
  _HeadcalculationState() {
    _generateTask();
  }

  var _task;
  var _score = 0;
  var _rightResult;
  var _inputController = TextEditingController();
  var _wasFalse = false;
  var _wasRight = false;

  void _generateTask() {
    var type = random.nextInt(4);
    switch (type) {
      case 0:  
        _generateAdditionTask();
        break;
      case 1:
        _generateSubtractionTask();
        break;
      case 2:
        _generateMultiplicationTask();
        break;
      case 3:
        _generateDivisionTask();
        break;
    }    
  }

  void _generateAdditionTask() {
    var a = randomInt(1, 100);
    var b = randomInt(1, 100);

    _task = '$a + $b = ?';
    _rightResult = a + b;  
  }

  void _generateSubtractionTask() {
    var a = randomInt(1, 100);
    var b = randomInt(1, 100);

    if (b > a) {
      var tmp = a;
      a = b;
      b = tmp;
    }

    _task = '$a - $b = ?';
    _rightResult = a - b;  
  }

  void _generateMultiplicationTask() {
    var a = randomInt(2, 13);
    var b = randomInt(2, 13);

    _task = '$a * $b = ?';
    _rightResult = a * b;  
  }

  void _generateDivisionTask() {
    var a = randomInt(2, 13);
    var b = randomInt(2, 13);

    var result = a * b; 

    _task = '$result / $a = ?';
    _rightResult = b;  
  }

  void _showFalse() {
    setState(() {
      _wasFalse = true;
      Timer(new Duration(seconds: 1), () { setState(() {
        _wasFalse = false;
      });});
    });
  }

  void _showRight() {
    setState(() {
      _wasRight = true;
      Timer(new Duration(seconds: 1), () { setState(() {
        _wasRight = false;
      });});
    });
  }

  MaterialColor _getColor() {
    if (_wasRight) {
      return Colors.green;
    }

    if (_wasFalse) {
      return Colors.red;
    }

    return Colors.blue;
  }

  void _checkInput() {
    try {
      if (int.parse(_inputController.text) == _rightResult) {
        _showRight();
        _generateTask();
        setState(() {
          _score = _score + 1;
        });
      } else {
        _showFalse();
      }
    } catch(_) {
      _showFalse();
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
            onSubmitted: (value) => _checkInput(),
            controller: _inputController,
          ),
          trailing: ElevatedButton(
            onPressed: () => _checkInput(),
            child: const Icon(Icons.arrow_forward_rounded),
            style: ElevatedButton.styleFrom(backgroundColor: _getColor()),
          ),
        ),
        ListTile(title: Text('Score: $_score'),)
      ],),
    );
  }
}
