import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  const Remember({Key? key}) : super(key: key);

  @override
  _RememberState createState() => _RememberState();
}

const fadeDurationMs = 500;
const visibleDurationMs = 200;
const pauseDurationMs = 100;
const fadeDuration = const Duration(milliseconds: fadeDurationMs);
const visibleDuration =
    const Duration(milliseconds: fadeDurationMs + visibleDurationMs);
const pauseDuration =
    const Duration(milliseconds: fadeDurationMs + pauseDurationMs);

var random = Random();

List<int> _generateSequence() {
  List<int> seq = [];

  for (var i = 0; i < 5; i++) {
    seq.add(random.nextInt(9));
  }

  return seq;
}

class _RememberState extends State<Remember> {
  var _visible = false;
  var _isRunning = false;
  var _number = 0;
  var _inputController = TextEditingController();
  var _score = 0;
  var _seqString = "";
  var _isWaitingForInput = false;
  var _wasFalse = false;
  var _wasRight = false;

  _start() async {
    if (_isRunning) {
      return;
    }
    _isRunning = true;
    var seq = _generateSequence();
    _seqString = seq.fold<String>(
        "", (previousValue, element) => previousValue + element.toString());
    print(_seqString);

    print(seq);

    for (var i = 0; i < seq.length; i++) {
      setState(() {
        _visible = true;
        _number = seq[i];
      });
      await Future.delayed(visibleDuration);
      setState(() {
        _visible = false;
      });
      await Future.delayed(pauseDuration);
    }
    setState(() {
      _isRunning = false;
      _isWaitingForInput = true;
    });
  }

  _onSubmit() {
    print(_inputController.text);
    var input = _inputController.text;
    if (input == _seqString) {
      _showRight();
      _score++;
    } else {
      _showFalse();
      _score--;
    }
    _inputController.clear();
    setState(() {
      _isWaitingForInput = false;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Remember"),
      ),
      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: fadeDurationMs),
            opacity: _visible ? 1.0 : 0.0,
            child: Center(
              child: Text(
                _number.toString(),
                style: TextStyle(fontSize: 100),
              ),
            ),
          ),
          if (!_isRunning && !_isWaitingForInput)
            ElevatedButton(
              onPressed: () => {_start()},
              child: const Text('Start'),
            ),
          if (_isWaitingForInput)
            ListTile(
              title: TextField(
                keyboardType: TextInputType.number,
                onSubmitted: (value) => _onSubmit(),
                controller: _inputController,
              ),
              trailing: ElevatedButton(
                onPressed: () => _onSubmit(),
                child: const Icon(Icons.arrow_forward_rounded),
                style: ElevatedButton.styleFrom(backgroundColor: _getColor()),
              ),
            ),
          Center(child: Text("Score: $_score", style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
