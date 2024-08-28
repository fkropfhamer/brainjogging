import 'dart:async';
import 'dart:math';

import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:flutter/material.dart';

class Calculate extends GameWidget {
  Calculate(
      {required Function(int score) setScore, Function()? finished})
      : super(setScore: setScore, finished: finished);

  @override
  _CalculateState createState() => _CalculateState();
}

var random = Random();

// min inclusive, max exclusive
int randomInt(int min, int max) {
  return min + random.nextInt(max - min);
}

class _CalculateState extends State<Calculate> {
  _CalculateState() {
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
      Timer(new Duration(seconds: 1), () {
        setState(() {
          _wasFalse = false;
        });
      });
    });
  }

  void _showRight() {
    setState(() {
      _wasRight = true;
      Timer(new Duration(seconds: 1), () {
        setState(() {
          _wasRight = false;
        });
      });
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

  void _increaseScore() {
    _score += 1;
    widget.setScore(_score);
  }

  void _checkInput() {
    try {
      if (int.parse(_inputController.text) == _rightResult) {
        _showRight();
        _generateTask();
        _increaseScore();
      } else {
        _showFalse();
      }
    } catch (_) {
      _showFalse();
    } finally {
      _inputController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
