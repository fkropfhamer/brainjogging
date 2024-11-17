import 'dart:async';

import 'package:brainjogging/widgets/games/game_widget.dart';
import 'package:brainjogging/widgets/number_keyboard.dart';
import 'package:flutter/material.dart';

import '../../util.dart';

class Calculate extends GameWidget {
  Calculate(
      {required Function(int score) setScore, Function()? finished})
      : super(setScore: setScore, finished: finished);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  _CalculateState() {
    _generateTask();
  }

  var _input = "";
  var _task;
  var _score = 0;
  var _rightResult;
  var _wasFalse = false;
  var _wasRight = false;

  void _generateTask() {
    final type = randomInt(max: 4);
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
    final a = randomInt(min: 1, max: 100);
    final b = randomInt(min: 1, max: 100);

    _task = '$a + $b = ?';
    _rightResult = a + b;
  }

  void _generateSubtractionTask() {
    var a = randomInt(min: 1, max: 100);
    var b = randomInt(min: 1, max: 100);

    if (b > a) {
      final tmp = a;
      a = b;
      b = tmp;
    }

    _task = '$a - $b = ?';
    _rightResult = a - b;
  }

  void _generateMultiplicationTask() {
    final a = randomInt(min: 2, max: 13);
    final b = randomInt(min: 2, max: 13);

    _task = '$a * $b = ?';
    _rightResult = a * b;
  }

  void _generateDivisionTask() {
    final a = randomInt(min: 2, max: 13);
    final b = randomInt(min: 2, max: 13);

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

  Color _getColor() {
    if (_wasRight) {
      return Colors.green;
    }

    if (_wasFalse) {
      return Colors.red;
    }

    return Colors.white;
  }

  void _increaseScore() {
    _score += 1;
    widget.setScore(_score);
  }

  void _checkInput() {
    try {
      if (int.parse(_input) == _rightResult) {
        _showRight();
        _generateTask();
        _increaseScore();
      } else {
        _showFalse();
      }
    } catch (_) {
      _showFalse();
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
        Container(color: _getColor(), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Text(_input)],),),
        NumberKeyboard(onChange: (number) { setState(() {
          _input = number;
        });}, onSubmit: (number) {
          _checkInput();
        },)
      ],
    );
  }
}
