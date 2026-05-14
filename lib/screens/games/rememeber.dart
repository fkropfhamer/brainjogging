import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  const Remember({super.key});

  @override
  RememberState createState() => RememberState();
}

const fadeDurationMs = 500;
const visibleDurationMs = 200;
const pauseDurationMs = 100;
const fadeDuration = Duration(milliseconds: fadeDurationMs);
const visibleDuration =
    Duration(milliseconds: fadeDurationMs + visibleDurationMs);
const pauseDuration =
    Duration(milliseconds: fadeDurationMs + pauseDurationMs);

var random = Random();

List<int> _generateSequence() {
  List<int> seq = [];

  for (var i = 0; i < 5; i++) {
    seq.add(random.nextInt(9));
  }

  return seq;
}

class RememberState extends State<Remember> {
  var _visible = false;
  var _isRunning = false;
  var _number = 0;
  final _inputController = TextEditingController();
  var _score = 0;
  var _seqString = "";
  var _isWaitingForInput = false;
  var _wasFalse = false;
  var _wasRight = false;

  Future<void> _start() async {
    if (_isRunning) {
      return;
    }
    _isRunning = true;
    var seq = _generateSequence();
    _seqString = seq.fold<String>(
        "", (previousValue, element) => previousValue + element.toString());

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

  void _onSubmit() {
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
      Timer(Duration(seconds: 1), () {
        setState(() {
          _wasFalse = false;
        });
      });
    });
  }

  void _showRight() {
    setState(() {
      _wasRight = true;
      Timer(Duration(seconds: 1), () {
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
                style: ElevatedButton.styleFrom(backgroundColor: _getColor()),
                child: const Icon(Icons.arrow_forward_rounded),
              ),
            ),
          Center(child: Text("Score: $_score", style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
