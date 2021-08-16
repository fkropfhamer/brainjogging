import 'dart:math';
import 'package:flutter/material.dart';

class Remember extends StatefulWidget {
  const Remember({ Key? key }) : super(key: key);

  @override
  _RememberState createState() => _RememberState();
}

const fadeDurationMs = 500;
const visibileDurationMs = 200;
const pauseDurationMs = 100;
const fadeDuration = const Duration(milliseconds: fadeDurationMs);
const visibileDuration = const Duration(milliseconds: fadeDurationMs + visibileDurationMs);
const pauseDuration = const Duration(milliseconds: fadeDurationMs + pauseDurationMs);

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

  _start() async {
    if (_isRunning) {
      return;
    }
    _isRunning = true;
    var seq = _generateSequence();
    _seqString = seq.fold<String>("", (previousValue, element) => previousValue + element.toString());
    print(_seqString);

    print(seq);
  
    for (var i = 0; i < seq.length; i++) {
      setState(() {
        _visible = true;
        _number = seq[i];
      });
      await Future.delayed(visibileDuration);
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
      _score++;
    } else {
      _score--;
    }
    _inputController.clear();
    setState(() {
      _isWaitingForInput = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Remember"),),
      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: fadeDurationMs),
            opacity: _visible ? 1.0 : 0.0,
           child: Center(child: Text(_number.toString() , style: TextStyle(fontSize: 30),),),
          ),
          if (!_isRunning && !_isWaitingForInput) 
          ElevatedButton(
            onPressed: () => { _start() },
            child: const Text('Start'),
          ),
          if (_isWaitingForInput) 
          TextField(
            keyboardType: TextInputType.number,
            onSubmitted: (value) => _onSubmit(),
            controller: _inputController,
          ),
          Center(child: Text("Score: $_score", style: TextStyle(fontSize: 30))),
        ],
      ),
    );
  }
}
